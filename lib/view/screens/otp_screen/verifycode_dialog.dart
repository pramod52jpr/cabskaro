import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/screens/homepage/components/round_button.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
  SmsAutoFill smsAutoFill = SmsAutoFill();
  
  final _auth = FirebaseAuth.instance;
  final firestore =
      FirebaseFirestore.instance.collection(UserProfile().collection);
  TextEditingController pinputController = TextEditingController();
  bool loading = false;

// @override
// void initState() {
//   super.initState();
//   smsAutoFill.listenForCode;
// }
  @override
  void initState() {
    super.initState();
    
    // Listen for incoming SMS codes
    smsAutoFill.listenForCode;
    
    // Set the OTP field value when an SMS code is received
    smsAutoFill.code.listen((String code) {
      pinputController.text = code;
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Pinput(
  controller: pinputController,
  length: 6,
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return "Please fill the input";
    } else if (value.length != 6) {
      return "Please write code correctly";
    }
    return null;
  },
)
,
              // child: Pinput(
              //   controller: pinputController,
              //   length: 6,
              //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return "Please fill the input";
              //     } else if (value.length != 6) {
              //       return "Please write code correctly";
              //     }
              //     return null;
              //   },
              // ),
            )),
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
            if (pinputController.text.toString().length == 6) {
              final credential = PhoneAuthProvider.credential(
                  verificationId: widget.verificationCode,
                  smsCode: pinputController.text.toString());
              try {
                await _auth.signInWithCredential(credential).then((value) {
                  if (value.additionalUserInfo!.isNewUser) {
                    firestore.doc(_auth.currentUser!.uid.toString()).set({
                      UserProfile().id: _auth.currentUser!.uid.toString(),
                      UserProfile().name: "",
                      UserProfile().email: "",
                      UserProfile().phone:
                          _auth.currentUser!.phoneNumber.toString(),
                      UserProfile().photo: "",
                      UserProfile().home: "",
                      UserProfile().work: "",
                    });
                  }
                  setState(() {
                    loading = false;
                  });
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                      (route) => false);
                });

                // Navigator.pushAndRemoveUntil(
                //     context,
                //     MaterialPageRoute(
                //       builder: (context) => const DashboardScreen(),
                //     ),
                //     (route) => false);
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
