import 'package:cabskaro/projects/routes/app_route_constants.dart';
import 'package:cabskaro/view/screens/firstpage/splash_screen.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyAppRouter{
  GoRouter router = GoRouter(
    routes: [
      GoRoute(name: 'splash_screen',
      path: '/',
      pageBuilder: (context, state) {
        return MaterialPage(child: SplashScreen());
      },
      ),
         GoRoute(name: MyAppRouteConstants.dashboardRoutName,
      path: '/dashboard_screen',
      pageBuilder: (context, state) {
        return MaterialPage(child: DashboardScreen());
      },
      ),
  
    ]
  );
}