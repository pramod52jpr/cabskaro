import 'package:cabskaro/model/user_profile_model.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/otp_screen/login_screen.dart';
import 'package:cabskaro/view/screens/settings_pages/about_us.dart';
import 'package:cabskaro/view/screens/settings_pages/customer_support.dart';
import 'package:cabskaro/view/screens/settings_pages/faq.dart';
import 'package:cabskaro/view/screens/settings_pages/manage_account.dart';
import 'package:cabskaro/view/screens/settings_pages/send_feedback.dart';
import 'package:cabskaro/view/screens/settings_pages/setting.dart';
import 'package:cabskaro/view/screens/settings_pages/term_of_use.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cabskaro/view/widgets/bottomnav_widget.dart';
import 'package:cabskaro/view/widgets/profile_widgets_listtile.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance
      .collection(UserProfile().collection)
      .snapshots();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
          child: StreamBuilder(
        stream: firestore,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container();
          } else {
            List users = snapshot.data!.docs;
            users.retainWhere((element) =>
                element[UserProfile().id] == _auth.currentUser!.uid.toString());
            Map<String, dynamic> userData = users[0].data();
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackButtonWidget(
                  text: '',
                ),
                Center(
                  child: Container(
                    width: screenWidth*0.290,
                    height: screenHeight*0.150,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 1),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: userData[UserProfile().photo].isEmpty
                                ? AssetImage(
                                    "assets/images/icons/bottom-btn-user.png")
                                : NetworkImage(userData[UserProfile().photo])
                                    as ImageProvider)),
                  ),
                ),
                kHeight10,
                Center(
                  child: Text(
                    "Hi ${userData[UserProfile().name].isEmpty ? 'User' : userData[UserProfile().name]}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                 SizedBox(
                  height: screenHeight*0.020,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                              border:
                                  Border.all(color: const Color(0xFFE3842A))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/bottom-btn-user.png',
                                      height: screenHeight*0.032,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text(
                                          userData[UserProfile().name].isEmpty
                                              ? "Your Name"
                                              : userData[UserProfile().name],
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                        'assets/images/icons/Screenshot 2023-10-16 3.29.48 PM.png',
                                        height: screenHeight*0.024,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.all(9.0),
                                          child: Text(
                                            userData[UserProfile().email]
                                                    .isEmpty
                                                ? "Your Email"
                                                : userData[UserProfile().email],
                                            style: TextStyle(
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/icons/Screenshot_2023-10-16_3.23.06_PM-removebg-preview.png',
                                      height: screenHeight*0.035,
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsets.all(7.0),
                                        child: Text(
                                          userData[UserProfile().phone].isEmpty
                                              ? "Your Mobile No."
                                              : userData[UserProfile().phone],
                                          style: TextStyle(
                                              overflow: TextOverflow.ellipsis),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: screenHeight*0.018),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return  SettingScreen();
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
                                        radius: screenWidth * 0.05,
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
                              SizedBox(height: screenHeight*0.025),

                              InkWell(
                                onTap: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CustomerSupportScreen();
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
                                        radius: screenWidth * 0.05,
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
                      width: screenWidth * 0.860,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ProfileWidgetListTile(
                              text: 'Manage account',
                              icon: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/skills.png",
                                    height: screenHeight*0.025),
                              ),
                              ontap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return  ManageAccount();
                                }));
                              },
                            ),
                            ProfileWidgetListTile(
                              text: 'FAQs',
                              icon: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/faq.png",
                                    height: screenHeight*0.025),
                              ),
                              ontap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return FaqScreen();
                                }));
                              },
                            ),
                            ProfileWidgetListTile(
                              text: 'About us',
                              icon: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/group.png",
                                    height: screenHeight*0.025),
                              ),
                              ontap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const AboutUsPage();
                                }));
                              },
                            ),
                            ProfileWidgetListTile(
                              text: 'Term of use',
                              icon: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/contract.png",
                                    height: screenHeight*0.025),
                              ),
                              ontap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const TermsOfUsePage();
                                }));
                              },
                            ),
                            ProfileWidgetListTile(
                              text: 'Send Feedback',
                              icon: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/five.png",
                                    height: screenHeight*0.025),
                              ),
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
                              leading: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Image.asset(
                                    "assets/images/icons/logout.png",
                                    height: screenHeight*0.025),
                              ),
                              title: const Text(
                                'Logout',
                              ),
                            ),
                          ]),
                    ),
                  ),
                ),
                BottomNavWidget(
                    screenWidth: screenWidth, screenHeight: screenHeight)
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
