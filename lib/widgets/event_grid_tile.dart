import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:page_transition/page_transition.dart';

//local imports
import '../models/event.dart';
import '../screens/event_detail_screen.dart';

class EventGridTile extends StatelessWidget {
  final Event event;
  final bool displayAddress;

  const EventGridTile(
      {super.key, required this.event, this.displayAddress = true});

  @override
  Widget build(BuildContext context) {
    final accentColor = HexColor('#5669FF');
    final alternateTextColor = HexColor('#747688');
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(PageTransition(child: EventDetailScreen(event: event), type: PageTransitionType.fade));
      },
      child: Container(
        width: 327,
        height: 115,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                offset: const Offset(
                  0,
                  7,
                ),
                blurRadius: 23,
                spreadRadius: 0,
              ),
            ]),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 85,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              clipBehavior: Clip.hardEdge,
              child: Image.network(
                event.bannerImage,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: displayAddress
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${DateFormat.MMMEd().format(event.dateTime)} • ${DateFormat.jm().format(event.dateTime)}',
                    style: TextStyle(
                        color: accentColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                  Text(
                    event.title,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  if (displayAddress)
                    Row(
                      children: [
                        Image.asset('assets/map-pin.png'),
                        const SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: Text(
                            overflow: TextOverflow.fade,
                            '${event.venueName} • ${event.venueCity}, ${event.venueCountry}',
                            style: TextStyle(
                                fontSize: 14,
                                color: alternateTextColor,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
