import 'package:marun/utils/getindo.dart';
import 'package:marun/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:marun/components/screensize.dart';

class Coronad extends StatelessWidget {
  final Corona corona;

  Coronad({this.corona});

  bodyWidget(BuildContext context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.5,
            width: MediaQuery.of(context).size.width - 20,
            left: 10.0,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 80),
                  Row(
                    children: <Widget>[
                      colorCard("Total Positif", corona.totalCases, context,
                          Color(0xFF2D3748)),
                      colorCard("Kasus Baru", corona.newCases, context,
                          Color(0xFF2D3748)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      colorCard("Total Meninggal", corona.totalDeaths, context,
                          Color(0xFF2D3748)),
                      colorCard("Baru Meninggal", corona.newDeaths, context,
                          Color(0xFF2D3748)),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      colorCard("Total Sembuh", corona.totalRecoverd, context,
                          Color(0xFF2D3748)),
                      colorCard("Penyembuhan", corona.activeCases, context,
                          Color(0xFF2D3748)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
                tag: corona.activeCases,
                child: Container(
                  height: 140.0,
                  width: 140.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assests/coronadetails.png"),
                  )),
                )),
          )
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Bgcolor,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(corona.country),
      ),
      body: bodyWidget(context),
    );
  }
}

Widget colorCard(
    String text, String fields, BuildContext context, Color color) {
  final _media = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.only(top: 10, right: 10),
    padding: EdgeInsets.all(25),
    height: screenAwareSize(100, context),
    width: _media.width / 2 - 25,
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.white,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "${fields.toString()}",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}
