import 'package:cabskaro/controller/provider/categorie_provider.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:cabskaro/view/screens/homepage/recommended_screen/categiorie_screen.dart';
import 'package:cabskaro/view/screens/homepage/recommended_screen/categorie_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RecommendSheet extends StatelessWidget {
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
  Widget build(BuildContext context){
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
                  Provider.of<RecommendationProvider>(context, listen: false).resetData();
                },
              ),
              Category(
                title: "Explore",
                onTap: () {
                  Provider.of<RecommendationProvider>(context, listen: false)
                      .showRecommendationTypes(latitude, longitude, ["tourist_attraction", "airport"]);
                },
              ),
               Category(
                title: "Railway station",
                onTap: () {
               Provider.of<RecommendationProvider>(context,listen: false)
               .showRecommendationTypes(latitude, longitude, ["train_station"]);
                },
              ),
              Category(
                title: "Bakery",
                onTap: () {
                Provider.of<RecommendationProvider>(context,listen: false)
                .showRecommendationTypes(latitude, longitude,["bakery"]);
                },
              ),
              Category(
                title: "bank/ATM",
                onTap: () {
               Provider.of<RecommendationProvider>(context,listen: false)
               .showRecommendationTypes(latitude, longitude,["bank", "atm"]);
                },
              ),
              Category(
                title: "Cafe/Restaurant",
                onTap: () {
                Provider.of<RecommendationProvider>(context,listen: false)
                .showRecommendationTypes(latitude, longitude,["cafe", "restaurant"]);
                },
              ),
              Category(
                title: "Gas Station",
                onTap: () {
               Provider.of<RecommendationProvider>(context,listen: false)
               .showRecommendationTypes(latitude, longitude,["gas_station"]);
                },
              ),
              Category(
                title: "Liquor Store",
                onTap: () {
              Provider.of<RecommendationProvider>(context,listen: false)
              .showRecommendationTypes(latitude, longitude,["liquor_store"]);
                },
              ),
              Category(
                title: "Beauty, Health & Wellness",
                onTap: () {
               Provider.of<RecommendationProvider>(context,listen: false)
               .showRecommendationTypes(latitude, longitude,[
                    "beauty_salon",
                    "doctor",
                    "drugstore",
                    "gym",
                    "hair_care",
                    "hospital",
                  ]);
                },
              ),
              Category(
                title: "Pet Essentials",
                onTap: () {
                 Provider.of<RecommendationProvider>(context,listen: false)
                 .showRecommendationTypes(
                    latitude, longitude,  ["pet_store", "pharmacy", "veterinary_care"]);
                },
              ),
              Category(
                title: "Night Outs",
                onTap: () {
                 Provider.of<RecommendationProvider>(context,listen: false)
                 .showRecommendationTypes(latitude, longitude,["night_club"]);
                },
              ),
              Category(
                title: "Shopping",
                onTap: () {
                  Provider.of<RecommendationProvider>(context,listen: false)
                  .showRecommendationTypes(latitude, longitude,["shopping_mall", "shoe_store"]);
                },
              ),
              kWidth10,            
           ],
          ),
        ),
        kHeight10,
        Consumer<RecommendationProvider>(
          builder: (context, provider, _) {
            return provider.loading
                ? Expanded(child: Center(child: CircularProgressIndicator()))
                : provider.allData
                    ? CategoryData(data: data)
                    : provider.extractedData.isEmpty
                        ? Expanded(
                            child: Center(child: Text("No places found regarding the category")),
                          )
                        : CategoryData(data: provider.extractedData);
          },
        ),
            ],
          );  
  }
}