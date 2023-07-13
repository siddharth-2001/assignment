import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

//local imports
import '../widgets/custom_app_bar.dart';
import '../widgets/home_event_grid.dart';
import '../screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const HomeEventGrid(),
            CustomAppBar(
              title: "Events",
              trailing: Row(
                children: [
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.of(context).push(PageTransition(child: const SearchScreen(), type: PageTransitionType.fade));
                      },
                      icon: const ImageIcon(AssetImage('assets/search.png'))),
                  IconButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {},
                      icon: const ImageIcon(AssetImage('assets/more.png')))
                ],
              ),
            ),
          ],
        ));
  }
}
