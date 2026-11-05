import 'package:ai_lingo/core/constants/app_colors.dart';
import 'package:ai_lingo/features/onboarding/presentation/screens/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.neutralWhite,
          appBarTheme: AppBarTheme(
            backgroundColor: AppColors.neutralWhite,
            surfaceTintColor: Colors.transparent,
          ),
        ),
        home: WelcomeScreen(),
      ),
    );
  }
}
