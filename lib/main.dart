import 'package:cabskaro/view/screens/firstpage/splash_screen.dart';
import 'package:cabskaro/view/screens/settings_pages/faq.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FaqScreen(),
    );
  }
}
