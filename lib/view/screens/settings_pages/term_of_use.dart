import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:flutter/material.dart';

class TermsOfUsePage extends StatelessWidget {
  const TermsOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
               InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  children: [
     Container(
       height: 35,
       width: 35,
       margin: const EdgeInsets.all(14),
       decoration: const BoxDecoration(
           color: Colors.white,
           shape: BoxShape.circle,
           boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)]),
       child: const Icon(Icons.arrow_back),
     ),const SizedBox(width: 90,),
     
                  ],
                ),
              ),
              const Text('TERM OF USE',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),

              
              const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('I can provide you with a general outline of the terms of use typically found in many mobile applications, including those related to ride-hailing or transportation comparison services like Cab Compare. However, the specific terms of use for Cab Compare may vary, and its important to consult the apps official terms and conditions for the most accurate and up-to-date information. Here is a common set of terms you might find:'),
                    kHeight10,
                    Text('Acceptance of Terms:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('Users are required to read and accept the terms of use before using the Cab Compare app. By using the app, users agree to abide by these terms.'),
                    kHeight10,
                    Text('User Eligibility:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('Users must be of legal age to use the app and have the capacity to enter into a legally binding agreement.'),
                    kHeight10,
                    Text('User Account Registration:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('Users may be required to create an account to access certain features of the app. They are responsible for maintaining the confidentiality of their account information'),
                    kHeight10,
                    Text('User Conduct:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('Users are expected to use the app in a lawful and responsible manner and not engage in activities that could harm the app, other users, or third parties.'),kHeight10,
                    Text('Service Availability:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('The app may specify the availability of its services in certain geographic areas. It may also state that service availability is subject to change without notice.'),kHeight10,
                    Text('Pricing and Payments:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('The app may outline its pricing structure and payment methods. It may also include information about refunds, cancellation fees, and other payment-related policies.'),kHeight10,
                    Text('User Content:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('Users may be prohibited from posting, uploading, or sharing any content that violates copyright, trademark, or other intellectual property rights, as well as content that is offensive or illegal.'),kHeight10,
                    Text('Privacy Policy:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('The app should have a privacy policy that outlines how user data is collected, used, and protected. Users are encouraged to review this policy.'),kHeight10,
                    Text('Intellectual Property:',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                    Text('The app may specify that all intellectual property rights related to the app and its content are owned by the apps developers or licensors.'),kHeight10,
                 Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                TextSpan(
                  text: 'Disclaimers and Limitations of Liability: - ',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                TextSpan(
                  text:
                          'The terms of use may include disclaimers regarding the apps accuracy, availability, and performance. It may also limit the apps liability for certain types of damages.',
                  style: TextStyle(),
                ),
                          ],
                        ), 
                        ),kHeight10,
                         Text.rich(
                        TextSpan(
                          children: <TextSpan>[
                TextSpan(
                  text: 'Termination of Service: - ',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                TextSpan(
                  text:
                          'The terms of use may include disclaimers regarding the apps accuracy, availability, and performance. It may also limit the apps liability for certain types of damages.',
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
                  text: 'Governing Law and Dispute Resolution: -',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                TextSpan(
                  text:
                          'The terms of use may specify the governing law that applies to any disputes and the dispute resolution process, which could include arbitration or mediation',
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
                  text: 'Changes to Terms: - ',
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                ),
                TextSpan(
                  text:
                          'The app may reserve the right to change the terms of use, and users may be notified of such changes through the app or via email.',
                  style: TextStyle(),
                ),
                          ],
                        ),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}