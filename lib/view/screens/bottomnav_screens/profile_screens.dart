import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/bottomnav_screens/history_screens.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cabskaro/view/screens/otp_screen/login_screen.dart';
import 'package:cabskaro/view/screens/settings_pages/about_us.dart';
import 'package:cabskaro/view/screens/settings_pages/customer_support.dart';
import 'package:cabskaro/view/screens/settings_pages/faq.dart';
import 'package:cabskaro/view/screens/settings_pages/manage_account.dart';
import 'package:cabskaro/view/screens/settings_pages/security_privacy.dart';
import 'package:cabskaro/view/screens/settings_pages/send_feedback.dart';
import 'package:cabskaro/view/screens/settings_pages/setting.dart';
import 'package:cabskaro/view/screens/settings_pages/term_of_use.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cabskaro/view/widgets/profile_widgets_listtile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _auth=FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance
      .collection(UserProfile().collection)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: firestore,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            List users=snapshot.data!.docs;
            users.retainWhere((element) => element[UserProfile().id]==_auth.currentUser!.uid.toString());
            Map<String,dynamic> userData=users[0].data();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWidget(
                  text: '',
                ),
                Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey, width: 1),
                      image:DecorationImage(
                        fit: BoxFit.cover,
                        image:  userData[UserProfile().photo].isEmpty?AssetImage("assets/images/icons/bottom-btn-user.png"):NetworkImage(userData[UserProfile().photo]) as ImageProvider)
                    ),
                  ),
                ),
                kHeight10,
                 Center(
                  child: Text(
                    "Hi ${userData[UserProfile().name].isEmpty?'User':userData[UserProfile().name]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: const Color(0xFFE3842A))),
                      height: 130,
                      width: 260,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/icons/bottom-btn-user.png',
                                  height: 30,
                                ),
                                 Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(userData[UserProfile().name].isEmpty?"Your Name":userData[UserProfile().name]),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/icons/Screenshot 2023-10-16 3.29.48 PM.png',
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(userData[UserProfile().email].isEmpty?"Your Email":userData[UserProfile().email]),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  'assets/images/icons/Screenshot_2023-10-16_3.23.06_PM-removebg-preview.png',
                                  height: 30,
                                ),
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(userData[UserProfile().phone].isEmpty?"Your Mobile No.":userData[UserProfile().phone]),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 50),
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const SettingScreen();
                                }));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color(0xFFE3842A),
                                          width: 1),
                                    ),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                          'assets/images/icons/setting.PNG',
                                          height: 30),
                                    ),
                                  ),
                                  const Text('Setting',
                                      style: TextStyle(fontSize: 15)),
                                ],
                              ),
                            ),
                            const SizedBox(height: 25),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const CustomerSupportScreen();
                                }));
                              },
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          color: const Color(0xFFE3842A),
                                          width: 1),
                                    ),
                                    child: CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: Image.asset(
                                          'assets/images/icons/support.png',
                                          height: 25),
                                    ),
                                  ),
                                  const Text('Support')
                                ],
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey)),
                      margin: const EdgeInsets.only(left: 10),
                      width: 360,
                      child: ListView(children: [
                        ProfileWidgetListTile(
                          text: 'FAQs',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const FaqScreen();
                            }));
                          },
                        ),
                        ProfileWidgetListTile(
                          text: 'Security & Privacy',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const SecurityAndPrivacy();
                            }));
                          },
                        ),
                        ProfileWidgetListTile(
                          text: 'Manage account',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ManageAccount();
                            }));
                          },
                        ),
                        ProfileWidgetListTile(
                          text: 'About us',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const AboutUsPage();
                            }));
                          },
                        ),
                        ProfileWidgetListTile(
                          text: 'Term of use',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const TermsOfUsePage();
                            }));
                          },
                        ),
                        ProfileWidgetListTile(
                          text: 'Send Feedback',
                          icon: const Icon(Icons.abc),
                          ontap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return SendFeedbackPage();
                            }));
                          },
                        ),
                        ListTile(
                          onTap: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text(
                                'Confirmation!',
                              ),
                              content: const Text(
                                'Do you wish to logout',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text(
                                    'Cancel',
                                  ),
                                ),
                                TextButton(
                                  onPressed: () => logout(context),
                                  child: const Text(
                                    'OK',
                                  ),
                                ),
                              ],
                            ),
                          ),
                          leading: const Icon(Icons.abc),
                          title: const Text(
                            'Logout',
                          ),
                        ),
                      ]),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.only(left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [
                        BoxShadow(color: Colors.grey, blurRadius: 5)
                      ]),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DashboardScreen();
                            }));
                          },
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-first.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HistoryScreen();
                            }));
                          },
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-car.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return ProfileScreen();
                            }));
                          },
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-user.png",
                            height: 40,
                          ))
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

  void logout(BuildContext context) {
    FirebaseAuth.instance.signOut();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}
