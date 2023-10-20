import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;

    return   Scaffold(
      body: SafeArea(child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           BackButtonWidget(text: 'About Us'),
           SizedBox(height: screenHeight*0.020,),
           Padding(
             padding: EdgeInsets.all(20.0),
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text('Introduction',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),kHeight5,
                 Text('Cab Compare is a cutting-edge mobile application designed to simplify the process of finding and booking transportation services. Whether you need a ride to the airport, a quick trip across town, or a long-distance journey, Cab Compare is your one-stop solution for comparing and booking different cabservices, such as taxis, rideshares, and car rentals.'),
                 kHeight10,
                 Text('Value proposition',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                 Text('The value proposition of Cab Compare revolves around providing users wth a convenient, efficient, and transparent way to meet  their transportation needs. Here are the key value propositions Cab Compare:'),
                 kHeight10,
                 
      Text.rich(
        TextSpan(
          children: <TextSpan>[
        TextSpan(
          text: 'Time and Cost Savings:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text:
              ' Cab Compare saves users time and money by allowing them to compare various transportation options in one place. Users can quickly assess the most cost-effective and efficient mode of transportation for their needs.',
          style: TextStyle(),
        ),
          ],
        ),
      ),
      kHeight10,
      Text.rich(
        TextSpan(
          children: <TextSpan>[
        TextSpan(
          text: 'Transparency:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text:
              'Cab Compare offers transparency in pricing and service options. Users receive upfront fare estimates and can make informed decisions about their rides without unexpected fees or surcharges.',
          style: TextStyle(),
        ),
          ],
        ),
      ),
      kHeight10,
      Text.rich(
        TextSpan(
          children: <TextSpan>[
        TextSpan(
          text: 'Convenience:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text:
              ' The app simplifies the entire transportation booking process. With just a few taps, users can book a ride, track their driver, and make secure payments, all within the same platform.',
          style: TextStyle(),
        ),
          ],
        ),
      ),
      kHeight20,
      Text('Brand collaboration',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),kHeight5,
      Text('Partner with the ride-hailing platforms to provide ride credits or prizes for passengers. This can be part of a contest or loyalty program, encouraging users to engage with both brands.'),
      kHeight10,
      Text('Recognitions',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),kHeight5,
      Text('Check if the app is available on major app stores like the Apple App Store or Google Play Store. Look for user reviews, ratings,and the number of downloads, as these can provide insights into its popularity.'),
      ],
             ),
           )
          ],
        ),
      )),
    );
  }
}