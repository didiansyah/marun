import 'dart:convert';
import 'package:marun/components/colors.dart';
import 'package:marun/components/screensize.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:marun/utils/getindo.dart';
import 'package:marun/screens/countrydetail.dart';
import 'package:line_icons/line_icons.dart';

 class Worldlist extends StatefulWidget {
   @override
   _WorldlistState createState() => _WorldlistState();
 }
 
 class _WorldlistState extends State<Worldlist> {
  List<Corona> test, sample, _dat1;

  var jsondata;
  Details d, temp, a;
  String s = "https://api-corona.herokuapp.com/";
  Future<void> getData() async {
    final response = await http.get(s);
    jsondata = json.decode(response.body);
    d = Details.fromJson(jsondata);
    test = d.corona;
    setState(() {
      sample = test;
      _dat1 = sample;
    });
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
      //backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
      //backgroundColor:Color(0xFFFF3B4254),
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
              child: Column(
                children: <Widget>[
                  Container(
                    width: screenAwareSize(320, context),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: screenAwareSize(40, context),
                    decoration: BoxDecoration(
                        color: Color(0xFF2D3748),
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0))),
                    child: TextField(
                      style: new TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(top: 6.0),
                        border: InputBorder.none,
                        hintText: 'Cari disini...',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontSize: 12.0),
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                      onChanged: (text) {
                        setState(() {
                          _dat1 = sample
                              .where((r) => (r.country
                                  .toLowerCase()
                                  .contains(text.trim().toLowerCase())))
                              .toList();
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      children: _dat1
                          .map((pointer) => Padding(
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  padding: EdgeInsets.only(left: 7),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Coronad(
                                                    corona: pointer,
                                                  )));
                                    },
                                    child: Card(
                                      color: Bgcolor,
                                      margin: new EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 8.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              "assests/coronadetails.png"),
                                        ),
                                        title: Text(
                                          pointer.country,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                        subtitle: Text(
                                          "Total Positif : " +
                                              pointer.totalCases.toString(),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        trailing: IconButton(
                                          icon: Icon(
                                            Icons.keyboard_arrow_right,
                                            color: Colors.white,
                                          ),
                                          iconSize: 31,
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Coronad(
                                                          corona: pointer,
                                                        )));
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ))
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
