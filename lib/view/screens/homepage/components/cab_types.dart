import 'package:flutter/material.dart';

class CabTypes extends StatelessWidget {
  final VoidCallback onTapFourSeater;
  final VoidCallback onTapFourPlusSeater;
  final VoidCallback onTapAuto;
  final VoidCallback onTapBike;
  const CabTypes({
    super.key,
    required this.onTapFourSeater,
    required this.onTapFourPlusSeater,
    required this.onTapAuto,
    required this.onTapBike,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: screenWidth*0.074, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InkWell(
                onTap: onTapFourSeater,
                child: Container(
                  padding:  EdgeInsets.all(screenHeight*0.010),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                      ]),
                  child: Image.asset(
                    "assets/images/icons/four-seater.png",
                    height: screenHeight*0.050,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("4 Seater")
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: onTapFourPlusSeater,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                      ]),
                  child: Stack(children: [
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: screenHeight*0.049,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: screenHeight*0.049,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: screenHeight*0.049,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: screenHeight*0.049,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: screenHeight*0.049,
                    ),
                  ]),
                ),
              ),
               SizedBox(
                height: screenHeight*0.010,
              ),
              const Text("4+ Seater"),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: onTapAuto,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                      ]),
                  child: Image.asset(
                    "assets/images/icons/tuk-tuk.png",
                    height: screenHeight*0.049,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Auto")
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: onTapBike,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 2)
                      ]),
                  child: Image.asset(
                    "assets/images/icons/bike.png",
                    height: screenHeight*0.049,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("Bike")
            ],
          ),
        ],
      ),
    );
  }
}
