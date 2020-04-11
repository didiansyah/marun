import 'package:flutter/material.dart';
import 'package:marun/components/colors.dart';

class TentangKami extends StatefulWidget {
  @override
  _TentangKamiState createState() => _TentangKamiState();
}

class _TentangKamiState extends State<TentangKami> {

  static var _txtCustomHead = TextStyle(
    color: Colors.white54,
    fontSize: 17.0,
    fontWeight: FontWeight.w600,
  );

  static var _txtSub = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
    fontWeight: FontWeight.w500,
  );

  static var _txtCustomSub = TextStyle(
    color: Colors.white,
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
  );

  static var _txtCustomSub2 = TextStyle(
    color: Colors.white,
    fontSize: 9.0,
    fontWeight: FontWeight.w300,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Tentang Aplikasi",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
              color: Colors.white,),
        ),
        centerTitle: true,
      ),
      backgroundColor: Bgcolor,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(
                  height: 0.5,
                  color: Colors.white12,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 10.0, left: 15.0),
                child: Row(
                  children: <Widget>[
                    Image(
                      image: AssetImage('assests/playstore.png'),
                      height: 50.0,
                      width: 50.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Marun App",
                            style: _txtSub.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "powered by Millennial Technology",
                            style: _txtCustomSub,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Divider(
                  height: 0.5,
                  color: Colors.white12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Marun App merupakan aplikasi yang dikembangkan untuk melihat situasi pandemi COVID-19 secara global, yang dikembangkan oleh Millennial Technology.",
                  style: _txtCustomSub,
                  textAlign: TextAlign.justify,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "Special thanks to nitishsai9 | Developed by Didi Khodriansyah",
                  style: _txtCustomSub2,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}