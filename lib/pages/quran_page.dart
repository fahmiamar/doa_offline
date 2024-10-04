// ignore_for_file: unnecessary_new, prefer_const_constructors, non_constant_identifier_names, library_prefixes, unnecessary_null_comparison, unused_field

import 'dart:convert';

//import 'package:app_doa/quran/detail_quran.dart';
import 'package:flutter/material.dart';
import 'package:app_doa/doa_model.dart';
import 'package:app_doa/tema.dart';

import 'package:app_doa/pages/beranda_page.dart';
import 'package:flutter/services.dart' as rootBundle;

class QuranPage extends StatefulWidget {
  const QuranPage({super.key});
  final String title = "DOA DARI ALQUR'AN";
  @override
  QuranPageState createState() => QuranPageState();
}

class QuranPageState extends State<QuranPage> {
  TextEditingController searchController = TextEditingController();
  String search = '';

  Future<List<Doa>> ReadJsonData() async {
    final jsondata =
        await rootBundle.rootBundle.loadString('assets/data/quran.json');
    final list = json.decode(jsondata) as List<dynamic>;
    return list.map((e) => Doa.fromJson(e)).toList();
  }

  late Future _future;
  @override
  void initState() {
    super.initState();
    _future = ReadJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        title: Text(
          widget.title,
          style: popinsTextStyle.copyWith(
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () =>
                Navigator.of(context).pushReplacement(new MaterialPageRoute(
              builder: (BuildContext context) => new BerandaPage(),
            )),
            child: Text(
              "Back",
              style: popinsTextStyle.copyWith(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          TextFormField(
            controller: searchController,
            decoration: const InputDecoration(
              hintText: 'Cari judul doa',
              border: OutlineInputBorder(),
            ),
            onChanged: (String? value) {
              print(value);
              setState(() {
                search = value.toString();
              });
            },
          ),
          Expanded(
            child: Container(
              child: FutureBuilder(
                future: _future,
                builder: (context, data) {
                  if (data.hasError) {
                    return Center(child: Text("${data.error}"));
                  } else if (data.hasData) {
                    var items = data.data as List<Doa>;
                    return ListView.builder(
                        itemCount: items == null ? 0 : items.length,
                        itemBuilder: (context, index) {
                          late String postion = items[index].judul.toString();
                          if (searchController.text.isEmpty) {
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Card(
                                      shadowColor: Colors.blue,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                items[index].judul.toString(),
                                                textAlign: TextAlign.center,
                                                style: oswaldTextStyle.copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                items[index].arab.toString(),
                                                textAlign: TextAlign.right,
                                                style: amiriTextStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  height: 2,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                items[index].indo.toString(),
                                                style: popinsTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            );
                          } else if (postion
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())) {
                            return Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Container(
                                    padding: EdgeInsets.only(bottom: 5),
                                    child: Card(
                                      shadowColor: Colors.blue,
                                      elevation: 10,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              alignment: Alignment.center,
                                              child: Text(
                                                postion.toString(),
                                                textAlign: TextAlign.center,
                                                style: oswaldTextStyle.copyWith(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold,
                                                  color: blackColor,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                items[index].arab.toString(),
                                                textAlign: TextAlign.right,
                                                style: amiriTextStyle.copyWith(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  height: 2,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                items[index].indo.toString(),
                                                style: popinsTextStyle.copyWith(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontStyle: FontStyle.italic,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ))
                                ],
                              ),
                            );
                          } else {
                            return Container();
                          }
                        });
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
