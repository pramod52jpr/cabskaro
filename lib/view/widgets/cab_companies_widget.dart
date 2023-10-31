
import 'package:cabskaro/view/screens/blabla_ui/blabla_screen.dart';
import 'package:cabskaro/view/screens/blusmart_ui/blusmart_screen.dart';
import 'package:cabskaro/view/screens/indrive_ui/indrive_screen.dart';
import 'package:cabskaro/view/screens/ola_ui/ola_screen.dart';
import 'package:cabskaro/view/screens/rapido_ui/rapido_screen.dart';
import 'package:cabskaro/view/screens/uber_ui/uber_screen.dart';
import 'package:cabskaro/view/widgets/cab_companies.dart';
import 'package:flutter/material.dart';

import '../screens/meru_ui/meru_screen.dart';

class CabCompaniessWidget extends StatelessWidget {
  const CabCompaniessWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CabCompanies(
      onTapUber: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const UberScreen(),
            ));},
      onTapOla: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const OlaScreen(),
            ));
      },
      onTapRapido: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const RapidoScreen(),
            ));},
      onTapMeru: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const MeruScreen(),
            ));},
      onTapBlueSmart: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BlusmartScreen(),
            ));},
      onTapIndrive: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const IndriveScreen(),
            ));},
      onTapBlaBla: () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BlaBlaScreen(),
            ));},
    );
  }
}
