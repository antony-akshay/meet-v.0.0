import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meet/firebase_options.dart';
import 'package:meet/resources/auth_methods.dart';
import 'package:meet/screens/home_screen.dart';
import 'package:meet/screens/login_screen.dart';
import 'package:meet/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      home: StreamBuilder(
        stream: AuthMethods().authChanges, 
        builder: (context,snapshot){
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(child: CircularProgressIndicator());
          }
          if(snapshot.hasData){
            return const HomeScreen();
          }
          return const LoginScreen();
        }),
    );
  }
}
