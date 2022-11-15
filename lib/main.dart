import 'package:flutter/material.dart';
import 'package:note_keeper_app/screens/home_page.dart';
import 'package:note_keeper_app/screens/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, initialRoute: '/', routes: {
      '/': (context) => HomePage(),
      'splash': (context) => SplashScreen(),
    }),
  );
}
