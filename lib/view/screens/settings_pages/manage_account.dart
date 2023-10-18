import 'package:cabskaro/controller/services/services.dart';
import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class ManageAccount extends StatefulWidget {
  const ManageAccount({super.key});

  @override
  State<ManageAccount> createState() => _ManageAccountState();
}

class _ManageAccountState extends State<ManageAccount> {
  final _auth = FirebaseAuth.instance;
  final firestoreData = FirebaseFirestore.instance
      .collection(UserProfile().collection)
      .snapshots();
  final updateuserData=FirebaseFirestore.instance.collection(UserProfile().collection);
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Stack(children: [
          StreamBuilder<QuerySnapshot>(
            stream: firestoreData,
            builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Text("No data");
              } else {
                List data =
                    snapshot.data!.docs;
                    data.retainWhere((element) => element[UserProfile().id]==_auth.currentUser!.uid);
                    Map<String,dynamic> userData=data[0].data() as Map<String,dynamic>;
                return Column(
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
                              border: Border.all(color: Colors.grey, width: 1),
                              shape: BoxShape.circle,
                              color: Colors.transparent,
                            ),
                            child: Expanded(
                                child: Image.asset(
                                    "assets/images/icons/bottom-btn-user.png")),
                          ),
                          kHeight5,
                          const Text(
                            "Edit profile",
                            style: TextStyle(fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Basic info",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          ListTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final _formKey = GlobalKey<FormState>();
                                  TextEditingController _nameController =
                                      TextEditingController();
                                  _nameController.text =
                                      userData[UserProfile().name];
                                  return AlertDialog(
                                    title: Text("Name"),
                                    content: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: _nameController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Any Name";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                                  updateuserData.doc(userData[UserProfile().id]).update({
                                                    UserProfile().name:_nameController.text.toString()
                                                  }).then((value){
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
                            title: Text("Name"),
                            subtitle: Text(userData[UserProfile().name]),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final _formKey = GlobalKey<FormState>();
                                  TextEditingController _phoneController =
                                      TextEditingController();
                                  _phoneController.text =
                                      userData[UserProfile().phone];
                                  return AlertDialog(
                                    title: Text("Mobile No."),
                                    content: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: _phoneController,
                                        keyboardType: TextInputType.phone,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Any Phone No.";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: ()  {
                                            if (_formKey.currentState!
                                                .validate()) {
                                                  updateuserData.doc(userData[UserProfile().id]).update({
                                                    UserProfile().phone:_phoneController.text.toString()
                                                  }).then((value){
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
                            title: Text("Phone number"),
                            subtitle: Text(userData[UserProfile().phone]),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                          ListTile(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  final _formKey = GlobalKey<FormState>();
                                  TextEditingController _emailController =
                                      TextEditingController();
                                  _emailController.text =
                                      userData[UserProfile().email];
                                  return AlertDialog(
                                    title: Text("Email"),
                                    content: Form(
                                      key: _formKey,
                                      child: TextFormField(
                                        controller: _emailController,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Any Email";
                                          }
                                          return null;
                                        },
                                      ),
                                    ),
                                    actions: [
                                      OutlinedButton(
                                          onPressed: ()  {
                                            if (_formKey.currentState!
                                                .validate()) {
                                                  updateuserData.doc(userData[UserProfile().id]).update({
                                                    UserProfile().email:_emailController.text.toString()
                                                  }).then((value){
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
                            title: Text("Email"),
                            subtitle: Text(userData[UserProfile().email]),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
            },
          ),
          const BackButtonWidget(text: ""),
        ]),
      ),
    );
  }
}
