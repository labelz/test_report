import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_report/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String period = 'Year';
  String periodDisplay = 'Yearly Member 01-Jan-2020 to 31-Dec-2020';
  String dateDisplay = '2020';
  List<ItemModel> items = [];
  ResultModel resultModel;

  Future<void> loadJson(filename) async {
    final jsonString = await rootBundle.loadString('assets/data/$filename');
    final extractData = json.decode(jsonString);
    resultModel = ResultModel.fromJson(extractData['data']);
    // items = result.items;
    // print(result.items[0].customername);
  }

  void _showDialog() async {
    final v = await showDialog(
      context: context,
      builder: (ctx) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () => Navigator.of(ctx).pop("year"),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Year',
                        style: TextStyle(color: Colors.orange, fontSize: 20.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(ctx).pop("quater"),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Quater',
                        style: TextStyle(color: Colors.orange, fontSize: 20.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(ctx).pop("month"),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Month',
                        style: TextStyle(color: Colors.orange, fontSize: 20.0)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(ctx).pop("day"),
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.orange),
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Daily',
                        style: TextStyle(color: Colors.orange, fontSize: 20.0)),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
    print(v);

    switch (v) {
      case 'year':
        setState(() {
          period = 'Year';
          periodDisplay = 'Yearly Member 01-Jan-2020 to 31-Dec-2020';
          dateDisplay = '2020';
          loadJson('year.json');
        });
        break;
      case 'quater':
        setState(() {
          period = 'Quater';
          periodDisplay = 'Quater Member 01-Jul-2020 to 30-Sep-2020';
          dateDisplay = '3';
          loadJson('quater.json');
        });
        break;
      case 'month':
        setState(() {
          period = 'Month';
          periodDisplay = 'Month Member 01-Sep-2020 to 30-Sep-2020';
          dateDisplay = 'Sep 2020';
          loadJson('month.json');
        });
        break;
      case 'day':
        setState(() {
          period = 'Daily';
          periodDisplay = 'Daily Member 05 Sep 2020';
          dateDisplay = '05 Sep 2020';
          loadJson('daily.json');
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 60.0,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.black,
                    // width: MediaQuery.of(context).size.width,
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "SME",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Icon(
                                    Icons.person,
                                    size: 20,
                                  )),
                              SizedBox(
                                width: 8,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('ADMIN',
                                      style: TextStyle(
                                          color: Colors.orange,
                                          fontSize: 18.0)),
                                  Text('Head Quater',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0))
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 300,
                  height: double.infinity,
                  color: Colors.orange,
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("MENU",
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)),
                        Icon(
                          Icons.menu,
                          color: Colors.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.home),
                    Text('/ Business Inside /'),
                    Text('Report /'),
                    Text('Member /'),
                    Text(
                      'Member ',
                      style: TextStyle(color: Colors.orange, fontSize: 20),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.insert_chart,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.get_app,
                          color: Colors.white,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.orange.shade200,
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.print,
                          color: Colors.white,
                        ))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(periodDisplay,
                    style: TextStyle(color: Colors.orange, fontSize: 20)),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => _showDialog(),
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Colors.orange)),
                        child: Row(
                          children: [
                            Text("$period View",
                                style: TextStyle(
                                    color: Colors.orange, fontSize: 15)),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.orange,
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Container(
                      padding: EdgeInsets.all(7.5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5)),
                          border: Border.all()),
                      child: Text(dateDisplay, style: TextStyle(fontSize: 15)),
                    ),
                    Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomRight: Radius.circular(5)),
                          border: Border.all()),
                      child: Icon(
                        Icons.calendar_today,
                        size: 20,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Row(
            children: [
              Container(
                width: 400,
                height: 150,
                // padding: EdgeInsets.symmetric(vertical: 100),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Members :",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            resultModel != null
                                ? resultModel.total.toString()
                                : '-',
                            style: TextStyle(color: Colors.white, fontSize: 30))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Rev (THB) :",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            resultModel != null && resultModel.total > 0
                                ? resultModel.summaryTier[0].totalAmount
                                    .toString()
                                : "-",
                            style: TextStyle(color: Colors.white, fontSize: 30))
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                height: 150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Members :",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            resultModel != null
                                ? resultModel.total.toString()
                                : '-',
                            style: TextStyle(color: Colors.white, fontSize: 30))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total Rev (THB) :",
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                        Text(
                            resultModel != null && resultModel.total > 0
                                ? resultModel.summaryTier[0].totalAmount
                                    .toString()
                                : "-",
                            style: TextStyle(color: Colors.white, fontSize: 30))
                      ],
                    )
                  ],
                ),
              ))
            ],
          ),
          Table(
            border: TableBorder.all(color: Color(0xFFCCCCCC)),
            columnWidths: {
              0: FractionColumnWidth(.15),
              1: FractionColumnWidth(.15),
              2: FractionColumnWidth(.1),
              3: FractionColumnWidth(.15),
              4: FractionColumnWidth(.15),
              5: FractionColumnWidth(.15),
              6: FractionColumnWidth(.15),
            },
            children: [
              TableRow(children: [
                buildHeader("Name"),
                buildHeader("Phone"),
                buildHeader("Tier"),
                buildHeader("LTV"),
                buildHeader("Total Trans."),
                buildHeader("Total Point"),
                buildHeader("Remaining Point"),
              ]),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Table(
                columnWidths: {
                  0: FractionColumnWidth(.15),
                  1: FractionColumnWidth(.15),
                  2: FractionColumnWidth(.1),
                  3: FractionColumnWidth(.15),
                  4: FractionColumnWidth(.15),
                  5: FractionColumnWidth(.15),
                  6: FractionColumnWidth(.15),
                },
                children: resultModel != null && resultModel.items.length > 0
                    ? List.generate(resultModel.items.length, (index) {
                        return TableRow(
                            decoration: BoxDecoration(
                                color: index % 2 == 0
                                    ? Colors.grey.shade200
                                    : Colors.white),
                            children: [
                              buildData(resultModel.items[index].customername),
                              buildData(resultModel.items[index].customerphone),
                              buildData(resultModel.items[index].customertier),
                              buildData(resultModel.items[index].totalreward
                                  .toString()),
                              buildData(resultModel
                                  .items[index].totaltransaction
                                  .toString()),
                              buildData(resultModel.items[index].totalamount
                                  .toString()),
                              buildData(resultModel.items[index].remainingpoint
                                  .toString()),
                            ]);
                      })
                    : [],
                border: TableBorder.all(color: Color(0xFFCCCCCC)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildHeader(value) {
    return Container(
      color: Colors.grey,
      alignment: Alignment.center,
      padding: EdgeInsets.all(10),
      child: Text(value,
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
    );
  }

  Container buildData(value) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
      child:
          Text(value, style: TextStyle(fontSize: 20, color: Color(0xFF30495F))),
    );
  }
}
