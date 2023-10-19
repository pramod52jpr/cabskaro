import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance
      .collection(UserProfile().collection)
      .snapshots();
  final updateUserData =
      FirebaseFirestore.instance.collection(UserProfile().collection);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
          child: StreamBuilder(
        stream: firestore,
        builder: (context, snapshot) {
          List users = snapshot.data!.docs;
          users.retainWhere((element) =>
              element[UserProfile().id] == _auth.currentUser!.uid.toString());
          Map<String, dynamic> userData = users[0].data();
          if (!snapshot.hasData) {
            return Container();
          } else {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackButtonWidget(text: "SETTING"),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "App Setting",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      kHeight10,
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final _formKey = GlobalKey<FormState>();
                              TextEditingController _homeController =
                                  TextEditingController();
                              _homeController.text =
                                  userData[UserProfile().home];
                              return AlertDialog(
                                title: Text("Home"),
                                content: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    controller: _homeController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Home Address";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          updateUserData
                                              .doc(userData[UserProfile().id])
                                              .update({
                                            UserProfile().home:
                                                _homeController.text.toString()
                                          }).then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      },
                                      child: Text("Save")),
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel")),
                                ],
                              );
                            },
                          );
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(userData[UserProfile().home].isEmpty
                            ? "Add Home"
                            : "Home"),
                        subtitle: Text(userData[UserProfile().home].isEmpty
                            ? ""
                            : userData[UserProfile().home]),
                        leading: Icon(Icons.home),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              final _formKey = GlobalKey<FormState>();
                              TextEditingController _workController =
                                  TextEditingController();
                              _workController.text =
                                  userData[UserProfile().work];
                              return AlertDialog(
                                title: Text("Work"),
                                content: Form(
                                  key: _formKey,
                                  child: TextFormField(
                                    controller: _workController,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Your Work Address";
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                actions: [
                                  OutlinedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          updateUserData
                                              .doc(userData[UserProfile().id])
                                              .update({
                                            UserProfile().work:
                                                _workController.text.toString()
                                          }).then((value) {
                                            Navigator.of(context).pop();
                                          });
                                        }
                                      },
                                      child: Text("Save")),
                                  OutlinedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text("Cancel")),
                                ],
                              );
                            },
                          );
                        },
                        contentPadding: EdgeInsets.zero,
                        title: Text(userData[UserProfile().work].isEmpty
                            ? "Add Work"
                            : "Work"),
                        subtitle: Text(userData[UserProfile().work].isEmpty
                            ? ""
                            : userData[UserProfile().work]),
                        leading: Icon(Icons.local_post_office),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        },
      )),
    );
  }
}
