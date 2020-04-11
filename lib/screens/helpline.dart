import 'package:marun/components/colors.dart';
import 'package:flutter/material.dart';
import 'package:marun/components/screensize.dart';
import 'package:marun/components/wave_progress.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Call Center",
          style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 15.0,
              color: Colors.white,),
        ),
        centerTitle: true,
      ),
      backgroundColor: Bgcolor,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 10,
          top: screenAwareSize(20, context),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(height: 5),
            InkWell(
              child: new Text(
                "Pusat Bantuan COVID-19",
                style: TextStyle(
                  fontSize: 16,
                  inherit: true,
                  color: Colors.white,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(height: 20),
            vaweCard(
              context,
              "Gugus Tugas COVID-19",
              "119",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "BNPB",
              "021 2982 7444",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            SizedBox(height: 30),
            InkWell(
              child: new Text(
                "Pusat Bantuan Provinsi",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  inherit: true,
                  letterSpacing: 0.4,
                ),
              ),
            ),
            SizedBox(height: 10),
            vaweCard(
              context,
              "DKI Jakarta",
              "081 112 112 112",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Aceh",
              "0651 22421 ",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Sumatera Utara",
              "0821 6490 2482",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Sumatera Barat",
              "0751 890720",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Sumatera Selatan",
              "0813 6717 9000",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Jawa Barat",
              "0813 6717 9000",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Jawa Tengah",
              "024 3580 713",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Jawa Timur",
              "1500 117",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            vaweCard(
              context,
              "Bali",
              "0857 9224 0799",
              Colors.grey.shade100,
              Color(0xFF3CB371),
            ),
            
          ],
        ),
      ),
    );
  }

  Widget vaweCard(BuildContext context, String name, String fields,
      Color fillColor, Color bgColor) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        right: 20,
      ),
      padding: EdgeInsets.only(left: 15),
      height: screenAwareSize(80, context),
      decoration: BoxDecoration(
        color: Bgcolor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              WaveProgress(
                screenAwareSize(45, context),
                fillColor,
                bgColor,
                95,
              ),
              IconButton(
                icon: Icon(Icons.phone_in_talk),
                color: Colors.white,
                onPressed: (){}
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "$fields",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
