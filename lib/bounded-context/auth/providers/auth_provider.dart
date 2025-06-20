import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user/user_model.dart';
import '../../../data/services/token/token_service.dart';
import '../../../data/services/user/user_service.dart';
import '../../../domain/entities/user/user.dart';
import '../services/auth_service.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    ref.watch(authServiceProvider),
    ref.watch(userServiceProvider),
    ref.watch(tokenServiceProvider),
  );
});

enum AuthStatus {
  initial,
  checking,
  authenticated,
  unauthenticated,
}

class AuthState {
  final AuthStatus status;
  final User? user;
  final String? error;

  AuthState({
    this.status = AuthStatus.initial,
    this.user,
    this.error,
  });

  bool get isAuthenticated => status == AuthStatus.authenticated;

  AuthState copyWith({
    AuthStatus? status,
    User? user,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthService _authService;
  final UserService _userService;
  final TokenService _tokenService;

  AuthNotifier(
      this._authService,
      this._userService,
      this._tokenService,
      ) : super(AuthState());

  Future<void> checkAuthStatus() async {
    print('🔍 INICIO checkAuthStatus');
    state = state.copyWith(status: AuthStatus.checking);
    print('🔍 Estado cambiado a checking');

    try {
      print('🔍 Verificando token...');
      final hasToken = await _tokenService.hasValidToken();
      print('🔍 hasToken: $hasToken');

      if (!hasToken) {
        print('🔍 No token, marcando unauthenticated');
        state = state.copyWith(status: AuthStatus.unauthenticated);
        return;
      }

      print('🔍 Obteniendo perfil...');
      final userModel = await _userService.getProfile();
      print('🔍 Perfil obtenido');
      final user = userModel.toEntity();

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
      );
      print('🔍 Estado cambiado a authenticated');
    } catch (e) {
      print('❌ ERROR en checkAuthStatus: $e');
      await _tokenService.clearTokens();
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: e.toString(),
      );
    }
  }


  Future<void> signIn(String identifier, String password) async {
    state = state.copyWith(status: AuthStatus.checking);

    try {
      final request = SignInRequestModel(
        identifier: identifier,
        password: password,
      );

      final response = await _authService.signIn(request);

      await _tokenService.saveTokens(
        accessToken: response.accessToken,
      );

      final user = response.user.toEntity();

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: _handleError(e),
      );
      rethrow;
    }
  }

  Future<void> signUp({
    required String username,
    required String email,
    required String password,
    String? role,
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phone,
    String? school,
    int? grade,
    String? bio,
  }) async {
    state = state.copyWith(status: AuthStatus.checking);

    try {
      final request = SignUpRequestModel(
        username: username,
        email: email,
        password: password,
        role: role,
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        phone: phone,
        school: school,
        grade: grade,
        bio: bio,
      );

      final response = await _authService.signUp(request);

      await _tokenService.saveTokens(
        accessToken: response.accessToken,
      );

      final user = response.user.toEntity();

      state = state.copyWith(
        status: AuthStatus.authenticated,
        user: user,
        error: null,
      );
    } catch (e) {
      state = state.copyWith(
        status: AuthStatus.unauthenticated,
        error: _handleError(e),
      );
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _tokenService.clearTokens();
    state = AuthState(status: AuthStatus.unauthenticated);
  }

  Future<void> updateProfile({
    String? firstName,
    String? lastName,
    DateTime? dateOfBirth,
    String? phone,
    String? school,
    int? grade,
    String? bio,
  }) async {
    try {
      final request = UpdateProfileRequestModel(
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        phone: phone,
        school: school,
        grade: grade,
        bio: bio,
      );

      final userModel = await _userService.updateProfile(request);
      final user = userModel.toEntity();

      state = state.copyWith(user: user);
    } catch (e) {
      state = state.copyWith(error: _handleError(e));
      rethrow;
    }
  }

  String _handleError(dynamic error) {
    if (error.toString().contains('401')) {
      return 'Credenciales incorrectas';
    } else if (error.toString().contains('409')) {
      return 'El usuario ya existe';
    } else if (error.toString().contains('Network')) {
      return 'Error de conexión';
    }
    return 'Ocurrió un error inesperado';
  }
}

final currentUserProvider = Provider<User?>((ref) {
  return ref.watch(authStateProvider).user;
});

final isAuthenticatedProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).status == AuthStatus.authenticated;
});

final isLoadingAuthProvider = Provider<bool>((ref) {
  return ref.watch(authStateProvider).status == AuthStatus.checking;
});