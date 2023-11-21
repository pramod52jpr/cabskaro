import 'package:cabskaro/view/screens/homepage/components/webview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecommendSheet extends StatelessWidget {
  final Map data;
  const RecommendSheet({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data["results"].length,
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container();
        }
        if (data["results"][index]['rating'] == null) {
          return Container();
        }
        if (data["results"][index]["photos"]==null) {
          return Container();
        }
        return ListTile(
          onTap: () {
            String url = data["results"][index]["photos"][0]
                    ["html_attributions"][0]
                .toString()
                .split('href="')[1]
                .split('">')[0];
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowWebView(url: url),
                ));
          },
          title: Text(data["results"][index]["name"]),
          subtitle: Row(
            children: [
              Text(data["results"][index]['rating'].toString()),
              RatingBar.builder(
                itemSize: 20,
                glow: false,
                ignoreGestures: true,
                allowHalfRating: true,
                initialRating: data["results"][index]['rating'].toDouble(),
                unratedColor: Colors.grey,
                itemBuilder: (context, index) {
                  return Icon(
                    Icons.star,
                    color: Colors.amber,
                  );
                },
                onRatingUpdate: (value) {
                },
              ),
              Text(" ("+data["results"][index]["user_ratings_total"].toString()+")"),
            ],
          ),
          leading: Image.network(
            data["results"][index]["icon"],
            width: 30,
          ),
        );
      },
    );
  }
}
