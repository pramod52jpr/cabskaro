import 'package:cabskaro/controller/services/news_api.dart';
import 'package:cabskaro/model/news_model.dart';
import 'package:cabskaro/view/const/sizedbox.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';


// class HistoryScreen extends StatelessWidget {
//   HistoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//  Provider.of<NewsApi>(context, listen: false).getNewsData();
//     final Completer<GoogleMapController> _completer = Completer();
//     double startLatitude = 0.0;
//     double startLongitude = 0.0;
//     double zoom = 1.0;

//     List<Marker> marker = [];

//     Map<PolylineId, Polyline> polylines = {};

//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.all(15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey, width: 1.0),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 150,
//                   width: double.infinity,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: GoogleMap(
//                     mapType: MapType.terrain,
//                     initialCameraPosition: CameraPosition(
//                         target: LatLng(startLatitude, startLongitude),
//                         zoom: zoom),
//                     markers: Set.of(marker),
//                     polylines: Set<Polyline>.of(polylines.values),
//                     onMapCreated: (controller) {
//                       _completer.complete(controller);
//                     },
//                   ),
//                 ),
//                 const SizedBox(
//                  // height: 10,
//                 ),
//               ],
//             ),
//           ),
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: SingleChildScrollView(
//                 child: Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
// Consumer<NewsApi>(
//         builder: (context, newsApi, child) {
//           if (newsApi.news.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }

//           return ListView.builder(
//             itemCount: newsApi.news.length,
//             itemBuilder: (context, index) {
//               Article article = newsApi.news[index];

//               return ListTile(
//                 title: Text(article.title ?? 'No Title'),
//                 subtitle: Text(article.description ?? 'No Description'),
//                 // Add more fields as needed
//               );
//             },
          
//           );
//         }
// )


//     // buildResponsiveRow(
//     //   imageUrl: 'assets/images/icons/earner-illustra.webp',
//     //   title: 'Drive when you\nwant, make what \nyou need',
//     //   description:
//     //       'Make money on your schedule with deliveries or rides—or both. You can use your own car or choose a rental through Uber.',
//     //   buttonUrl:
//     //       'https://bonjour.uber.com/step/7369676e-7570-7369-676e-75707369676e?marketing_vistor_id=beaf200c-ceee-4fca-ace6-1d536bfc69c0&uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
//     // ),
//     // kHeight10,
//     // buildResponsiveRow(
//     //   imageUrl: 'assets/images/icons/u4b-square.webp',
//     //   title: 'The Uber you know, reimagined for business',
//     //   description:
//     //       'Uber for Business is a platform for managing global rides and meals, and local deliveries, for companies of any size.',
//     //   buttonUrl:
//     //       'https://www.uber.com/in/en/business/getting-started/?uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
//     // ),
//     // kHeight10,
//     // buildResponsiveRow(
//     //   imageUrl: 'assets/images/icons/fleet-management.webp',
//     //   title: 'Make money by renting out your\n car',
//     //   description:
//     //       'Connect with thousands of drivers and earn more per week with Uber’s free fleet management tools.',
//     //   buttonUrl:
//     //       'https://www.uber.com/in/en/earn/fleet-management/?uclick_id=8eaa7613-4f4f-4705-bff6-f5e8aab5fc2d', context: context,
//     // ),
//   ],
// ),

//               ),
//             ),
//           ),
//           BottomNavigator(
//             onTapDashboard: () {
//               Navigator.pushAndRemoveUntil(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => DashboardScreen(),
//                   ),
//                   (route) => false);
//             },
//             onTapRebook: () {},
//             onTapAccount: () {
//               Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProfileScreen(),
//                   ));
//             },
//           ),
//         ],
//       )),
//     );
//   }
// }


// class HistoryScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     Provider.of<NewsApiProvider>(context, listen: false).getNewsData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('News'),
//       ),
//       body: Consumer<NewsApiProvider>(
//         builder: (context, newsApi, child) {
//           if (newsApi.news.isEmpty) {
//             return Center(child: CircularProgressIndicator());
//           }
          
//           return Column(
//             children: [
//               Expanded(
// child: ListView.separated(
//   separatorBuilder: (context, index) => Divider(),
//   itemCount: 34,
//   itemBuilder: (context, index) {
//     // Exclude items with index 11 and 12
//     if (index == 11) {
//        newsApi.news.removeAt(11);
//     }
//       if (index == 10) {
//      newsApi.news.removeAt(10);
//     }

//     if (index >= 0 && index < newsApi.news.length) {
//       ArticleModel article = newsApi.news[index];
//       bool isValidUrl = Uri.tryParse(article.urlToImage ?? '') != null;

//       return InkWell(
//         onTap:(){
//           launchUrl(Uri.parse(article.url));
//         },
//         child: ListTile(
//           title: isValidUrl ? ClipRRect(
//             borderRadius: BorderRadius.circular(10),
//             child: Image.network(article.urlToImage ?? '')) : Container(),
//           subtitle: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(article.title,style: GoogleFonts.lato(fontWeight: FontWeight.bold,fontSize: 17),),
//               kHeight10,
//               Text(article.description ?? 'No Description',style: GoogleFonts.lato(fontWeight: FontWeight.w400),),
//               kHeight5,
//               Text(
//                 article.publishedAt != null
//                     ? DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(article.publishedAt))
//                     : 'No Description',
//                 style: GoogleFonts.lato(fontWeight: FontWeight.w700),
//               ),
//             ],
//           ),
//         ),
//       );
//     } else {
//       return Container();
//     }
//   },
// ),

//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

// class HistoryScreen extends StatelessWidget {//}
class HistoryScreen extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Provider.of<NewsApiProvider>(context, listen: false).getNewsData();

    return Scaffold(
      body: Consumer<NewsApiProvider>(
        builder: (context, newsApi, child) {
          if (newsApi.news.isEmpty) {
            return Center(
              child: Shimmer.fromColors(
                baseColor: Color.fromARGB(255, 218, 218, 218),
                highlightColor: Color.fromARGB(255, 237, 237, 237),
                child: ListView.builder(
                  itemCount: 20, 
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Container(
                            height: 150,
                            color: Colors.white,
                          ),kHeight10,
                            Container(
                            height: 60,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      subtitle: Container(
                        height: 30,
                        color: Colors.white,
                      ),
                    );
                  },
                ),
              ),
            );
          }

          return CustomScrollView(
            
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                expandedHeight: 120.0,
                floating: false,
                pinned: true,
                leading: BackButton(color: Colors.white),
                flexibleSpace: FlexibleSpaceBar(
                  title: Text('Cabs News', style: GoogleFonts.lato(fontWeight: FontWeight.bold)),
                ),
                backgroundColor: Colors.black,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    if (index == 4 ||index==12||index==3) {
                      return Container();
                    }
                    if (index >= 0 && index < newsApi.news.length) {
                      ArticleModel article = newsApi.news[index];
                      bool isValidUrl = Uri.tryParse(article.urlToImage ?? '') != null;

                      return InkWell(
                        onTap: () {
                          launchUrl(Uri.parse(article.url));
                        },
                        child: ListTile(
                          title: isValidUrl
                              ? ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(article.urlToImage ?? ''),
                                )
                              : Container(),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                article.title,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                              ),
                              SizedBox(height: 10),
                              Text(
                                article.description ?? 'No Description',
                                style: TextStyle(fontWeight: FontWeight.w400),
                              ),
                              SizedBox(height: 5),
                              // Text(
                              //   article.publishedAt != null
                              //       ? DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.parse(article.publishedAt))
                              //       : 'No Description',
                              //   style: TextStyle(fontWeight: FontWeight.w700),
                              // ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Container();
                    }
                  },
                  childCount: 34,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}