import 'package:ai_lingo/app.dart';
import 'package:ai_lingo/features/auth/data/auth_repository.dart';
import 'package:ai_lingo/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(App(authRepository: AuthRepository()));
}
