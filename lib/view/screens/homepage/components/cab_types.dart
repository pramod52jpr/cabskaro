import 'package:flutter/material.dart';

class CabTypes extends StatefulWidget {
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
  State<CabTypes> createState() => _CabTypesState();
}

class _CabTypesState extends State<CabTypes> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              InkWell(
                onTap: widget.onTapFourSeater,
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
                    "assets/images/icons/four-seater.png",
                    height: 43,
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
                onTap: widget.onTapFourPlusSeater,
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
                      height: 43,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: 43,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: 43,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: 43,
                    ),
                    Image.asset(
                      "assets/images/icons/four-plus-seater.png",
                      height: 43,
                    ),
                  ]),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("4+ Seater"),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: widget.onTapAuto,
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
                    height: 43,
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
                onTap: widget.onTapBike,
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
                    height: 43,
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
