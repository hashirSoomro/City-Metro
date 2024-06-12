import 'dart:convert';
import 'package:http/http.dart' as http;
import '../global-constants.dart';
import 'eventModel.dart';

class EventService {
  Future<List<MyEvent>> fetchEvents() async {
    final response = await http.get(Uri.parse(event_api));

    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      // Assuming the first element of the list contains the event objects
      List<dynamic> eventsList = jsonData[0];
      return eventsList.map((json) => MyEvent.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}
