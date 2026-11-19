import 'package:ai_lingo/core/routing/app_router.dart';
import 'package:ai_lingo/core/routing/routes.dart';
import 'package:ai_lingo/core/theme/app_theme.dart';
import 'package:ai_lingo/features/auth/data/auth_repository.dart';
import 'package:ai_lingo/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class App extends StatefulWidget {
  const App({super.key, required this.authRepository});

  final AuthRepository authRepository;

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AppRouter appRouter = AppRouter(widget.authRepository);

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(widget.authRepository),
      child: ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'AI-Lingo',
          theme: AppTheme.light,
          navigatorKey: appRouter.navigatorKey,
          navigatorObservers: [appRouter.tracker],
          initialRoute: Routes.splash,
          onGenerateInitialRoutes: appRouter.generateInitialRoutes,
          onGenerateRoute: appRouter.generateRoute,
        ),
      ),
    );
  }
}
