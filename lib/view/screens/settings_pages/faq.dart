import 'package:cabskaro/view/const/sizedbox.dart';
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
            Column(
              children: [
                kHeight10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("FA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                    Text("Q",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Color.fromRGBO(227, 132, 42, 0.7))),
                    Text("s",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,)),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(hintText: "Search for topics or question",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(50))
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}