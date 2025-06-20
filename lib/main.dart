import 'package:aptitude_pro_app/bounded-context/auth/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/services.dart';
import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(
    ProviderScope(
      child: Consumer(
        builder: (context, ref, _) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ref.read(authStateProvider.notifier).checkAuthStatus();
          });
          return const AptitudeProApp();
        },
      ),
    ),
  );
}