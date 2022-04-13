import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/Complaints.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_application_1/Screens/complaintResult.dart';

class EditComplaints extends StatefulWidget {
  final Widget child;
  final Complaints complaint;
  EditComplaints({Key key, this.child, this.complaint}) : super(key: key);

  _EditComplaints createState() => _EditComplaints();
}

class _EditComplaints extends State<EditComplaints> {
  List<District> disList;
  //final Complaints complaint;  
  List<Complaints> complaints = [];
  List<Driver> dd;
  final dbHelper = DatabaseHelper.instance;
  bool status;
  
  //function written by flutter
  final TextEditingController binId = new TextEditingController();
  var selectedBinId;
  var selectedDist;
  final TextEditingController district = new TextEditingController();
  final TextEditingController summary = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  //from database
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("View Complaint"),
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
                          child: new Text("Bin Id:" 
                      )),
                     
                    ],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 24, bottom: 55),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                          child: new Text("Driver Id: "
                      )),
                   
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
                      child: new Text("Subject: "
                      )),
                ),
                Container(
                    height: 100,
                    width: 350,
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.greenAccent,
                        primaryColorDark: Colors.green,
                      ),
                          child: new Text("Description: "
                      )),
                ),
                  Container(
                    height: 100,
                    width: 350,
                    child: new Theme(
                      data: new ThemeData(
                        primaryColor: Colors.greenAccent,
                        primaryColorDark: Colors.green,
                      ),
                          child: new Text("Date:"
                      )),
                ),
                
                   Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ), //SizedBox
                Text(
                  'Solved? ',
                  style: TextStyle(fontSize: 15.0),
                ), //Text
                Checkbox(
                  checkColor: Colors.white,
                  focusColor: Color(0xff28CC9E),
                  value: status,
                  onChanged: (bool value) {
                    setState(() {
                      status = value;
                    });
                  },
                ),
              ], //<Widget>[]
            ), //Row
                        Container(
                  height: 50,
                  width: 250,
                  margin: const EdgeInsets.only(top: 20.0),
                  decoration: BoxDecoration(
                      color: Color(0xff28CC9E),
                      borderRadius: BorderRadius.circular(20)),
                  child: FlatButton(
                    onPressed: () async {
              
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      print(prefs.getInt('id'));
                   
                      Complaints c = Complaints(
                          binID: int.parse(selectedBinId),
                          complaintMessage: description.text,
                          subject: summary.text,
                          status: status,
                          driverID: prefs.getInt('id'),
                          districtName: selectedDist,
                          );
                    //  addObj(c, tableComplaints);
                    /*  Complaints cc = await readObj(1, tableComplaints);
                      print(cc.complaintID);*/

                      List<dynamic> compList = await readAll(tableComplaints);
                      complaints = compList.cast();
                      for (int i = 0; i < complaints.length; i++) {
                        print("${complaints[i].binID}");
                        print("${complaints[i].complaintID}");
                        print("${complaints[i].districtName}");
                        print("${complaints[i].subject}");
                      }

                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompResult()));*/
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
    //print("object inserted");
  }

  Future addCol(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.alterTable(tableName, obj);
    print("column inserted");
  }

  Future delCol(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.alterTable1(tableName, obj);
    print("column deleted");
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
    // print("mun object: ${munList[0].firatName}");
  }

  Future<dynamic> readObj(int id, String tableName) async {
    return await DatabaseHelper.instance.generalRead(tableName, id);
    //print("mun object: ${munObj.firatName}");
  }
  Future updateObj(int id, dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalUpdate(tableName, id, obj);
  }
}
