import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:marun/components/screensize.dart';
import 'package:marun/components/wave_progress.dart';
import 'package:http/http.dart' as http;
import 'package:marun/utils/getdata.dart';
import 'package:marun/components/colors.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var jsondata;
  var cases;
  var now = new DateTime.now();
  CoronaDetails d;
  String s = "https://api-corona.herokuapp.com/total";
  Future<void> getData() async {
    final response = await http.get(s);
    jsondata = json.decode(response.body);
    d = CoronaDetails.fromJson(jsondata);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Bgcolor,
      body: d == null
          ? Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                valueColor: new AlwaysStoppedAnimation<Color>(Fgcolor),
              ),
            )
          : RefreshIndicator(
              onRefresh: getData,
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: d.main
                    .map(
                      (pointer) => Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          top: 0,
                        ),
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 0,
                            ),
                            Center(
                              child: Text(
                                "COVID-19 Global",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  inherit: true,
                                  color: Colors.white,
                                  letterSpacing: 0.4,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: <Widget>[
                                colorCard("Total Positif", pointer.coronaCases,
                                    context, Color(0xFF2D3748)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                colorCard("Total Meninggal", pointer.coronaDeaths,
                                    context, Color(0xFF2D3748)),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                colorCard("Total Sembuh", pointer.recoverd,
                                    context, Color(0xFF2D3748))
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   "Kasus Aktif",
                            //   textAlign: TextAlign.center,
                            //   style: TextStyle(
                            //     color: Colors.white,
                            //     fontSize: 24,
                            //     fontWeight: FontWeight.bold,
                            //     inherit: true,
                            //     letterSpacing: 0.4,
                            //   ),
                            // ),
                            SizedBox(
                              height: 10,
                            ),
                            vaweCard(
                                context,
                                "Pasien terinfeksi saat ini",
                                pointer.coronaCurrent,
                                pointer.coronaCurrent,
                                Colors.greenAccent,
                                Color(0xFF3CB371)),
                            vaweCard(
                              context,
                              "Dalam kondisi ringan",
                              pointer.coronaMild,
                              pointer.coronaCurrent,
                              Colors.greenAccent,
                              Color(0xFF3CB371),
                            ),
                            vaweCard(
                                context,
                                "Serius / Kritis",
                                pointer.coronaCritical,
                                pointer.coronaCurrent,
                                Colors.grey.shade100,
                                Color(0xFF3CB371)),
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
    );
  }

  Widget vaweCard(BuildContext context, String name, String f, String total,
      Color fillColor, Color bgColor) {
    String a = f.replaceAll(RegExp(','), '');
    String b = total.replaceAll(RegExp(','), '');
    double c = (((double.parse(a).ceil() / double.parse(b).ceil())) * 100);
    String x = c.toStringAsFixed(2);

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
                67,
              ),
              Text(
                "${x.toString()}",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
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
                style:
                    TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "${f.toString()}",
                style: TextStyle(
                  fontSize: 22,
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

  Widget colorCard(String text, String f, BuildContext context, Color color) {
    final _media = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 18, right: 12),
      padding: EdgeInsets.all(35),
      height: screenAwareSize(140, context),
      width: _media.width / 1 - 40,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            text,
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            "${f.toString()}",
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}