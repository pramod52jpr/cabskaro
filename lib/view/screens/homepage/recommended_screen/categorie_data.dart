import 'package:cabskaro/view/screens/homepage/components/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:google_fonts/google_fonts.dart';

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
              case "restaurant":
                if (data[index]["name"].toString().startsWith("KFC")) {
                  return "assets/images/nearbyplaces/download.png";
                }
              else if (data[index]["name"]
                    .toString()
                    .startsWith("Pizza Hut")) {
                  return "assets/images/nearbyplaces/logo-300x300.ed09f0955306cb0be42c35092733b5c2.png";
                }
                return "assets/images/nearbyplaces/cafe.png";
              case "cafe":
                if (data[index]["name"].toString().startsWith("Starbucks")) {
                  return "assets/images/nearbyplaces/Starbucks_Corporation_Logo_2011.svg.png";
                }
                
                 else if (data[index]["name"]
                    .toString()
                    .startsWith("McDonald's")) {
                  return "assets/images/nearbyplaces/images.png";
                }
                
                else if (data[index]["name"]
                    .toString()
                    .startsWith("KFC")) {
                  return "assets/images/nearbyplaces/png-transparent-kfc-logo-colonel-sanders-kfc-fried-chicken-fast-food-hot-chicken-kfc-bucket-s-text-fast-food-restaurant-logo.png";
                }
                
                
                return "assets/images/nearbyplaces/restaurant.png";
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
            title: Text(data[index]["name"],style: GoogleFonts.lato(fontWeight: FontWeight.w600),),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data[index]["vicinity"],style: GoogleFonts.lato(),),
                Row(
                  children: [
                    Text(data[index]['rating'].toString(),style: GoogleFonts.lato()),
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
                        ")",style: GoogleFonts.lato(),),
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
                  child: Icon(
                   Icons.ios_share,
                    size: 27,
                    color: Colors.black,
                  ),
                )),
          );
        },
      ),
    );
  }
}

