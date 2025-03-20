import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/loading_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Guidance',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FutureBuilder(
        future: Future.delayed(const Duration(seconds: 2)),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          }

          return StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              }

              if (snapshot.hasData) {
                return const HomePage();
              }

              return const LoginPage();
            },
          );
        },
      ),
      routes: {
        "/login": (context) => const LoginPage(),
        "/home": (context) => HomePage(),
      },
    );
  }
}
