import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(Complaint());
}

class Complaint extends StatelessWidget {
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initDatabase();
    return _database;
  }

  final dbHelper = DatabaseHelper.instance;

  //function written by flutter
  final TextEditingController binId = new TextEditingController();
  final TextEditingController district = new TextEditingController();
  final TextEditingController summary = new TextEditingController();
  final TextEditingController description = new TextEditingController();
  var items = ['1', '2', '3', '4']; //from database
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
                      await createBinLevel();

                      BinLevel bin = BinLevel(
                          binID: 123,
                          half_full: true,
                          full: false,
                          empty: false,
                          level: 1);
                      addObj(bin, tableBinLevel);
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

// this opens the database (and creates it if it doesn't exist)
  initDatabase() async {
    DatabaseHelper dh = new DatabaseHelper();
    dh.createDB(_database, 1);
  }

  Future addObj(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalCreate(obj, tableName);
    print("object inserted");
  }

  Future createBinLevel() async {
    DatabaseHelper dh = new DatabaseHelper();
    dh.createTableBin();
    //print("bin level table created");
  }
}
