
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//local imports
import '../models/event.dart';
import '../utils/helper_functions.dart';

class EventService with ChangeNotifier {
  static const BASE_URL = 'sde-007.api.assignment.theinternetfolks.works';

  final Map<String, Event> _eventCache = {};

  final List<Event> _allEvents = [];
  final List<Event> _eventSearchResults = [];

  List<Event> get allEvents => _allEvents;

  List<Event> get eventSearchResults => _eventSearchResults;

  Future<void> getAllEvents() async {
    
    _allEvents.clear();
    try {
      final Uri url = Uri.https(BASE_URL, '/v1/event');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        // Successful call
        final body = jsonDecode(response.body);
        final eventList = body['content']?['data'];

        for (var item in eventList) {
          final Event newEvent = eventSerializer(item);

          _allEvents.add(newEvent);
          _eventCache[newEvent.id] = newEvent;

          // Process the newEvent object as desired
        }

        // log(_allEvents.toString());
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<void> searchAllEvents(String query) async {
    final Uri url = Uri.https(BASE_URL, '/v1/event', {'search': query});
    
    _eventSearchResults.clear();

    try {
      final http.Response response = await http.get(
        url,
      );

      if (response.statusCode == 200) {
        // Successful call
        final body = jsonDecode(response.body);
        final eventList = body['content']?['data'];

        for (var item in eventList) {
          final Event newEvent = eventSerializer(item);
          _eventSearchResults.add(newEvent);
        }
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }

  Future<Event> getEventDetails(int eventId) async {
    if (_eventCache.containsKey(eventId)) {
      // Return cached event details if available
      return _eventCache[eventId]!;
    }

    try {
      final Uri url = Uri.https(BASE_URL, '/v1/event/$eventId');

      final http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        // Successful call
        final body = jsonDecode(response.body);
        final eventData = body['content']['data'];

        final Event event = eventSerializer(eventData);
        notifyListeners();

        return event;
      } else {
        throw Exception('Request failed with status: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error: $error');
    }
  }
}
