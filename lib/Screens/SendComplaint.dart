import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/Complaints.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/model/Driver.dart';

//import 'package:cloud_firestore/cloud_firestore.dart';
void main() async {
  runApp(SendComplaint());
}

class SendComplaint extends StatelessWidget {
  List<District> disList;
  List<Driver> dd;
  List<DropdownMenuItem<String>> get dropdownItems async {

 List<dynamic> dis = await readAll(tableDistrict);
    disList = dis.cast();
    for (int i = 0; i < disList.length; i++) {
      items = disList[i].name;
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("District"),value: items),

  ];
    }
  return menuItems;
}
  var items;
  Future<List<String>> read() async {
    List<dynamic> dis = await readAll(tableDistrict);
    disList = dis.cast();
    for (int i = 0; i < disList.length; i++) {
      items = disList[i].name;
      print(disList[i].name);
    }
    return items;
  }

  final dbHelper = DatabaseHelper.instance;

  //function written by flutter
  final TextEditingController binId = new TextEditingController();
  final TextEditingController district = new TextEditingController();
  final TextEditingController summary = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  //from database
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drop List Example',
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Send Complaint"),
        ),
        body: new Center(
          child: new Container(
            child: new Column(
              children: [
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 57, bottom: 24),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new TextField(
                        controller: binId,
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.greenAccent)),
                            labelText: 'Bin Id',
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )),
                      new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          binId.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 24, bottom: 55),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new TextField(
                              decoration: new InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(
                                          color: Colors.greenAccent)),
                                  labelText: 'District',
                                  suffixStyle:
                                      const TextStyle(color: Colors.green)),
                              controller: district)),
                      new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          district.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items
                              .map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(
                                child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                    height: 100,
                    width: 350,
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.greenAccent,
                        primaryColorDark: Colors.green,
                      ),
                      child: new TextField(
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.greenAccent)),
                            labelText: 'Summary',
                            suffixStyle: const TextStyle(color: Colors.green)),
                      ),
                    )),
                Container(
                    height: 150,
                    width: 350,
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.greenAccent,
                        primaryColorDark: Colors.green,
                      ),
                      child: new TextField(
                        keyboardType: TextInputType.multiline,
                        minLines: 1, //Normal textInputField will be displayed
                        maxLines: 10, //
                        decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.greenAccent)),
                            labelText: 'Description',
                            suffixStyle: const TextStyle(color: Colors.green)),
                      ),
                    )),
                Container(
                  height: 50,
                  width: 250,
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xff28CC9E),
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
                      //  print('hi');

                      List<dynamic> d = await readAll(tableDriver);
                      dd = d.cast();
                      for (int i = 0; i < dd.length; i++) {
                        print("${dd[i].driverID}");
                      }
                      DateTime now = new DateTime.now();
                      DateTime date =
                          new DateTime(now.year, now.month, now.day);
//added the district name column to the complaint table
//addCol("DistrictName", tableComplaints);

                      Complaints c = Complaints(
                          binID: int.parse(binId.text),
                          complaintMessage: description.text,
                          subject: summary.text,
                          status: false,
                          driverID: 2,
                          date: date);
                      /* BinLevel bin = BinLevel(
                          binID: 123,
                          half_full: true,
                          full: false,
                          empty: false,
                          level: 1);
                      addObj(bin, tableBinLevel);*/
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future addObj(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalCreate(obj, tableName);
    print("object inserted");
  }

  Future addCol(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.alterTable(tableName, obj);
    print("object inserted");
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
    // print("mun object: ${munList[0].firatName}");
  }
}
