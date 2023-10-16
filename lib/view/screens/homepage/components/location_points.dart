import 'package:flutter/material.dart';

class LocationPoints extends StatefulWidget {
  final VoidCallback onTapStart;
  final VoidCallback onTapEnd;
  final VoidCallback onTapInterchange;
  final String startLocation;
  final String endLocation;
  const LocationPoints({
    super.key,
    required this.onTapStart,
    required this.onTapEnd,
    required this.onTapInterchange,
    required this.startLocation,
    required this.endLocation,
  });

  @override
  State<LocationPoints> createState() => _LocationPointsState();
}

class _LocationPointsState extends State<LocationPoints> {
  String a="";
  @override
  Widget build(BuildContext context) {
  MediaQueryData mediaQuery=MediaQuery.of(context);
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
                onTap: widget.onTapStart,
                child: Hero(
                  tag: "start",
                  child: Material(
                    child: Container(
                      width: mediaQuery.size.width*0.6,
                      height: 30,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Text(widget.startLocation,style: const TextStyle(
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
                onTap: widget.onTapEnd,
                child: Hero(
                  tag: "end",
                  child: Material(
                    child: Container(
                      width: mediaQuery.size.width*0.6,
                      height: 30,
                      padding:
                          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.grey, width: 1)),
                      child: Text(
                        widget.endLocation,
                        style: const TextStyle(overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: widget.onTapInterchange,
            child: Image.asset(
              "assets/images/icons/double-arrow.png",
              height: 20,
            ),
          )
        ],
      ),
    );
  }
}
