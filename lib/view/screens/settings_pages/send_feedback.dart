import 'package:cabskaro/view/widgets/back_button_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SendFeedbackPage extends StatelessWidget {
  
  final TextEditingController feedbackController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  SendFeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? userId = FirebaseAuth.instance.currentUser?.uid;

    return Scaffold(
      body: SafeArea(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const BackButtonWidget(text: 'FEEDBACK'),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                       validator: (feedback) {
                              if(feedback!.isEmpty){
                                return 'Send any feedback';
                              }
                              return null;
                            },
                  controller: feedbackController,
                ),
              ),
              SizedBox(
                width: 100,
                child: ElevatedButton(
                onPressed: () async {
           if (formKey.currentState!.validate()) {
           final FirebaseFirestore firestore = FirebaseFirestore.instance;
            await firestore.collection('feedback').add({
           'text': feedbackController.text,
           'timestamp': FieldValue.serverTimestamp(),
           'id':userId,
            });
            feedbackController.clear();
             final snackBar = SnackBar(
             content: Text('Thank you for your feedback!'),
             duration: Duration(seconds: 3), 
            );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFE3842A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  child: const Text('Send',style: TextStyle(color: Colors.white),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// class ArrivalController extends GetxController {
//   late RxInt currentIndex = 0.obs;
//   RxList<NewArrivalModel> arrivals = <NewArrivalModel>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     fetchProduct();
//   }

//   void fetchProduct() async {
//     try {
//       final response = await http.get(Uri.parse(
//           'https://dev-api.myhraki.com/web/productgen/api/v1/search?PageNumber=0&PageSize=10'));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         print('API Response: $data');

//         if (data.containsKey('result')) {
//           final List<dynamic>? resultData = data['result'];

//           if (resultData != null) {
//             List<NewArrivalModel> newArrivals = resultData
//                 .cast<Map<String, dynamic>>()
//                 .map((map) {
//                   var model = NewArrivalModel.fromJson(map);
//                   print('Parsed Model: $model');
//                   return model;
//                 })
//                 .toList();

//             arrivals.assignAll(newArrivals);
//           } else {
//             print('Error fetching products: Results data is null.');
//           }
//         } else {
//           print('Error fetching products: Results key not found.');
//         }
//       } else {
//         throw Exception(
//             'Failed to load products. Status code: ${response.statusCode}');
//       }
//     } catch (e) {
//       print('Error fetching products: $e');
//     }
//   }
// }

// class NewArrivalModel {
//   final String productId;
//   final String title;
//   final String quantity;
//   final String description;
//   final String price;
//   final String thumbnailURI;

//   NewArrivalModel({
//     required this.productId,
//     required this.title,
//     required this.quantity,
//     required this.description,
//     required this.price,
//     required this.thumbnailURI,
//   });

//   factory NewArrivalModel.fromJson(Map<String, dynamic> json) {
//     return NewArrivalModel(
//       productId: json['productId'].toString(),
//       title: json['title'].toString(),
//       quantity: json['quantity'].toString(),
//       description: json['description'].toString(),
//       price: json['price'].toString(),
//       thumbnailURI: json['thumbnailURI'].toString(),
//     );
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'title': title,
//       'quantity': quantity,
//       'description': description,
//       'price': price,
//       'thumbnailURI': thumbnailURI,
//     };
//   }
// }

// class ProductPage extends StatelessWidget {
//   final ArrivalController arrivalController = Get.put(ArrivalController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Product Page'),
//       ),
//       body: Obx(() {
//         if (arrivalController.arrivals.isEmpty) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           return ListView.builder(
//             itemCount: arrivalController.arrivals.length,
//             itemBuilder: (context, index) {
//               final product = arrivalController.arrivals[index];
//               return ListTile(
//                 title: Text(product.title),
//                 subtitle: Text(product.productId),
//               );
//             },
//           );
//         }
//       }),
//     );
//   }
// }

