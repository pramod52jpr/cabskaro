import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/view/screens/homepage/components/round_button.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerifyCode extends StatefulWidget {
  final String phoneNumber;
  final String verificationCode;
  const VerifyCode({
    super.key,
    required this.phoneNumber,
    required this.verificationCode,
  });

  @override
  State<VerifyCode> createState() => _VerifyCodeState();
}

class _VerifyCodeState extends State<VerifyCode> {
  final _auth = FirebaseAuth.instance;
  List verifyCodeController = <TextEditingController>[
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  var code;
  bool loading = false;

  void generateCode() {
    List verifyCode = [];
    for (TextEditingController element in verifyCodeController) {
      verifyCode.add(element.text.toString());
    }
    setState(() {
      code = verifyCode.join("");
      print(code);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 170),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          image: const DecorationImage(
            image: AssetImage("./assets/images/icons/backscreen.jpg"),
            fit: BoxFit.cover,
          )),
      child: Column(children: [
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
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Colors.black,
                          width: 0.5,
                        )),
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
                        decoration: TextDecoration.none,
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
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
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
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
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
                        decoration: TextDecoration.none,
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
                        height: 50,
                        decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.black, width: 0.5)),
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
                )
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "OTP VERIFICATION",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
              color: Colors.black,
              decoration: TextDecoration.none),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Please Enter OTP sent to you",
          style: TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          widget.phoneNumber,
          style: const TextStyle(
            fontWeight: FontWeight.normal,
            fontSize: 13,
            color: Colors.black,
            decoration: TextDecoration.none,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Material(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  height: 35,
                  width: 35,
                  child: TextFormField(
                    controller: verifyCodeController[0],
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      generateCode();
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                  )),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                  height: 35,
                  width: 35,
                  child: TextFormField(
                    controller: verifyCodeController[1],
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      generateCode();
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                  )),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                  height: 35,
                  width: 35,
                  child: TextFormField(
                    controller: verifyCodeController[2],
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      generateCode();
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                  )),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                  height: 35,
                  width: 35,
                  child: TextFormField(
                    controller: verifyCodeController[3],
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      generateCode();
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                  )),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                  height: 35,
                  width: 35,
                  child: TextFormField(
                    controller: verifyCodeController[4],
                    textAlign: TextAlign.center,
                    autofocus: true,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(1),
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                      generateCode();
                    },
                    decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ))),
                  )),
              const SizedBox(
                width: 5,
              ),
              SizedBox(
                height: 35,
                width: 35,
                child: TextFormField(
                  controller: verifyCodeController[5],
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  onChanged: (value) {
                    generateCode();
                  },
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 0),
                        focusedBorder: OutlineInputBorder(borderSide: BorderSide(
                          color: Colors.grey,
                          width: 1,
                        )),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1,
                      ))),
                ),
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Didn’t receive otp?",
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 13,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            ),
            TextButton(
                onPressed: () {
                  _auth.verifyPhoneNumber(
                    phoneNumber: widget.phoneNumber,
                    verificationCompleted: (phoneAuthCredential) {},
                    verificationFailed: (error) {
                      Services()
                          .toastmsg(error.toString().split("]")[1], false);
                    },
                    codeSent: (verificationId, forceResendingToken) {
                      showGeneralDialog(
                        context: context,
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return VerifyCode(
                              phoneNumber: widget.phoneNumber,
                              verificationCode: verificationId);
                        },
                      );
                    },
                    codeAutoRetrievalTimeout: (verificationId) {
                      Services().toastmsg(verificationId.split("]")[1], false);
                    },
                  );
                },
                child: const Text(
                  "Resend Otp Again",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
        RoundButton(
          title: "SUBMIT",
          loading: loading,
          onPressed: () async {
            setState(() {
              loading = true;
            });
            if (code.toString().length == 6) {
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationCode, smsCode: code);
              try {
                await _auth.signInWithCredential(credential);
                setState(() {
                  loading = false;
                });
                // ignore: use_build_context_synchronously
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                    (route) => false);
              } catch (e) {
                setState(() {
                  loading = false;
                });
                Services().toastmsg(e.toString().split("]")[1], false);
              }
            } else {
              setState(() {
                loading = false;
              });
              Services().toastmsg("Enter The Code", false);
            }
          },
        ),
        const SizedBox(
          height: 10,
        ),
        Material(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Re-Enter Phone Number",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // fontSize: 13,
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
