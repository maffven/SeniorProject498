import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';
import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));
  runApp(Login()); //function written by flutter
}

//if login is successfull go to Menu.dart

class Login extends StatelessWidget {
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


  //Create a database reference
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  void initState(){
    super.initState();
    readD();
  }
  List<Bin> bins = [];
  List<Bin> binsByCapacity = [];
  MunicipalityAdmin munObj = MunicipalityAdmin();
  List<MunicipalityAdmin> munList;
  List<Bin> bb;
  List<Driver> dd;
  List<District> disList;
  int phone;
  String password;
  //Take input from user or textview
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void showDialog() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Warning"),
          content: Text("please enter all the fields"),
          actions: [
            CupertinoDialogAction(
              child: Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }

     void readD(){
    //this means the data is up to date
      databaseReference.onValue.listen((event){
     final data = new Map<String, dynamic>.from(event.snapshot.value);
       print(data);
   
     });
  }


  
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
                  controller: phoneController,
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
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText:
                        'For new users, please enter last 6 digits\n of your registered mobile'),
              ),
            ),
            FlatButton(
              onPressed: () {},
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
                onPressed: () async {
                  //create object
                  /* District di =
                      District(name: "Alnaseem", numberOfBins: 15, driverID: 5);
                  District di2 =
                      District(name: "AlJamea", numberOfBins: 12, driverID: 1);
                  District di3 = District(
                      name: "Alfaisaliah", numberOfBins: 13, driverID: 2);
                  District di4 =
                      District(name: "Alwaha", numberOfBins: 11, driverID: 3);
                  District di5 = District(
                      name: "Alsulaimania", numberOfBins: 15, driverID: 4);*/

                  Bin bin = Bin(binID: 123, capacity: 10, districtId: 1);
                  Bin bin1 = Bin(binID: 144, capacity: 25, districtId: 2);
                  Bin bin2 = Bin(binID: 166, capacity: 40, districtId: 3);

                  /* addObj(mun, tableMunicipalityAdmin);
                  addObj(mn, tableMunicipalityAdmin);
                  addObj(mu, tableMunicipalityAdmin);
                  addObj(dr, tableDriver);
                  addObj(dr2, tableDriver);
                  addObj(dr3, tableDriver);
                  addObj(dr4, tableDriver);
                  addObj(dr5, tableDriver);*/
                  /*addObj(di, tableDistrict);
                  addObj(di2, tableDistrict);
                  addObj(di3, tableDistrict);
                  addObj(di4, tableDistrict);
                  addObj(di5, tableDistrict);*/
                  /*addObj(bin, "bin_table");
                  addObj(bin1, "bin_table");
                  addObj(bin2, "bin_table");*/

                  //frist, check if text fields are not empty
                   if (phoneController.text == "" &&
                      passwordController.text == "") {
                       showDialog();
                      
                  } else {
                    //get text field's input from the user
                    phone = int.parse(phoneController.text);
                    password = passwordController.text;
                   //check login info from Database
                   List<dynamic> d = await readObj(phone,tableDriver);
                   dd = d.cast();
                    
                  }
                  

                  /*  BinLevel binL = BinLevel(
                    level: int.parse(milesController.text),
                    , "", "", "", "");

                  validate(BuildContext ctx) async {
                    if (phone != "" && password != "") {
                      DatabaseHelper dh = DatabaseHelper();

                      Driver test = await verifyLogin(password, phone);
                      if (test == null) {
                        print("null");
                      } else {
                        print(test);
                      }
                    }
                  }
                  //call the query to check if the user exists
                  // var res= verifyLogin(password, phone);

                  //create a login
                  Driver driver = Driver(
                      driverID: 3,
                      municpalityID: 123,
                      firstName: "manar",
                      lastName: "hennawi",
                      password: "11224456",
                      email: " manarhennawi00@gmail.com",
                      phone: 0508672505,
                      workTime: "5");

                  District di =
                      District(name: "Alnaseem", numberOfBins: 15, driverID: 5);
                  District di2 =
                      District(name: "AlJamea", numberOfBins: 12, driverID: 1);
                  District di3 = District(
                      name: "Alfaisaliah", numberOfBins: 13, driverID: 2);
                  District di4 =
                      District(name: "Alwaha", numberOfBins: 11, driverID: 3);
                  District di5 = District(
                      name: "Alsulaimania", numberOfBins: 15, driverID: 4);
//print(tableDriver);
//addObj(driver, tableDriver);
//Driver driver1 = await readObj(3, tableDriver);
//print(driver1.firstName);
//await db.execute("DROP TABLE IF EXISTS tableName");

                  //Bin bin = Bin(binID: 123, capacity: 15, districtId: 49);
                  //  addObj(bin, tableBin);

                  Bin bin = Bin(binID: 123, capacity: 10, districtId: 1);
                  Bin bin1 = Bin(binID: 144, capacity: 25, districtId: 2);
                  Bin bin2 = Bin(binID: 166, capacity: 40, districtId: 3);

                  //     addObj(bin, tableBin);

                  // Bin bin = Bin(binID: 123, capacity: 15, districtId: 49);
                  //addObj(bin, "bin_table");

                  //  Bin bintry = await readObj(bin.binID, "bin_table");
                  //  print("bin object: ${bintry.capacity}");
                  //implement database helper
                  //   Bin(name,miles,7);
                  // _insert(name, miles);
                  // _queryAll();
*/
                  List<dynamic> d = await readAll(tableDistrict);
                  disList = d.cast();
                  for (int i = 0; i < disList.length; i++) {
                    print("${disList[i].districtID}");
                    //deleteObj(disList[i].districtID, tableDistrict);
                  }
                  //addObj(mun, tableMunicipalityAdmin);

                  //deleteObj(1243, tableMunicipalityAdmin);
                  //MunicipalityAdmin obj = await readAll( tableMunicipalityAdmin);
                  //print("${obj.firstName} HIII");

                  /*District di =
                      District(name: "Alnaseem", numberOfBins: 15, driverID: 5);
                  District di2 =
                      District(name: "AlJamea", numberOfBins: 12, driverID: 1);
                  District di3 = District(
                      name: "Alfaisaliah", numberOfBins: 13, driverID: 2);
                  District di4 =
                      District(name: "Alwaha", numberOfBins: 11, driverID: 3);
                  District di5 = District(
                      name: "Alsulaimania", numberOfBins: 15, driverID: 4);
                  addObj(di, tableDistrict);
                  addObj(di2, tableDistrict);
                  addObj(di3, tableDistrict);
                  addObj(di4, tableDistrict);
                  addObj(di5, tableDistrict);*/

                  //ensure the object exists
                  /*  munObj =
                      await readObj(mun.municpalityID, tableMunicipalityAdmin);
                  print("mun object: ${munObj.lastName}");
                  updateObj(mun.municpalityID, mun, tableMunicipalityAdmin);*/
                  /* List<dynamic> drListd = await readAll(tableDriver);
                  dd = drListd.cast();
                  for (int i = 0; i < dd.length; i++) {
                    print("${dd[i].driverID}");
                  }
    List<dynamic> distList = await readAll(tableDistrict);
                  disList = distList.cast();
                  for (int i = 0; i < disList.length; i++) {
                    print("${disList[i].districtID}");
                  }*/

                  // print("mun object list: ${munList[0].firatName}");
                  //  deleteObj(mun.municpalityID, tableMunicipalityAdmin);*/

                  // List<dynamic> b = await readAll("bin_table");
                  // List<dynamic> b = await readAll("bin_table");

                  /* List<dynamic> b = await readAll("bin_table");

                  bb = b.cast();
                  for (int i = 0; i < bb.length; i++) {
                    print("from list:  ${bb[i].capacity}");
                  }
                 */
                  //close();
                  // addObj(mun, tableMunicipalityAdmin);
                  //initDatabase();*/
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
  /*initDatabase() async {
    DatabaseHelper dh = new DatabaseHelper();
    //dh.deleteTable(_database);
   dh.createDB(_database, 2);
  }*/

  //Future deleteTAll() async {
  //  await DatabaseHelper.instance.deleteTable(_database);
  //  print("tables deleted");
  //}
  //Future createTAll() async {
  //  await DatabaseHelper.instance.createTable(_database);
  //  print("tables created");
  //}

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
  /*Future deleteTAll() async {
    await DatabaseHelper.instance.deleteTable(_database);
    print("tables deleted");
  }*/

  Future addObj(dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalCreate(obj, tableName);
    print("object inserted");
  }

  //generalUpdate(String tablename, int id, dynamic obj)
  Future updateObj(int id, dynamic obj, String tableName) async {
    await DatabaseHelper.instance.generalUpdate(tableName, id, obj);
  }

  //read objects
  //int id, String tableName, dynamic classFields, dynamic className
  Future<dynamic> readObj(int id, String tableName) async {
    return await DatabaseHelper.instance.generalRead(tableName, id);
    //print("mun object: ${munObj.firatName}");
  }

  Future<dynamic> verifyLogin(String password, int phone) async {
    return await DatabaseHelper.instance.checkLogin(password, phone);
    //print("mun object: ${munObj.firatName}");
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
    // print("mun object: ${munList[0].firatName}");
  }

  //Delete a row
  //gneralDelete(int id, String tablename)
  Future deleteObj(int id, String tableName) async {
    print("$id rawan");
    await DatabaseHelper.instance.gneralDelete(id, tableName);
    print("Object is deleted");
  }

  //Close database  Method
  Future close() async {
    final db = await DatabaseHelper.instance.database;
    db.close();
  }
}
