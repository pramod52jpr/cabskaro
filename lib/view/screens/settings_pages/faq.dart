
import 'package:cabskaro/view/screens/settings_pages/faqs_questions_answers.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';


class FaqScreen extends StatefulWidget {
  @override
  _FaqScreenState createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {

String query = '';

@override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    List<Map<String, String>> filteredItems = query.isEmpty
        ? faqItems
        : faqItems
            .where((item) =>
                item['title']!.toLowerCase().contains(query.toLowerCase()))
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
                    setState(() {
                      query = value;
                    });
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
                        child: Text('No Result'),
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
