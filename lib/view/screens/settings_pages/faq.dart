import 'package:cabskaro/controller/provider/faq_screen_provider.dart';
import 'package:cabskaro/view/screens/settings_pages/faqs_questions_answers.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';


class FaqScreen extends StatelessWidget {
@override
    Widget build(BuildContext context) {
    final queryProvider=Provider.of<FaqScreenProvider>(context,listen: true);
    final screenHeight = MediaQuery.of(context).size.height;
    List<Map<String, String>> filteredItems =queryProvider.query.isEmpty
        ? faqItems
        : faqItems
            .where((item) =>
                item['title']!.toLowerCase().contains(queryProvider.query.toLowerCase()))
            .toList();

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: screenHeight*0.030),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("FAQ", style: TextStyle(fontSize: screenHeight*0.025, fontWeight: FontWeight.bold)),
                Text("s", style: TextStyle(fontSize: screenHeight*0.025, fontWeight: FontWeight.bold, color: Color.fromRGBO(227, 132, 42, 0.7)),
                ),
              ],
            ),
            SizedBox(height: screenHeight*0.010),
            Padding(
              padding:  EdgeInsets.all(screenHeight*0.025),
              child: TextFormField(
                    onChanged: (value) {
                     queryProvider.updateQuery(value);
                  },
                cursorColor: Colors.grey,
                decoration: InputDecoration(
                  hintText: "Search for topics or questions",
                     prefixIcon: Icon(Icons.search),              
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight*0.050),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(screenHeight*0.050),
                  ),
                  contentPadding: EdgeInsets.symmetric(horizontal: screenHeight*0.030),
              
              
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: filteredItems.isEmpty
                    ? Center(
                        child: Lottie.asset('animations/Animation - 1698729862860.json'),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        itemCount: filteredItems.length,
                        itemBuilder: (context, index) {
                          if (index == filteredItems.length - 1) {
                            return SingleChildScrollView(
                              child: GFAccordion(
                                title: filteredItems[index]['title'],
                                content: filteredItems[index]['content'],
                              ),
                            );
                          } else {
                            return GFAccordion(
                              title: filteredItems[index]['title'],
                              content: filteredItems[index]['content'],
                            );
                          }
                        },
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
