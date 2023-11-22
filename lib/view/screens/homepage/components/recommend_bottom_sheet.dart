import 'dart:convert';

import 'package:cabskaro/view/screens/homepage/components/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart';

class RecommendSheet extends StatefulWidget {
  final Map data;
  final double latitude;
  final double longitude;
  RecommendSheet({
    super.key,
    required this.data,
    required this.latitude,
    required this.longitude,
  });

  @override
  State<RecommendSheet> createState() => _RecommendSheetState();
}

class _RecommendSheetState extends State<RecommendSheet> {
  Map extractedData = {};
  bool loading = false;

  void showRecommendationTypes(String type) async {
    setState(() {
      loading = true;
    });
    String? apiKey = dotenv.env['APIurl'];
    int radius = 10000;
    String url =
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&location=${widget.latitude},${widget.longitude}&radius=$radius&type=$type";
    Response response = await get(Uri.parse(url));
    extractedData = jsonDecode(response.body);
    loading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 10),
              Category(
                title: "All",
                onTap: () {
                  setState(() {
                    extractedData = {};
                  });
                },
              ),
              Category(
                title: "Restaurent",
                onTap: () {
                  showRecommendationTypes("restaurant");
                },
              ),
              Category(
                title: "Hospital",
                onTap: () {
                  showRecommendationTypes("hospital");
                },
              ),
              Category(
                title: "Night Club",
                onTap: () {
                  showRecommendationTypes("night_club");
                },
              ),
              Category(
                title: "school",
                onTap: () {
                  showRecommendationTypes("school");
                },
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        loading
            ? Expanded(child: Center(child: CircularProgressIndicator()))
            : extractedData.isEmpty
                ? Expanded(
                    child: ListView.builder(
                      itemCount: widget.data["results"].length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container();
                        }
                        if (widget.data["results"][index]['rating'] == null) {
                          return Container();
                        }
                        if (widget.data["results"][index]["photos"] == null) {
                          return Container();
                        }
                        return ListTile(
                          onTap: () {
                            String url = widget.data["results"][index]["photos"]
                                    [0]["html_attributions"][0]
                                .toString()
                                .split('href="')[1]
                                .split('">')[0];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowWebView(url: url),
                                ));
                          },
                          title: Text(widget.data["results"][index]["name"]),
                          subtitle: Row(
                            children: [
                              Text(widget.data["results"][index]['rating']
                                  .toString()),
                              RatingBar.builder(
                                itemSize: 20,
                                glow: false,
                                ignoreGestures: true,
                                allowHalfRating: true,
                                initialRating: widget.data["results"][index]
                                        ['rating']
                                    .toDouble(),
                                unratedColor: Colors.grey,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                                onRatingUpdate: (value) {},
                              ),
                              Text(" (" +
                                  widget.data["results"][index]
                                          ["user_ratings_total"]
                                      .toString() +
                                  ")"),
                            ],
                          ),
                          leading: Image.network(
                            widget.data["results"][index]["icon"],
                            width: 30,
                          ),
                        );
                      },
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: extractedData["results"].length,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          return Container();
                        }
                        if (extractedData["results"][index]['rating'] == null) {
                          return Container();
                        }
                        if (extractedData["results"][index]["photos"] == null) {
                          return Container();
                        }
                        return ListTile(
                          onTap: () {
                            String url = extractedData["results"][index]
                                    ["photos"][0]["html_attributions"][0]
                                .toString()
                                .split('href="')[1]
                                .split('">')[0];
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ShowWebView(url: url),
                                ));
                          },
                          title: Text(extractedData["results"][index]["name"]),
                          subtitle: Row(
                            children: [
                              Text(extractedData["results"][index]['rating']
                                  .toString()),
                              RatingBar.builder(
                                itemSize: 20,
                                glow: false,
                                ignoreGestures: true,
                                allowHalfRating: true,
                                initialRating: extractedData["results"][index]
                                        ['rating']
                                    .toDouble(),
                                unratedColor: Colors.grey,
                                itemBuilder: (context, index) {
                                  return Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  );
                                },
                                onRatingUpdate: (value) {},
                              ),
                              Text(" (" +
                                  extractedData["results"][index]
                                          ["user_ratings_total"]
                                      .toString() +
                                  ")"),
                            ],
                          ),
                          leading: Image.network(
                            extractedData["results"][index]["icon"],
                            width: 30,
                          ),
                        );
                      },
                    ),
                  )
      ],
    );
  }
}

class Category extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  Category({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(100)),
            child: Text(title)),
      ),
    );
  }
}
