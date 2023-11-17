import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendFeedbackPage extends StatelessWidget {
  
  final TextEditingController feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SendFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const BackButtonWidget(text: 'FEEDBACK'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                       validator: (feedback) {
                              if(feedback!.isEmpty){
                                return 'Send any feedback';
                              }
                              return null;
                            },
                  controller: feedbackController,
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                onPressed: () async {
           if (formKey.currentState!.validate()) {
           final FirebaseFirestore firestore = FirebaseFirestore.instance;
            await firestore.collection('feedback').add({
           'text': feedbackController.text,
           'timestamp': FieldValue.serverTimestamp(),
           'id':userId,
            });
            feedbackController.clear();
             final snackBar = SnackBar(
             content: Text('Thank you for your feedback!'),
             duration: Duration(seconds: 3), 
            );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3842A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('Send',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
