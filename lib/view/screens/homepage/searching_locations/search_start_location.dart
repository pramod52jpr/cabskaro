import 'package:cabskaro/controller/provider/search_location_provider.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';


class SearchStartLocation extends StatelessWidget {
  const SearchStartLocation({super.key});
  @override
  Widget build(BuildContext context) {
  final provider = Provider.of<SearchStartLocationProvider>(context);
    return Material(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 25),
                Hero(
                  tag:"start",
                  child: Material(
                    child: TextFormField(
                      controller:provider.searchController,
                      autofocus: true,
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        prefixIcon: InkWell(
                          highlightColor: Colors.transparent,
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: const Icon(Icons.arrow_back, color: Colors.grey),
                        ),
                        contentPadding: EdgeInsets.zero,
                        hintText: "Search Here",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide:
                                const BorderSide(color: Colors.grey, width: 1)),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child:provider. data.isEmpty
                      ?  ListTile(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(
                                        location: "current",
                                        locType: "start",
                                      ),
                                    ));
                              },
                              contentPadding: EdgeInsets.zero,
                              leading: const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: FaIcon(FontAwesomeIcons.locationCrosshairs),
                              ),
                              title: const Text("Current Location"),
                            )
                      : ListView.builder(
                          itemCount:provider. data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashboardScreen(
                                        location:provider.data[index]['description'],
                                        locType: "start",
                                      ),
                                    ));
                              },
                              contentPadding: EdgeInsets.zero,
                              title: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(provider.data[index]['description']),
                              ),
                            );
                          },
                        ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
