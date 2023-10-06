import 'package:flutter/material.dart';

class LocationPoints extends StatefulWidget {
  const LocationPoints({super.key});

  @override
  State<LocationPoints> createState() => _LocationPointsState();
}

class _LocationPointsState extends State<LocationPoints> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      padding: const EdgeInsets.all(10),
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
                height: 25,
              ),
              Image.asset(
                "assets/images/icons/more.png",
                height: 25,
              ),
              Image.asset(
                "assets/images/icons/placeholder.png",
                height: 25,
              ),
            ],
          ),
          Column(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  width: 240,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: const Text(
                    "Enter your starting point",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 240,
                  height: 30,
                  padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: const Text(
                    "Enter your destination point",
                    style: TextStyle(overflow: TextOverflow.ellipsis),
                  ),
                ),
              ),
            ],
          ),
          Image.asset(
            "assets/images/icons/double-arrow.png",
            height: 20,
          )
        ],
      ),
    );
  }
}
