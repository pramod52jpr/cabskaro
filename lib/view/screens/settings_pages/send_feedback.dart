import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class SendFeedbackPage extends StatelessWidget {
  final TextEditingController feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SendFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  controller: feedbackController,
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                  onPressed: () { 
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3842A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('Send'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




}
