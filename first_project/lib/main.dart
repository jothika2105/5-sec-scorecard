import 'package:flutter/material.dart';
import 'login_screen.dart'; // Import your login screen
import 'signup_screen.dart'; // Import your sign-up screen
import 'home_page.dart'; // Import your home page
import 'sales_screen.dart';
import 'marketing_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Performance Scorecard App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => LoginScreen(),
        '/signup': (context) => SignUpScreen(),
        '/home': (context) => HomePage(),
        '/sales': (context) => SalesScreen(),
        '/marketing': (context) => MarketingScreen(),

      },
    );
  }
}
