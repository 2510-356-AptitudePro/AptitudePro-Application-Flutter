import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../bounded-context/auth/providers/auth_provider.dart';
import '../../bounded-context/auth/screens/sign_in_screen.dart';

import '../../bounded-context/auth/screens/sign_up_screen.dart';
import '../../bounded-context/auth/screens/welcome_screen.dart';
import '../../bounded-context/careers/screens/career_detail_screen.dart';
import '../../bounded-context/careers/screens/careers_list_screen.dart';
import '../../bounded-context/consultations/screens/consultation_detail_screen.dart';

import '../../bounded-context/consultations/screens/consultations_list_screen.dart';
import '../../bounded-context/consultations/screens/schedule_consultation_screen.dart';
import '../../bounded-context/forums/screens/forum_detail_screen.dart';
import '../../bounded-context/forums/screens/forums_list_screen.dart';
import '../../bounded-context/profile/screens/profile_screen.dart';
import '../../bounded-context/tests/screens/test_taking_screen.dart';
import '../../presentation/screens/home/home_screen.dart';

import '../../presentation/screens/main/main_screen.dart';
import '../../bounded-context/profile/screens/edit_profile_screen.dart';

import '../../bounded-context/results/screens/result_detail_screen.dart';
import '../../bounded-context/results/screens/results_list_screen.dart';
import '../../bounded-context/tests/screens/test_list_screen.dart';
import '../../bounded-context/tests/screens/test_detail_screen.dart';

import '../../bounded-context/teachers/views/ListStudents.dart';

import '../constants/app_colors.dart';
import '../constants/app_sizes.dart';



final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.read(authStateProvider);

  return GoRouter(
    initialLocation: authState.isAuthenticated ? '/' : '/welcome',

    routes: [
      // ✅ ELIMINADO: La ruta duplicada que causaba el problema
      // GoRoute(
      //   path: '/consultations/:consultationId',
      //   builder: (context, state) => ConsultationDetailScreen(
      //     consultationId: state.pathParameters['consultationId']!,
      //   ),
      // ),

      GoRoute(
        path: '/welcome',
        builder: (context, state) => const WelcomeScreen(),
      ),
      // Auth Routes
      GoRoute(
        path: '/auth/signin',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: '/auth/signup',
        builder: (context, state) => const SignUpScreen(),
      ),

      // Main Routes with Bottom Navigation
      ShellRoute(
        builder: (context, state, child) => MainScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/teachers',
            builder: (context, state) => const Liststudents(),
          ),
          GoRoute(
            path: '/tests',
            builder: (context, state) => const TestListScreen(),
            routes: [
              GoRoute(
                path: ':testId',
                builder: (context, state) {
                  final testId = state.pathParameters['testId']!;
                  return TestDetailScreen(testId: testId);
                },
                routes: [
                  GoRoute(
                    path: 'take',
                    builder: (context, state) {
                      final testId = state.pathParameters['testId']!;
                      return TestTakingScreen(testId: testId);
                    },
                  ),
                ],
              ),
            ],
          ),
          GoRoute(
            path: '/results',
            builder: (context, state) => const ResultsListScreen(),
            routes: [
              GoRoute(
                path: ':resultId',
                builder: (context, state) {
                  final resultId = state.pathParameters['resultId']!;
                  return ResultDetailScreen(resultId: resultId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/careers',
            builder: (context, state) => const CareersListScreen(),
            routes: [
              GoRoute(
                path: ':careerId',
                builder: (context, state) {
                  final careerId = state.pathParameters['careerId']!;
                  return CareerDetailScreen(careerId: careerId);
                },
              ),
            ],
          ),
          GoRoute(
            path: '/profile',
            builder: (context, state) => const ProfileScreen(),
            routes: [
              GoRoute(
                path: 'edit',
                builder: (context, state) => const EditProfileScreen(),
              ),
            ],
          ),
        ],
      ),

      // ✅ CORREGIDO: Rutas de consultas consolidadas en un solo lugar
      GoRoute(
        path: '/consultations',
        builder: (context, state) => const ConsultationsListScreen(),
        routes: [
          // ✅ IMPORTANTE: Ruta específica ANTES de la ruta con parámetro
          GoRoute(
            path: 'schedule',
            builder: (context, state) => const ScheduleConsultationScreen(),
          ),
          // ✅ AGREGADO: Ruta para detalles de consulta con validación
          GoRoute(
            path: ':consultationId',
            builder: (context, state) {
              final consultationId = state.pathParameters['consultationId']!;

              // ✅ Validación: Verificar que sea un UUID válido
              if (!_isValidUUID(consultationId)) {
                // Si no es válido, redirigir a la lista de consultas
                return const ConsultationsListScreen();
              }

              return ConsultationDetailScreen(
                consultationId: consultationId,
              );
            },
          ),
        ],
      ),

      GoRoute(
        path: '/forums',
        builder: (context, state) => const ForumsListScreen(),
        routes: [
          GoRoute(
            path: ':forumId',
            builder: (context, state) {
              final forumId = state.pathParameters['forumId']!;
              return ForumDetailScreen(forumId: forumId);
            },
          ),
        ],
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error,
            ),
            const SizedBox(height: AppSizes.md),
            Text(
              'Página no encontrada',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: AppSizes.sm),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Ir al inicio'),
            ),
          ],
        ),
      ),
    ),
  );
});

// ✅ AGREGADO: Función para validar UUID
bool _isValidUUID(String id) {
  final uuidRegex = RegExp(
      r'^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
  );
  return uuidRegex.hasMatch(id);
}

// Route names for easy navigation
class AppRoutes {
  static const String splash = '/splash';
  static const String signIn = '/auth/signin';
  static const String signUp = '/auth/signup';
  static const String home = '/';
  static const String tests = '/tests';
  static const String testDetail = '/tests/:testId';
  static const String testTaking = '/tests/:testId/take';
  static const String results = '/results';
  static const String resultDetail = '/results/:resultId';
  static const String careers = '/careers';
  static const String careerDetail = '/careers/:careerId';
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String consultations = '/consultations';
  static const String scheduleConsultation = '/consultations/schedule';
  static const String consultationDetail = '/consultations/:consultationId'; // ✅ AGREGADO
  static const String forums = '/forums';
  static const String forumDetail = '/forums/:forumId';
}