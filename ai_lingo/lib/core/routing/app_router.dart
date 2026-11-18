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
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  AppRouter(this.authRepository)
    : refresh = StreamListenable(authRepository.authStateChanges) {
    router = GoRouter(
      initialLocation: Routes.splash,
      refreshListenable: refresh,
      redirect: redirect,
      routes: [
        GoRoute(
          path: Routes.splash,
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          path: Routes.welcome,
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          path: Routes.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: Routes.signUp,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: Routes.forgotPassword,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
        GoRoute(
          path: Routes.checkEmail,
          builder: (context, state) {
            final extra = state.extra;
            return CheckEmailScreen(
              args: extra is CheckEmailArgs
                  ? extra
                  : CheckEmailArgs(
                      email: authRepository.currentUser?.email ?? '',
                      type: CheckEmailType.verification,
                      next: Routes.home,
                    ),
            );
          },
        ),
        GoRoute(
          path: Routes.setup,
          builder: (context, state) => const SetupScreen(),
        ),
        GoRoute(
          path: Routes.home,
          builder: (context, state) => const HomeScreen(),
        ),
      ],
    );
  }

  final AuthRepository authRepository;
  final StreamListenable refresh;
  late final GoRouter router;

  String? redirect(BuildContext context, GoRouterState state) {
    if (!Routes.protected.contains(state.matchedLocation)) return null;
    final user = authRepository.currentUser;
    if (user == null) return Routes.welcome;
    if (!user.emailVerified) return Routes.checkEmail;
    return null;
  }

  void dispose() {
    router.dispose();
    refresh.dispose();
  }
}

class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<Object?> stream) {
    subscription = stream.listen((_) => notifyListeners());
  }

  late final StreamSubscription<Object?> subscription;

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }
}
