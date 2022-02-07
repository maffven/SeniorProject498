import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';
import 'package:flutter_application_1/screens/first.dart';
import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp()); //function written by flutter
}

/*class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp( title: 'Welcome to Flutter',
   home: Text('Manar Hennawi'),);
   //create this App
  }

}*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginDemo(),
    );
  }
}

class LoginDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

//Rawan work

class _LoginDemoState extends State<LoginDemo> {
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initDatabase();
    return _database;
  }

  final dbHelper = DatabaseHelper.instance;
/*@override
void initState(){
super.initState();

 DatabaseHelper().database.then((value) {
  print('sqflite db created successfully');
});*/

  List<Bin> bins = [];
  List<Bin> binsByCapacity = [];
  MunicipalityAdmin munObj = MunicipalityAdmin();
  List<MunicipalityAdmin> munList;
  //Take input from user or textview
  TextEditingController nameController = TextEditingController();
  TextEditingController milesController = TextEditingController();

//Login pop up
  /*final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 150, bottom: 0),
              child: Text(
                'Hello!',
                style: TextStyle(color: Colors.black, fontSize: 45),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 0, bottom: 60),
              child: Text(
                'Login to your account',
                style: TextStyle(fontSize: 16),
              ),
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Phone number',
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: milesController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText:
                        'For new users, please enter last 6 digits\n of your registered mobile'),
              ),
            ),
            FlatButton(
              onPressed: () {
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                    fontSize: 15, decoration: TextDecoration.underline),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Color(0xff28CC9E),
                  borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                onPressed: () {
                  double name = double.parse(nameController.text);
                  int miles = int.parse(milesController.text);

                  //implement database helper
                  //   Bin(name,miles,7);
                  // _insert(name, miles);
                  //_queryAll();

                  //create object
                  MunicipalityAdmin mun = MunicipalityAdmin(
                      municpalityID: 123,
                      firatName: "noha",
                      lastName: "Alghamdi",
                      phone: 0591450563,
                      email: "roro1999@gmail.com",
                      password: "1851420");
                  //inserting row inside muncipality table
                  //addObj(mun, tableMunicipalityAdmin);

                  //ensure the object exists
                  //readObj(mun.municpalityID, tableMunicipalityAdmin);

                  readAll(tableMunicipalityAdmin);
                  updateObj(mun.municpalityID, mun, tableMunicipalityAdmin);
                  readAll(tableMunicipalityAdmin);
                  deleteObj(mun.municpalityID, tableMunicipalityAdmin);
                  readAll(tableMunicipalityAdmin);
                  addObj(mun, tableMunicipalityAdmin);
                  //   initDatabase();
                },
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }

  // this opens the database (and creates it if it doesn't exist)
  initDatabase() async {
    DatabaseHelper dh = new DatabaseHelper();
    dh.createDB(_database, 1);
  }

  /* void _insert(name, miles) async {
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnId: miles,
      DatabaseHelper.columnCapacity: name,
      DatabaseHelper.columnDistrict: 9
    };
    Bin car = Bin.fromMap(row);
   
    // final id = await car.toMap();
    //_showMessageInScaffold('inserted row id: $id');
  }*/

  /*void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    bins.clear();
    List<Map<String, dynamic>> queryRows =
        await DatabaseHelper.instance.queryAllRows();
    allRows.forEach((row) => bins.add(Bin.fromMap(row)));
    print(queryRows);
    //_showMessageInScaffold('Query done.');
    setState(() {});
  }*/

  /*void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    binsByCapacity.clear();
    allRows.forEach((row) => binsByCapacity.add(Bin.fromMap(row)));
  }*/

  /* void _update(id, name, miles) async {
    // row to update
    Bin car = Bin(id, name, miles);
    final rowsAffected = await dbHelper.update(car);
    //_showMessageInScaffold('updated $rowsAffected row(s)');
  }*/

  /*void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    // _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }*/

  Future addObj(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalCreate(obj, tableName);
    print("municipality inserted");
  }

  //generalUpdate(String tablename, int id, dynamic obj)
  Future updateObj(int id, dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalUpdate(tableName, id, obj);
  }

  //read objects
  //int id, String tableName, dynamic classFields, dynamic className
  Future readObj(int id, String tableName) async {
    this.munObj = await DatabaseHelper.instance.generalRead(tableName, id);
    print("mun object: ${munObj.firatName}");
  }

  Future readAll(String tableName) async {
    //We have to define list here as dynamci *******
    List<dynamic> munList =
        await DatabaseHelper.instance.generalReadAll(tableName);
    print("mun object: ${munList[0].firatName}");
  }

  //Delete a row
  //gneralDelete(int id, String tablename)
  Future deleteObj(int id, String tableName) async {
    await DatabaseHelper.instance.gneralDelete(id, tableName);
  }
}
