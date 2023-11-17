
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

Widget buildResponsiveRow({
  required BuildContext context,
  required String imageUrl,
  required String title,
  required String description,
  required String buttonUrl,
}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.225,
    child: Row(
      children: [
        Image.asset(
          imageUrl,
        ),
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.height * 0.010),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.520,
                  ),
                  child: Text(
                    title,
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width * 0.520,
                  ),
                  child: Text(
                    description,
                    style: GoogleFonts.lato(fontSize: 12),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.height * 0.050),
                  child: SizedBox(
                    height: 35,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.black),
                      ),
                      onPressed: () {
                        launchUrl(Uri.parse(buttonUrl));
                      },
                      child: Text(
                        'Get Started',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
