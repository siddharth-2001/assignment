import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


//local imports
import '../services/event_service.dart';
import '../utils/helper_functions.dart';
import '../widgets/event_grid_tile.dart';

class SearchEventGrid extends StatefulWidget {
  final String query;

  const SearchEventGrid({super.key, this.query = ""});

  @override
  State<SearchEventGrid> createState() => _SearchEventGridState();
}

class _SearchEventGridState extends State<SearchEventGrid> {
  late Future _future;

  @override
  void initState() {
    _future = Provider.of<EventService>(context, listen: false)
        .searchAllEvents(widget.query);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenPadding = MediaQuery.of(context).viewPadding;

    return FutureBuilder(
      future: _future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final allEvents = Provider.of<EventService>(context, listen: false)
              .eventSearchResults;
          return LayoutBuilder(
            builder: (context, constraints) {
              final crossAxisCount = calculateCrossAxisCount(constraints);
              return GridView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                    top: screenPadding.top + 138,
                    left: 20,
                    right: 20,
                    bottom: 20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: 115,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 15,
                    crossAxisCount: crossAxisCount),
                itemCount: allEvents.length,
                itemBuilder: (context, index) => EventGridTile(
                  event: allEvents[index],
                  displayAddress: false,
                ),
              );
            },
          );
        }
      },
    );
  }


}
