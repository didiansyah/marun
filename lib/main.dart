import 'package:flutter/material.dart';
import 'package:marun/components/colors.dart';
import 'package:marun/screens/home.dart';
import 'package:marun/screens/worldlist.dart';
import 'package:marun/screens/about.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

void main(){
  runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Bgcolor, fontFamily: 'Staatliches'),
      home: MyApp()));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Worldlist(),
    About(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Bgcolor, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.white.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: GNav(
                gap: 0,
                activeColor: Colors.white,
                color: Colors.white,
                iconSize: 23,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                // duration: Duration(milliseconds: 0),
                tabBackgroundColor: Color(0xFF2D3748),
                tabs: [
                  GButton(
                    icon: Icons.home,
                    text: 'Beranda',
                  ),
                  GButton(
                    icon: Icons.bubble_chart,
                    text: 'Dunia',
                  ),
                  GButton(
                    icon: Icons.info,
                    text: 'Tentang',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }
}