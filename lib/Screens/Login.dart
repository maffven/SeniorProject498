import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/ForgotPass.dart';
import 'package:flutter_application_1/Screens/Menu.dart';
import 'package:flutter_application_1/model/BinLocation.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';
import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/model/BinLocation.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  /*WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));*/
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

  @override
  void initState() {
    super.initState();
   // readD();
  }

  List<BinLocation> locList = [];
  List<Bin> bins = [];
  List<Bin> binsByCapacity = [];
  MunicipalityAdmin munObj = MunicipalityAdmin();
  List<MunicipalityAdmin> munList;
  List<Bin> bb;
  List<Driver> dd;
  List<District> disList;
  int phone;
  bool passCheck = false;
  bool phoneCheck = false;
  String password;
  int loggedInId;
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

  void showDialogError() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Warning"),
          content: Text("Password or phone are incorrect"),
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
              onPressed: () {
  Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ForgotPass()));
                     

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
              child: 
              FlatButton(
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
//check login info from the database driver's list
                    List<dynamic> drListd = await readAll(tableDriver);
                    dd = drListd.cast();
                    for (int i = 0; i < dd.length; i++) {
                  
                      if (dd[i].phone == phone) {
                        phoneCheck = true;
                        loggedInId = dd[i].driverID;
                      }

                      if (dd[i].password == password) {
                        passCheck = true;
                      }
                    }
                    if (phoneCheck != true && passCheck != true) {
                      showDialogError();
                    } else {
                      //naviagte to the menu screen
                      //store the loggedin id
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      await prefs.setInt('id', loggedInId);
                      await prefs.setInt('phone', phone);
                      print(prefs.getInt('phone'));
                      print(loggedInId);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Main()));
                     
                    }
                  }

                  BinLocation loc = BinLocation(
                      binID: 1,
                      coordinateX: 21.4893852,
                      coordinateY: 39.2462446);

                  //addObj(loc, tableBinLocation);
                  /*   List<dynamic> loca = await readAll(tableBinLocation);
                  locList = loca.cast();
                  for (int i = 0; i < locList.length; i++) {
                    print("${locList[i].coordinateX}");
                    //deleteObj(disList[i].districtID, tableDistrict);
                  }*/
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
                  /*  List<dynamic> d = await readAll(tableDistrict);
                  disList = d.cast();
                  for (int i = 0; i < disList.length; i++) {
                    print("${disList[i].districtID}");
                    //deleteObj(disList[i].districtID, tableDistrict);
                  }*/
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

  /*void _navigateToNextScreen(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Menu()));
  }*/
  Future<Driver> getLoginId(int phone) async {
    return await DatabaseHelper.instance.getLoginId(phone);
  }

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
