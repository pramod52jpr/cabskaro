import 'package:cabskaro/components/cab_types.dart';
import 'package:cabskaro/components/location_points.dart';
import 'package:cabskaro/ui/cabs_availability_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Column(
                children: [
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey, blurRadius: 5, spreadRadius: 1)
                      ],
                      border: Border.all(
                          color: const Color.fromRGBO(227, 132, 42, 0.8)),
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                          image:
                              AssetImage("assets/images/icons/backscreen.jpg"),
                          fit: BoxFit.cover)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Cabs karo",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Image.asset(
                        "assets/images/icons/notification.png",
                        height: 25,
                      )
                    ],
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 10,
                    width: 30,
                    decoration:
                        const BoxDecoration(color: Colors.white, boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 2))
                    ]),
                  ),
                ],
              ),
            ],
          ),
          const LocationPoints(),
          Expanded(
            child: Column(
              children: [
                CabTypes(
                  onTapFourSeater: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CabsAvaibilityScreen(),
                        ));
                  },
                  onTapFourPlusSeater: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CabsAvaibilityScreen(),
                        ));
                  },
                  onTapAuto: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CabsAvaibilityScreen(),
                        ));
                  },
                  onTapBike: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CabsAvaibilityScreen(),
                        ));
                  },
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 10),
                    child: const Text("map"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/uber-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/ola-logo.png",
                              height: 50,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/rapido-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/meru-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/blu-smart-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/indrive-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            child: Image.asset(
                              "assets/images/icons/bla-bla-logo.png",
                              height: 40,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-first.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-car.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {},
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-user.png",
                            height: 40,
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
