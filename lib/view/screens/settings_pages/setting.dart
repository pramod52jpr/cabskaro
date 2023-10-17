import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(text: "SETTING"),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("App Setting",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  kHeight10,
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Add Home"),
                    leading: Icon(Icons.home),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Add work"),
                    leading: Icon(Icons.local_post_office),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Shortcuts"),
                    leading: Icon(Icons.key),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Communication"),
                    subtitle: Text("Choose your preferred contact method and manage your notification"),
                    leading: Icon(Icons.commute),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text("Manage Trusted contacts"),
                    subtitle: Text("Share your trip status with family and friends in a single tap"),
                    leading: Icon(Icons.contact_emergency),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}