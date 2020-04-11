import 'package:flutter/material.dart';
import 'package:marun/components/screensize.dart';

import 'package:marun/screens/tentangkami.dart';
import 'package:marun/screens/helpline.dart';
import 'package:marun/components/colors.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 100, 25, 25),
          child: Center(
            child: Column(
              children: <Widget>[
                Center(
                  child: Image(
                    alignment: Alignment.centerRight,
                    image: AssetImage("assests/corona.png"),
                    height: screenAwareSize(220, context),
                    width: screenAwareSize(220, context),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0),
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Contact()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  minWidth: double.infinity,
                  height: 60,
                  child: Text(
                    'Call center'.toUpperCase(),
                  ),
                  color: Fgcolor,
                  textColor: Colors.white,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TentangKami()),
                    );
                  },
                  shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  minWidth: double.infinity,
                  height: 60,
                  child: Text(
                    'Tentang Aplikasi'.toUpperCase(),
                  ),
                  color: Fgcolor,
                  textColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}