import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class SecurityAndPrivacy extends StatefulWidget {
  const SecurityAndPrivacy({super.key});

  @override
  State<SecurityAndPrivacy> createState() => _SecurityAndPrivacyState();
}

class _SecurityAndPrivacyState extends State<SecurityAndPrivacy> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                kHeight30,
              Center(
                child: Text(
                  "SECURITY & PRIVACY",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              kHeight40,
              ListTile(
                title: Text("Device location",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Select Cabskaro accesses to your device location"),
                leading: Icon(Icons.phone_android),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
              kHeight20,
              ListTile(
                title: Text("Live location",style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text("Control how cabs karo shares your live location with other"),
                leading: Icon(Icons.location_history),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ]),
            BackButtonWidget(text: ""),
          ],
        ),
      ),
    );
  }
}
