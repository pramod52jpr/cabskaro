import 'package:cabskaro/controller/provider/faq_screen_provider.dart';
import 'package:cabskaro/controller/provider/history_screen_provider.dart';
import 'package:cabskaro/controller/provider/loading_provider.dart';
import 'package:cabskaro/controller/provider/search_location_provider.dart';
import 'package:cabskaro/controller/provider/splash_screen_provider.dart';
import 'package:cabskaro/view/screens/firstpage/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart'; 

  void main() async {
  await dotenv.load();
  WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
  }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
         ChangeNotifierProvider(create: (context)=>HistoryScreenProvider()),
         ChangeNotifierProvider(create: (context)=>SearchStartLocationModel()),
         ChangeNotifierProvider(create: (context)=>LoadingProvider()),
         ChangeNotifierProvider(create: (context)=>FaqScreenProvider()),
         ChangeNotifierProvider(create: (context)=>SplashScreenProvider()),
        ],
        child: GetMaterialApp(
           theme: ThemeData(
        brightness: Brightness.light,
      ),
      themeMode: ThemeMode.dark,
        debugShowCheckedModeBanner: false,
        title: 'CabsKaro',
        home: SplashScreen(),
      ),
    );
  }
}
