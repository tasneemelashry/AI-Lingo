import 'dart:async';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/features/auth/data/auth_repository.dart';
import 'package:ai_lingo/features/auth/screens/check_email_screen.dart';
import 'package:ai_lingo/features/auth/screens/forgot_password_screen.dart';
import 'package:ai_lingo/features/auth/screens/login_screen.dart';
import 'package:ai_lingo/features/auth/screens/sign_up_screen.dart';
import 'package:ai_lingo/features/home/screens/home_screen.dart';
import 'package:ai_lingo/features/onboarding/screens/splash_screen.dart';
import 'package:ai_lingo/features/onboarding/screens/welcome_screen.dart';
import 'package:ai_lingo/features/setup/screens/setup_screen.dart';
import 'package:flutter/material.dart';

class AppRouter {
  AppRouter(this.authRepository) {
    subscription = authRepository.authStateChanges.listen((_) => refresh());
  }

  final AuthRepository authRepository;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final RouteTracker tracker = RouteTracker();
  late final StreamSubscription<Object?> subscription;

  List<Route<dynamic>> generateInitialRoutes(String name) => [
    generateRoute(RouteSettings(name: name)),
  ];

  Route<dynamic> generateRoute(RouteSettings settings) {
    final target = redirect(settings.name);
    final resolved = target == null
        ? settings
        : RouteSettings(name: target);
    return MaterialPageRoute<void>(
      settings: resolved,
      builder: (context) => buildScreen(resolved),
    );
  }

  Widget buildScreen(RouteSettings settings) {
    return switch (settings.name) {
      Routes.splash => const SplashScreen(),
      Routes.welcome => const WelcomeScreen(),
      Routes.login => const LoginScreen(),
      Routes.signUp => const SignUpScreen(),
      Routes.forgotPassword => const ForgotPasswordScreen(),
      Routes.checkEmail => CheckEmailScreen(
        args: settings.arguments is CheckEmailArgs
            ? settings.arguments as CheckEmailArgs
            : CheckEmailArgs(
                email: authRepository.currentUser?.email ?? '',
                type: CheckEmailType.verification,
                next: Routes.home,
              ),
      ),
      Routes.setup => const SetupScreen(),
      Routes.home => const HomeScreen(),
      _ => const WelcomeScreen(),
    };
  }

  String? redirect(String? name) {
    if (!Routes.protected.contains(name)) return null;
    final user = authRepository.currentUser;
    if (user == null) return Routes.welcome;
    if (!user.emailVerified) return Routes.checkEmail;
    return null;
  }

  void refresh() {
    final target = redirect(tracker.current);
    if (target == null) return;
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      target,
      (route) => false,
    );
  }

  void dispose() {
    subscription.cancel();
  }
}

class RouteTracker extends NavigatorObserver {
  String? current;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    current = route.settings.name;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    current = previousRoute?.settings.name;
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    current = newRoute?.settings.name;
  }
}
