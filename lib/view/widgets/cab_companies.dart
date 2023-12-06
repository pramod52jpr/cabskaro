import 'package:flutter/material.dart';

class CabCompanies extends StatelessWidget {
  final VoidCallback onTapUber;
  final VoidCallback onTapOla;
  final VoidCallback onTapRapido;
  final VoidCallback onTapMeru;
  final VoidCallback onTapBlueSmart;
  final VoidCallback onTapIndrive;
  final VoidCallback onTapBlaBla;
  const CabCompanies({
    super.key,
    required this.onTapUber,
    required this.onTapOla,
    required this.onTapRapido,
    required this.onTapMeru,
    required this.onTapBlueSmart,
    required this.onTapIndrive,
    required this.onTapBlaBla,
  });

  @override
  Widget build(BuildContext context) {
      final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: onTapUber,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/uber-logo.png",
                  height: screenHeight*0.057,
                ),
              ),
            ),
            InkWell(
              onTap: onTapOla,
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/cabsicon/Ola.png",
                  height:  screenHeight*0.057,
                ),
              ),
            ),
            InkWell(
              onTap: onTapRapido,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/cabsicon/6266fe312b8ca 2.png",
                  height: screenHeight*0.055,
                ),
              ),
            ),
            InkWell(
              onTap: onTapMeru,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/cabsicon/download 2.png",
                  height: screenHeight*0.055,
                ),
              ),
            ),
            InkWell(
              onTap: onTapBlueSmart,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/blu-smart-logo.png",
                  height: screenHeight*0.055,
                ),
              ),
            ),
            InkWell(
              onTap: onTapIndrive,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/indrive-logo.png",
                  height: screenHeight*0.055,
                ),
              ),
            ),
            InkWell(
              onTap: onTapBlaBla,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/cabsicon/blabla.png",
                  height: screenHeight*0.055,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
