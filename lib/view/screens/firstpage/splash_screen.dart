import 'dart:async';
import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/view/screens/homepage/components/round_button.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;
  static const String STARTLOC = "start";
  static const String STARTLAT = "startLat";
  static const String STARTLON = "startLon";
  static const String ENDLOC = "end";
  static const String ENDLAT = "endLat";
  static const String ENDLON = "endLon";
  bool firstAnimation = false;
  bool splashAnimation = false;
  bool secondAnimation = false;
  var btnOpacity = 0.0;
  var opacity = 0.0;
  var ropeOpacity = 1.0;

  void deletePrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(STARTLOC);
    prefs.remove(STARTLAT);
    prefs.remove(STARTLON);
    prefs.remove(ENDLOC);
    prefs.remove(ENDLAT);
    prefs.remove(ENDLON);
  }

  @override
  void initState() {
    super.initState();
    deletePrefs();
    animate();
    Services().getUserLocation().then((value) {}).onError((error, stackTrace) {
      Services().toastmsg("There is some error", false);
    });
  }

  void animate() {
    Timer(const Duration(seconds: 0), () {
      setState(() {
        firstAnimation = true;
        opacity = 1.0;
      });
    });
    if (_auth.currentUser != null) {
      Timer(
        const Duration(seconds: 4),
        () {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
              (route) => false);
        },
      );
    } else {
      Timer(
        const Duration(seconds: 3),
        () {
          setState(() {
            splashAnimation = true;
          });
        },
      );
      Timer(
        const Duration(seconds: 4),
        () {
          setState(() {
            btnOpacity = 1.0;
          });
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("./assets/images/icons/backscreen.jpg"),
                fit: BoxFit.cover),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          AnimatedOpacity(
                            opacity: 0,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: secondAnimation
                                  ? 150
                                  : splashAnimation
                                      ? 200
                                      : firstAnimation
                                          ? 350
                                          : 0,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.black, width: 0.5),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: opacity,
                        child: const Text(
                          "C",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          AnimatedOpacity(
                            opacity: ropeOpacity,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: secondAnimation
                                  ? 150
                                  : splashAnimation
                                      ? 200
                                      : firstAnimation
                                          ? 350
                                          : 0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Image.asset(
                          "./assets/images/icons/taxi.png",
                          height: 40,
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          AnimatedOpacity(
                            opacity: 0,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: secondAnimation
                                  ? 150
                                  : splashAnimation
                                      ? 200
                                      : firstAnimation
                                          ? 350
                                          : 0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                      AnimatedOpacity(
                        opacity: opacity,
                        duration: const Duration(seconds: 1),
                        child: const Text(
                          "BSKAR",
                          style: TextStyle(
                              fontSize: 35,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          AnimatedOpacity(
                            opacity: ropeOpacity,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: secondAnimation
                                  ? 150
                                  : splashAnimation
                                      ? 200
                                      : firstAnimation
                                          ? 350
                                          : 0,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 0.5)),
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          )
                        ],
                      ),
                      Container(
                        color: Colors.white,
                        child: Image.asset(
                          "assets/images/icons/placeholder.png",
                          height: 50,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 200,
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: btnOpacity,
                child: RoundButton(
                    title: "LOG IN",
                    onPressed: () {
                      setState(() {
                        secondAnimation = true;
                        ropeOpacity = 0.0;
                        btnOpacity = 0.0;
                      });
                      Timer(
                        const Duration(seconds: 1),
                        () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const DashboardScreen(),
                              ));
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
