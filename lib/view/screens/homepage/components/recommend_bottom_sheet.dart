import 'dart:convert';

import 'package:cabskaro/view/screens/homepage/components/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart';

class RecommendSheet extends StatefulWidget {
  final List data;
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
  List extractedData = [];
  bool loading = false;
  bool allData = true;

  void showRecommendationTypes(List<String> type) async {
    setState(() {
      extractedData = [];
      loading = true;
      allData = false;
    });
    String? apiKey = dotenv.env['APIurl'];
    int radius = 10000;
    for (var element in type) {
      String url =
          "https://maps.googleapis.com/maps/api/place/nearbysearch/json?key=$apiKey&location=${widget.latitude},${widget.longitude}&radius=$radius&type=$element";
      Response response = await get(Uri.parse(url));
      List data = jsonDecode(response.body)["results"];
      for (var e in data) {
        e.putIfAbsent("category", () => element);
      }
      extractedData.addAll(data);
      print(url);
    }
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
                    extractedData = [];
                    allData = true;
                  });
                },
              ),
              Category(
                title: "Explore",
                onTap: () {
                  showRecommendationTypes(["tourist_attraction", "airport"]);
                },
              ),
              Category(
                title: "Railway station",
                onTap: () {
                  showRecommendationTypes(["train_station"]);
                },
              ),
              Category(
                title: "Bakery",
                onTap: () {
                  showRecommendationTypes(["bakery"]);
                },
              ),
              Category(
                title: "bank/ATM",
                onTap: () {
                  showRecommendationTypes(["bank", "atm"]);
                },
              ),
              Category(
                title: "Cafe/Restaurant",
                onTap: () {
                  showRecommendationTypes(["cafe", "restaurant"]);
                },
              ),
              Category(
                title: "Gas Station",
                onTap: () {
                  showRecommendationTypes(["gas_station"]);
                },
              ),
              Category(
                title: "Liquor Store",
                onTap: () {
                  showRecommendationTypes(["liquor_store"]);
                },
              ),
              Category(
                title: "Beauty, Health & Wellness",
                onTap: () {
                  showRecommendationTypes([
                    "beauty_salon",
                    "doctor",
                    "drugstore",
                    "gym",
                    "hair_care",
                    "hospital"
                  ]);
                },
              ),
              Category(
                title: "Pet Essentials",
                onTap: () {
                  showRecommendationTypes(
                      ["pet_store", "pharmacy", "veterinary_care"]);
                },
              ),
              Category(
                title: "Night Outs",
                onTap: () {
                  showRecommendationTypes(["night_club"]);
                },
              ),
              Category(
                title: "Shopping",
                onTap: () {
                  showRecommendationTypes(["shopping_mall", "shoe_store"]);
                },
              ),
              SizedBox(width: 10),
            ],
          ),
        ),
        loading
            ? Expanded(child: Center(child: CircularProgressIndicator()))
            : allData
                ? CategoryData(data: widget.data)
                : extractedData.isEmpty
                    ? Expanded(
                        child: Center(
                            child: Text("no places found regarding the category")))
                    : CategoryData(data: extractedData)
      ],
    );
  }
}

class CategoryData extends StatelessWidget {
  final List data;
  CategoryData({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        separatorBuilder: (context, index) {
          if (data[index]['rating'] == null) {
            return Container();
          }
          if (data[index]["photos"] == null) {
            return Container();
          }
          return Divider();
        },
        itemCount: data.length,
        itemBuilder: (context, index) {
          String symbol() {
            switch (data[index]["category"]) {
              case "tourist_attraction" || "airport":
                return "assets/images/nearbyplaces/explore.png";
              case "train_station":
                return "assets/images/nearbyplaces/train.png";
              case "bakery":
                return "assets/images/nearbyplaces/bakery.png";
              case "bank":
                return "assets/images/nearbyplaces/bank.png";
              case "atm":
                return "assets/images/nearbyplaces/atm.png";
              case "cafe":
                return "assets/images/nearbyplaces/cafe.png";
              case "restaurant":
                return "assets/images/nearbyplaces/restaurant.png";
              case "gas_station":
                return "assets/images/nearbyplaces/gas_station.png";
              case "liquor_store":
                return "assets/images/nearbyplaces/liquor.png";
              case "beauty_salon":
                return "assets/images/nearbyplaces/beauty.png";
              case ("doctor" || "drugstore" || "hospital"):
                return "assets/images/nearbyplaces/health.png";
              case "gym" || "hair_care":
                return "assets/images/nearbyplaces/wellness.png";
              case "pet_store" || "pharmacy" || "veterinary_care":
                return "assets/images/nearbyplaces/pet.png";
              case "night_club":
                return "assets/images/nearbyplaces/night_out.png";
              case "shopping_mall" || "shoe_store":
                return "assets/images/nearbyplaces/shopping.png";
              default:
                return "assets/images/nearbyplaces/cafe.png";
            }
          }

          if (data[index]['rating'] == null) {
            return Container();
          }
          if (data[index]["photos"] == null) {
            return Container();
          }
          return ListTile(
            onTap: () {
              String url = data[index]["photos"][0]["html_attributions"][0]
                  .toString()
                  .split('href="')[1]
                  .split('">')[0];
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowWebView(url: url),
                  ));
            },
            title: Text(data[index]["name"]),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index]["vicinity"]),
                Row(
                  children: [
                    Text(data[index]['rating'].toString()),
                    RatingBar.builder(
                      itemSize: 20,
                      glow: false,
                      ignoreGestures: true,
                      allowHalfRating: true,
                      initialRating: data[index]['rating'].toDouble(),
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
                        data[index]["user_ratings_total"].toString() +
                        ")"),
                  ],
                ),
              ],
            ),
            leading: data[index]["category"] == null
                ? Image.network(
                    data[index]["icon"],
                    width: 30,
                  )
                : Image.asset(
                    symbol(),
                    width: 30,
                  ),
            trailing: InkWell(
                focusColor: Colors.red,
                onTap: () async {
                  await FlutterShare.share(
                    title: "Share Link",
                    linkUrl: data[index]["photos"][0]["html_attributions"][0]
                        .toString()
                        .split('href="')[1]
                        .split('">')[0],
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: FaIcon(
                    FontAwesomeIcons.share,
                    size: 20,
                    color: Colors.green,
                  ),
                )),
          );
        },
      ),
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
          child: Text(title),
        ),
      ),
    );
  }
}
