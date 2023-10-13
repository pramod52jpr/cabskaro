import 'package:cabskaro/controller/uber_get_api.dart';
import 'package:flutter/material.dart';

class UberTripEstimatesScreen extends StatelessWidget {
  const UberTripEstimatesScreen({super.key});

  Future<Map<String, dynamic>?> _fetchUberTripEstimates() async {
    return requestUberTripEstimates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Uber Trip Estimates'),
      ),
      body: FutureBuilder<Map<String, dynamic>?>(
        future: _fetchUberTripEstimates(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available.'));
          } else {
            
            final responseData = snapshot.data!;
            final estimatedPrice = responseData['estimated_price'];
            final estimatedDuration = responseData['estimated_duration'];

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Estimated Price: $estimatedPrice'),
                  Text('Estimated Duration: $estimatedDuration minutes'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
