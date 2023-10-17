import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class CustomerSupportScreen extends StatefulWidget {
  const CustomerSupportScreen({super.key});

  @override
  State<CustomerSupportScreen> createState() => _CustomerSupportScreenState();
}

class _CustomerSupportScreenState extends State<CustomerSupportScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
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
                        onPressed: () {},
                        child: Text("Send"))
                  ],
                )
              ],
            ),
          ),
          BackButtonWidget(text: "")
        ],
      )),
    );
  }
}
