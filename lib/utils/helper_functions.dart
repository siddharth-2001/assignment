import 'package:flutter/material.dart';

//local import
import '../models/event.dart';

Event eventSerializer(Map eventJson) => Event(
            id: eventJson['id'].toString(),
            title: eventJson['title'],
            description: eventJson['description'],
            bannerImage: eventJson['banner_image'],
            dateTime: DateTime.parse(eventJson['date_time']),
            organiserName: eventJson['organiser_name'],
            organiseIcon: eventJson['organiser_icon'],
            venueName: eventJson['venue_name'],
            venueCity: eventJson['venue_city'],
            venueCountry: eventJson['venue_country'],
          );

int calculateCrossAxisCount(BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;
    const minItemWidth = 327.0;
    final crossAxisCount = (screenWidth / minItemWidth).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }