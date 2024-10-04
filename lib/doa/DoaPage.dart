// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'package:app_doa/doa/DetailDoa.dart';
import 'package:flutter/material.dart';
import 'package:app_doa/doa/ModelDoa.dart';
import 'package:app_doa/tema.dart';
import 'package:app_doa/pages/beranda_page.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'ServiceDoa.dart';

class DoaPage extends StatefulWidget {
  DoaPage() : super();
  final String title = "DOA SEHARI-HARI";
  @override
  DoaPageState createState() => DoaPageState();
}

class DoaPageState extends State<DoaPage> {
  List<DoaDetail> doas = [];
  List<DoaDetail> filteredDoa = [];

  @override
  void initState() {
    super.initState();
    ServicesDoa.getDoa().then((doasFromServer) {
      setState(() {
        doas = doasFromServer!;
        filteredDoa = doas;
      });
    });
  }

  void testPdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) {
            return pw.Center(
              child: pw.Text("Test List data", textAlign: pw.TextAlign.center),
            );
          }),
    );

    final output = await getTemporaryDirectory();
    final file = File("${output.path}/Daftar Peserta.pdf");

    await file.writeAsBytes(await pdf.save());

    await OpenFile.open(file.path);
  }

  DateTime timeBackPressed = DateTime.now();
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
          TextField(
            readOnly: false,
            style: TextStyle(fontSize: 15),
            decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search, color: orange),
                contentPadding: const EdgeInsets.symmetric(vertical: 10.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: new BorderSide(color: Colors.white),
                ),
                fillColor: Color(0xfff3f3f4),
                filled: true),
            onChanged: (string) {
              setState(() {
                filteredDoa = doas
                    .where((u) =>
                        (u.doa.toLowerCase().contains(string.toLowerCase())))
                    .toList();
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(10.0),
              itemCount: filteredDoa.length,
              itemBuilder: (context, i) {
                return Card(
                  shadowColor: Colors.blue,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () =>
                          Navigator.of(context).push(new MaterialPageRoute(
                        builder: (BuildContext context) => new DetailDataDoa(
                          list: filteredDoa,
                          index: i,
                        ),
                      )),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              filteredDoa[i].doa,
                              textAlign: TextAlign.center,
                              style: oswaldTextStyle.copyWith(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: blackColor,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              filteredDoa[i].ayat,
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
                          Text(
                            filteredDoa[i].artinya,
                            style: popinsTextStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
