  import 'package:cloud_firestore/cloud_firestore.dart';

  class CityLinksService {
    
    final FirebaseFirestore firestore = FirebaseFirestore.instance;


    Future<Map<String, String?>> getCityLinks(String cityName) async {
      try {
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await firestore.collection('city_links').doc(cityName).get();
        Map<String, dynamic>? data = snapshot.data();
        if (data != null) {
          
          return {
            'eventsUrl': data['eventsUrl'] ?? null,
            
            'hotelsUrl': data['hotelsUrl'] ?? null,
          };
        } else {
          return {'eventsUrl': null, 'hotelsUrl': null};
        }
      } catch (e) {
        print('Error fetching city links: $e');
        return {'eventsUrl': null, 'hotelsUrl': null};
      }
    }
  }
