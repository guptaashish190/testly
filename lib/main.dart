import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testly/auth_widget.dart';
import 'package:testly/constants/routes.dart';
import 'package:testly/src/home/home_screen.dart';
import 'package:testly/src/home/main_loader.dart';
import 'package:testly/src/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:testly/util.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Testly',
      routes: appRoutes(context),
      home: AuthWidget(
        signedInBuilder: (_) => MainLoader(),
        notSignedInBuilder: (_) => LoginScreen(),
      ),
    );
  }
}
