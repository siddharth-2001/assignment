import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

//local
import '../widgets/custom_app_bar.dart';
import '../widgets/search_event_grid.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  Widget _searchGrid = const SearchEventGrid(query: "");

  @override
  Widget build(BuildContext context) {
    final accentColor = HexColor('#5669FF');
    final alternateTextColor = HexColor('#747688');
    final screenSize = MediaQuery.of(context).size;

    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
              height: screenSize.height,
              width: screenSize.width,
              child: _searchGrid,
            ),
            CustomAppBar(
              title: 'Search',
              bottom: SizedBox(
                height: 32,
                child: TextField(
                  style: const TextStyle(fontSize: 20),
                  controller: controller,
                  cursorColor: accentColor,
                  cursorWidth: 1,
                  cursorHeight: 25,
                  onEditingComplete: () {
                    setState(() {
                      _searchGrid = SearchEventGrid(
                        key: UniqueKey(),
                        query: controller.value.text,
                      );
                    });
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon:
                          const ImageIcon(AssetImage('assets/search.png')),
                      prefixIconColor: accentColor,
                      hintText: '   Type Event Name',
                      contentPadding: const EdgeInsets.only(bottom: 11),
                      hintStyle: TextStyle(
                          textBaseline: TextBaseline.ideographic,
                          fontSize: 20,
                          color: alternateTextColor,
                          fontWeight: FontWeight.w400),
                      floatingLabelBehavior: FloatingLabelBehavior.never),
                ),
              ),
              leading: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(CupertinoIcons.arrow_left)),
            ),
          ],
        ),
      ),
    );
  }
}
