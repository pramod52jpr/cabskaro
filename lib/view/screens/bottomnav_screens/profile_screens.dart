import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cabskaro/view/widgets/profile_widgets_listtile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackButtonWidget(text: '',),
Center(
  child: Container(
    width: 120, 
    height: 120, 
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      border: Border.all(color: Colors.grey, width: 1), 
    ),
    child: Container(
      margin: const EdgeInsets.only(left: 10),
      child: Image.asset(
        'assets/images/icons/bottom-btn-user.png',
        fit: BoxFit.cover, 
      ),
    ),
  ),
),
kHeight10,
const Center(child: Text('Hi Cabs karo !',style: TextStyle(fontWeight: FontWeight.bold),),
),
const SizedBox(height: 20,),
Row(
  children: [
        Container(
    
        margin: const EdgeInsets.only(left: 20),
    
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: const Color(0xFFE3842A))),
    
      height: 130,width: 260,
    
        child: Padding(
    
          padding: const EdgeInsets.all(8.0),
    
          child: Column(
    
            children: [
    
              Row(
    
                crossAxisAlignment: CrossAxisAlignment.start,
    
                children: [
    
              Image.asset('assets/images/icons/bottom-btn-user.png',height: 30,),
    
              const Padding(
    
                padding: EdgeInsets.all(8.0),
    
                child: Text('Cabs Karo'),
    
              )
    
          ],),
    
               Padding(
    
                 padding: const EdgeInsets.all(4.0),
    
                 child: Row(
    
                  children: [
    
                         Image.asset('assets/images/icons/Screenshot 2023-10-16 3.29.48 PM.png',height: 20,),
    
                         const Padding(
    
                  padding: EdgeInsets.all(8.0),
    
                  child: Text('  CabsKaro@gmail.com'),
    
                         )
    
                     ],),
    
                     
    
               ),
    
               Row(
    
                crossAxisAlignment: CrossAxisAlignment.start,
    
                children: [
    
              Image.asset('assets/images/icons/Screenshot_2023-10-16_3.23.06_PM-removebg-preview.png',height: 30,),
    
              const Padding(
    
                padding: EdgeInsets.all(8.0),
    
                child: Text('9999999999'),
    
              )
    
          ],),
    
            ],
    
          ),
    
        ),
      ),

      
      Container(
        margin: const EdgeInsets.only(left: 50),
        child: Column(
  children: [
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE3842A), width: 1), 
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/icons/setting.PNG', height: 30),
      ),
    ),
    const Text('Setting', style: TextStyle(fontSize: 15)),
    const SizedBox(height: 25),
    Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: const Color(0xFFE3842A), width: 1), 
      ),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.white,
        child: Image.asset('assets/images/icons/support.png', height: 25),
      ),
    ),
    const Text('Support')
  ],
)
      )
  ],
),
Expanded(
  child:   Card(
  
    child:   Container(
  
    height: 200,
  
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,),
  
    
  
      margin: const EdgeInsets.only(left: 20),
  
    
  
    width: 360,
  
    
  
      child:  ListView(
  
    
  
        children: [
  
  
  
               ProfileWidgetListTile(text: 'FAQs', icon: const Icon(Icons.abc),),
  
               ProfileWidgetListTile(text: 'Security & Privacy', icon: const Icon(Icons.abc),),
  
               ProfileWidgetListTile(text: 'Manage account', icon: const Icon(Icons.abc),),
  
               ProfileWidgetListTile(text: 'About us', icon: const Icon(Icons.abc),),
  
               ProfileWidgetListTile(text: 'Term of use', icon: const Icon(Icons.abc),),
  
               ProfileWidgetListTile(text: 'Send Feedback', icon: const Icon(Icons.abc),),
  
               const ListTile(
  
        leading: Icon(Icons.abc), 
  
        title: Text(
  
          'Logout', 
  
        ),
  
   
  
      ),
  
      
  
        ],
  
    
  
      ),),
  
  ),
),
 Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 10),
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
                             Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const DashboardScreen();
                            }));
                          },
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-first.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {
                           
                          },
                          child: Image.asset(
                            "assets/images/icons/bottom-btn-car.png",
                            height: 40,
                          )),
                      InkWell(
                          onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                              return const ProfileScreen();
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
      )),
    );
  }
}

