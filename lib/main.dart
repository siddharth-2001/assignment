import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

//local
import './screens/home_screen.dart';
import './services/event_service.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      //color set to transperent or set your own color
      statusBarIconBrightness: Brightness.dark, 
      //set brightness for icons, like dark background light icons
   )
);
    return ChangeNotifierProvider(
      
      create: (context) => EventService(),
      child: MaterialApp(
        title: 'assignment',
        theme: ThemeData(
          textTheme: GoogleFonts.interTextTheme()
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
