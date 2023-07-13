import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';

//local imports
import '../models/event.dart';
import '../utils/helper_functions.dart';

class EventDetailGrid extends StatelessWidget {
  final Event event;
  const EventDetailGrid({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final alternateTextColor = HexColor('#747688');
    return LayoutBuilder(
      builder: (context, constraints) {
        return GridView(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          physics: const BouncingScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: calculateCrossAxisCount(constraints),
              mainAxisExtent: 53,
              mainAxisSpacing: 20),
          children: [
            ListTile(
              leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.network(
                    event.organiseIcon,errorBuilder: (context, error, stackTrace) => Image.asset('assets/icon1.png'),
                    fit: BoxFit.cover,
                  )),
              title: Text(event.organiserName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              subtitle: Text('Organizer',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: alternateTextColor)),
            ),
            ListTile(
                leading: SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset(
                      'assets/Date.png',
                      fit: BoxFit.cover,
                    )),
                title: Text(
                  '${DateFormat.d().format(event.dateTime)} ${DateFormat.LLLL().format(event.dateTime)}, ${DateFormat.y().format(event.dateTime)}',
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  '${DateFormat.EEEE().format(event.dateTime)}, ${DateFormat.jm().format(event.dateTime)}',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: alternateTextColor),
                )),
            ListTile(
              leading: SizedBox(
                  height: 50,
                  width: 50,
                  child: Image.asset('assets/Location.png')),
              title: Text(event.venueName,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.w600)),
              subtitle: Text('${event.venueCity}, ${event.venueCountry}',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: alternateTextColor)),
            )
          ],
        );
      },
    );
  }

}
