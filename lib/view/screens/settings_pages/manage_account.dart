import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    kHeight20,
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey,width: 1),
                        shape: BoxShape.circle,
                        color: Colors.transparent,
                      ),
                      child: Expanded(child: Image.asset("assets/images/icons/bottom-btn-user.png")),
                    ),
                    kHeight5,
                    const Text("Edit profile",style: TextStyle(fontSize: 17),),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Basic info",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Name"),
                      subtitle: Text("Cabskaro"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Phone number"),
                      subtitle: Text("9989999999"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text("Email"),
                      subtitle: Text("Cabskaro@gmail.com"),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              )
            ],
          ),
          const BackButtonWidget(text: ""),
        ]),
      ),
    );
  }
}
