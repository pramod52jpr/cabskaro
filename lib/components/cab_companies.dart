import 'package:flutter/material.dart';

class CabCompanies extends StatefulWidget {
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
  State<CabCompanies> createState() => _CabCompaniesState();
}

class _CabCompaniesState extends State<CabCompanies> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            InkWell(
              onTap: widget.onTapUber,
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
              onTap: widget.onTapOla,
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
              onTap: widget.onTapRapido,
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
              onTap: widget.onTapMeru,
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
              onTap: widget.onTapBlueSmart,
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
              onTap: widget.onTapIndrive,
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
              onTap: widget.onTapBlaBla,
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
