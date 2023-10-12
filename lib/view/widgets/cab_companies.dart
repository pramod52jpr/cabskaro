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
                  height: 40,
                ),
              ),
            ),
            InkWell(
              onTap: onTapOla,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/ola-logo.png",
                  height: 50,
                ),
              ),
            ),
            InkWell(
              onTap: onTapRapido,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/rapido-logo.png",
                  height: 40,
                ),
              ),
            ),
            InkWell(
              onTap: onTapMeru,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/meru-logo.png",
                  height: 40,
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
                  height: 40,
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
                  height: 40,
                ),
              ),
            ),
            InkWell(
              onTap: onTapBlaBla,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                child: Image.asset(
                  "assets/images/icons/bla-bla-logo.png",
                  height: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
