import 'dart:async';

import 'package:cabskaro/view/screens/otp_screen/verifycode_dialog.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneEmailController = TextEditingController();
  var opacity = 0.0;

  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 0),
      () {
        setState(() {
          opacity = 1.0;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  "./assets/images/icons/backscreen.jpg",
                ),
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
                              height: 150,
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
                      const AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: 1,
                        child: Text(
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
                            opacity: 0,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 150,
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
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: opacity,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            "./assets/images/icons/taxi.png",
                            height: 40,
                          ),
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
                              height: 150,
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
                      const AnimatedOpacity(
                        duration: Duration(seconds: 1),
                        opacity: 1,
                        child: Text(
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
                            opacity: 0,
                            duration: const Duration(seconds: 1),
                            child: AnimatedContainer(
                              duration: const Duration(seconds: 1),
                              height: 150,
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
                      AnimatedOpacity(
                        duration: const Duration(seconds: 1),
                        opacity: opacity,
                        child: Container(
                          color: Colors.white,
                          child: Image.asset(
                            "assets/images/icons/placeholder.png",
                            height: 50,
                            alignment: Alignment.centerLeft,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              AnimatedContainer(
                duration: const Duration(seconds: 1),
                height: 70,
              ),
              AnimatedOpacity(
                duration: const Duration(seconds: 1),
                opacity: opacity,
                child: Column(
                  children: [
                    const Text(
                      "OTP VERIFICATION",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "We will send you an one time Opt in this number",
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Enter Your Email / Mobile",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5)),
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: TextField(
                        controller: _phoneEmailController,
                        decoration: const InputDecoration(
                            hintText: "Please Enter Email / Phone",
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10)),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30))),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10)),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => const Color.fromRGBO(227, 132, 42, 0.8))),
                      onPressed: () {
                        // try{
                        //   int phoneNo=int.parse(_phoneEmailController.text.toLowerCase());
                        //   print(phoneNo.runtimeType);
                        // }catch(e){
                        //   String emailId=_phoneEmailController.text.toLowerCase();
                        //   print(emailId.runtimeType);
                        // }
                        showGeneralDialog(
                          context: context,
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return const VerifyCode();
                          },
                        );
                      },
                      child: const Text(
                        "GET OTP",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
