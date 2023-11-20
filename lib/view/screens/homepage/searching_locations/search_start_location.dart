import 'package:cabskaro/controller/provider/search_location_provider.dart';
import 'package:cabskaro/controller/services/search_location.dart';
import 'package:cabskaro/view/screens/homepage/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';


class SearchStartLocation extends StatefulWidget {
  const SearchStartLocation({super.key});

  @override
  State<SearchStartLocation> createState() => _SearchStartLocationState();
}

class _SearchStartLocationState extends State<SearchStartLocation> {

  final TextEditingController _searchController = TextEditingController();
  var uuid = const Uuid();

@override
  void initState() {
    _searchController.addListener(() {
     SearchStartLocationFuntion().onChange(_searchController.text.toString(), context.read<SearchStartLocationModel>());
    });
    super.initState();
  }
  Widget build(BuildContext context) {  
    final model=Provider.of<SearchStartLocationModel>(context,listen: true);
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
                      controller:_searchController,
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
                  child:model. data.isEmpty
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
                      : ListView.separated(
                       separatorBuilder: (BuildContext context, int index){
                        return Divider(thickness: 0.5,);
                       },
                          itemCount:model.data.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DashboardScreen(
                                        location:model. data[index]['description'],
                                        locType: "start",
                                      ),
                                    ));
                              },
                              contentPadding: EdgeInsets.zero,
                              title: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 30),
                                child: Text(model.data[index]['description'],style: GoogleFonts.lato(fontSize: 15),),
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
