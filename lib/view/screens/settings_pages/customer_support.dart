import 'dart:developer';

import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatelessWidget {
  final TextEditingController customerSupportController =TextEditingController();
  final formkey=GlobalKey<FormState>();
   CustomerSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Material(
      child: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  kHeight30,
                  Text(
                    "CUSTOMER SUPPORT",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  kHeight40,
                  Row(
                    children: [
                      Icon(
                        Icons.call,
                        color: Color.fromRGBO(227, 132, 42, 0.7),
                      ),
                      kWidth30,
                      Text(
                        "121-9859494",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  kHeight30,
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        color: Color.fromRGBO(227, 132, 42, 0.7),
                      ),
                      kWidth30,
                      Text(
                        "cabskarosupport@gmail.com",
                        style: TextStyle(fontSize: 17),
                      )
                    ],
                  ),
                  kHeight30,
                  Row(
                    children: [
                      Expanded(
                          child: TextFormField(
                            controller: customerSupportController,
                        decoration: InputDecoration(
                          hintText: "Send message",
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        ),
                      )),
                      kWidth10,
                      ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateColor.resolveWith(
                                  (states) => Color.fromRGBO(227, 132, 42, 0.7))),
                          onPressed: () async{
                            if(formkey.currentState!.validate()){
                              final firebase=FirebaseFirestore.instance;
                              await firebase.collection('CustomerSupportMessage').add({
                                'message':customerSupportController.text,
                                'time':FieldValue.serverTimestamp(),
                                'id':FirebaseAuth.instance.currentUser?.uid,
                              });
                              customerSupportController.clear();
                              Services().toastmsg('Thankyou we will check and inform',true );
                            }
                          },
                          child: Text("Send"))
                    ],
                  )
                ],
              ),
            ),
          ),
          BackButtonWidget(text: "")
        ],
      )),
    );
  }
}
