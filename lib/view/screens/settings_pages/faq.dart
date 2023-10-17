import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  kHeight30,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("FA",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                          Text("Q",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromRGBO(227, 132, 42, 0.7))),
                          Text("s",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      kHeight10,
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                              hintText: "Search for topics or question",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 30)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {},
                            child: Text(
                              "How does Cab Compare work?",
                              style: TextStyle(fontSize: 16),
                            )),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Is Cab Compare available in my city/region?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "How do I download and install Cab Compare on my device?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Can I book rides for immediate travel, or do I need to schedule in advance?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "How do I compare prices and options for different transportation services?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Are there any hidden fees or additional charges when using Cab Compare?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "What payment methods are accepted on Cab Compare?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "How can I track my ride in real-time?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Is it possible to cancel a ride, and are there any cancellation fees?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        kHeight30,
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Are there any safety features in place for passengers?",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            BackButtonWidget(text: "")
          ],
        ),
      ),
    );
  }
}
