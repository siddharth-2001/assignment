
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

//local import
import '../models/event.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/event_detail_grid.dart';
import '../widgets/custom_button.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({super.key, required this.event});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
              width: screenSize.width,
              height: 244,
              child: Image.network(
                event.bannerImage,
                fit: BoxFit.cover,
              )),
          Container(
            height: screenPadding.top + 48,
            width: screenSize.width,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(
                  0,
                  -5,
                ),
                blurRadius: 50,
                spreadRadius: 50,
              ),
            ]),
          ),
          CustomAppBar(
            title: 'Event Details',
            opacity: 0,
            titleColor: Colors.white,
            sigma: 0,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.arrow_left,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            trailing: 
          
                Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12), 
                    ),
                    child: Image.asset('assets/ribbon.png' ,colorBlendMode: BlendMode.overlay,),
                  ),
           
          ),
          Container(
            padding: const EdgeInsets.only(top: 244),
            height: screenSize.height,
            width: screenSize.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 16),
                    child: Text(
                      event.title,
                      style: const TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  SizedBox(
                      height: 200,
                      child: EventDetailGrid(
                        event: event,
                      )),
                  const Padding(
                    padding: EdgeInsets.only(
                        left: 24, right: 24, top: 48, bottom: 20),
                    child: Text(
                      'About Event',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                  ),
                  SizedBox(
                      child: Padding(
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, bottom: 10),
                    child: ReadMoreText(
                      event.description,
                      trimLines: 6,
                      colorClickableText: Colors.black,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          height: 1.7),
                      moreStyle: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )),
                  const SizedBox(
                    height: 82,
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.only(top: 0, bottom: 20),
              child: Center(child: CustomButton()),
            ),
          ),
        ],
      ),
    );
  }
}
