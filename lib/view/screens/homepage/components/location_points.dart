import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LocationPoints extends StatelessWidget {
  final VoidCallback onTapStart;
  final VoidCallback onTapEnd;
  final VoidCallback onTapInterchange;
  final String startLocation;
  final String endLocation;
   LocationPoints({
    super.key,
    required this.onTapStart,
    required this.onTapEnd,
    required this.onTapInterchange,
    required this.startLocation,
    required this.endLocation,
  });

  String a="";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
     final screenHeight = MediaQuery.of(context).size.height;
  MediaQueryData mediaQuery=MediaQuery.of(context);
    return Container(
      margin:  EdgeInsets.symmetric(horizontal: screenWidth*0.074, vertical: screenHeight*0.015),
      padding:  EdgeInsets.all(screenHeight*0.010),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(2, 2))
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Image.asset(
                "assets/images/icons/car.png",
                height: screenHeight*0.029,
              ),
              Image.asset(
                "assets/images/icons/more.png",
                height: screenHeight*0.029,
              ),
              Image.asset(
                "assets/images/icons/placeholder.png",
                height: screenHeight*0.029,
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: onTapStart,
                child: Hero(
                  tag: "start",
                  child: Material(
                    child: Container(
                      width: mediaQuery.size.width*0.6,
                      height: screenWidth*0.074,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight*0.050),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Text(startLocation,style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: onTapEnd,
                child: Hero(
                  tag: "end",
                  child: Material(
                    child: Container(
                      width: mediaQuery.size.width*0.6,
                      height: screenWidth*0.074,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(screenHeight*0.050),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Text(
                        endLocation,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: onTapInterchange,
            child: Image.asset(
              "assets/images/icons/double-arrow.png",
              height: screenHeight*0.020,
            ),
          )
        ],
      ),
    );
  }
}
