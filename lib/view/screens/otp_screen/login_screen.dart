import 'dart:async';

import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/screens/homepage/components/round_button.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cabskaro/view/screens/otp_screen/verifycode_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final firestore=FirebaseFirestore.instance.collection(UserProfile().collection);
  final TextEditingController _phoneController = TextEditingController();
  var opacity = 0.0;
  bool loading = false;

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
                      "Enter Your Mobile No",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 30),
                      child: Form(
                        key: _formKey,
                        child: TextFormField(
                          controller: _phoneController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Any Number";
                            }
                            if (value.length != 10 ||
                                int.tryParse(value) == null) {
                              return "Enter Valid Mobile Number";
                            }
                            return null;
                          },
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                              hintText: "Please Enter Mobile Number",
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  borderSide:
                                      BorderSide(color: Colors.grey, width: 1)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 10)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    RoundButton(
                      title: "GET OTP",
                      loading: loading,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          setState(() {
                            loading = true;
                          });
                          _auth.verifyPhoneNumber(
                            phoneNumber: "+91${_phoneController.text}",
                            verificationCompleted: (phoneAuthCredential) {
                              setState(() {
                                loading = false;
                              });
                            },
                            verificationFailed: (error) {
                              setState(() {
                                loading = false;
                              });
                              Services().toastmsg(
                                  error.toString().split("]")[1], false);
                            },
                            codeSent: (verificationId, forceResendingToken) {
                              setState(() {
                                loading = false;
                              });
                              showGeneralDialog(
                                context: context,
                                pageBuilder:
                                    (context, animation, secondaryAnimation) {
                                  return VerifyCode(
                                      phoneNumber:
                                          "+91${_phoneController.text}",
                                      verificationCode: verificationId);
                                },
                              );
                            },
                            codeAutoRetrievalTimeout: (verificationId) {
                              setState(() {
                                loading = false;
                              });
                              Services().toastmsg(
                                  verificationId.split("]")[1], false);
                            },
                          );
                        }
                      },
                    ),
                    InkWell(
                      onTap: () async {
                        try {
                          final GoogleSignInAccount? processGoogle =
                              await GoogleSignIn().signIn();
                          final GoogleSignInAuthentication accountAuth =
                              await processGoogle!.authentication;
                          final credential = GoogleAuthProvider.credential(
                              accessToken: accountAuth.accessToken,
                              idToken: accountAuth.idToken);
                              await _auth.signInWithCredential(credential).then((value) async {
                                if(value.additionalUserInfo!.isNewUser){
                                  await firestore.doc(_auth.currentUser!.uid.toString()).set({
                                    UserProfile().id:_auth.currentUser!.uid.toString(),
                                    UserProfile().name:_auth.currentUser!.displayName.toString(),
                                    UserProfile().email:_auth.currentUser!.email.toString(),
                                    UserProfile().phone:"",
                                    UserProfile().photo:"",
                                  });
                                }
                              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => const DashboardScreen(),), (route) => false);
                              });
                        } catch (e) {
                          Services().toastmsg(e.toString(), false);
                        }
                      },
                      child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 20),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                "https://static-00.iconduck.com/assets.00/google-icon-2048x2048-czn3g8x8.png",
                                height: 30,
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "Continue with Google",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey,
                                    fontSize: 18),
                              ),
                            ],
                          )),
                    ),
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
