import 'package:flutter/material.dart';
import '../db/DatabaseHelper.dart';
import '../model/District.dart';
import '../model/Driver.dart';
import '../model/DriverStatus.dart';

class Profile extends StatefulWidget {
  @override
  final Widget child;
  Profile({Key key, this.child}) : super(key: key);
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<Profile> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController phoneController = TextEditingController();
  TextEller EmailController = TextEditingController();
  TextEditingController IDController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  Driver driver;
  // DriverStatus status;
  District district;
  List<Driver> drivers;
  List<District> districts;
  List<DriverStatus> status;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < drivers.length; i++) {
      return MaterialApp(
          home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
              backgroundColor: Color(0xffffDD83),
              title: Text("Profile"),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "INFO"),
                  Tab(
                    text: "STATUS",
                  ),
                ],
              )),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Center(
                    child: Expanded(
                        child: Container(
                  height: 600.0,
                  child: ListView(padding: const EdgeInsets.all(8), children: <
                      Widget>[
                    Container(
                      color: Color(0xffFFFFFF),
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 25.0),
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 20.0),
                              child: new Stack(
                                fit: StackFit.loose,
                                children: <Widget>[
                                  new Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      new Container(
                                          width: 140.0,
                                          height: 140.0,
                                          child: new Icon(
                                            Icons.person_rounded,
                                            size: 150.0,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            new Container(
                              color: Color(0xffFFFFFF),
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 25.0),
                                child: new Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Personal Information',
                                                  style: TextStyle(
                                                      fontSize: 18.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                _status
                                                    ? _getEditIcon()
                                                    : new Container(),
                                              ],
                                            )
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'ID',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Text("${drivers[i].driverID}"),
                                            // new Flexible(
                                            //  child: new TextField(controller: IDController),
                                            //    decoration: const InputDecoration(
                                            //     hintText: "Enter Your ID",
                                            //mun = await readObj(mun.municpalityID, "municipality_admin");
                                            // driver= await readObj(driver.driverID, Driver)
                                            //   ),
                                            //   enabled: !_status,
                                            //    autofocus: !_status,
                                            //  ),
                                            //),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Full name',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Flexible(
                                              child: new Text(
                                                  "${drivers[i].firstName} ${drivers[i].lastName}"),

                                              //controller: nameController,
                                              //child: new TextField(
                                              //  decoration: const InputDecoration(
                                              //      hintText:
                                              //          "Enter your full name"),
                                              // "${drivers[i].firstName} ${drivers[i].lastName}"
                                              //  mun = await readObj(mun, "municipality_admin");
                                              // driver= await readObj(driver.firstName, Driver)
                                              // enabled: !_status,
                                              // ),
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            new Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: <Widget>[
                                                new Text(
                                                  'Email',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Text("${drivers[i].email}"),
                                            new Flexible(
                                                // key:new TextField(controller: EmailController),
                                                // child: new TextField(
                                                //  decoration: const InputDecoration(
                                                //      hintText: "Enter your Email"),
                                                //mun = await readObj(mun.email, "municipality_admin");
                                                // driver= await readObj(driver.email, Driver)
                                                //  enabled: !_status,
                                                // ),
                                                ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 25.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Expanded(
                                              child: Container(
                                                child: new Text(
                                                  'Phone number',
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    Padding(
                                        padding: EdgeInsets.only(
                                            left: 25.0, right: 25.0, top: 2.0),
                                        child: new Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Text("${drivers[i].phone}"),
                                            Flexible(
                                              child: Padding(
                                                padding: EdgeInsets.only(
                                                    right: 10.0),
                                                //  child: new TextField(controller: phoneController),

                                                //   decoration: const InputDecoration(
                                                //     hintText:
                                                //          "Enter your phone number"),
                                                //  mun = await readObj(mun.phone, "municipality_admin");
                                                // driver= await readObj(driver.phone, Driver)
                                                //  enabled: !_status,
                                                //  ),
                                              ),
                                              flex: 2,
                                            ),
                                          ],
                                        )),
                                    !_status
                                        ? _getActionButtons()
                                        : new Container(),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                ))),
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 25.0),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  ////////////////////////////////////////////////////////////
                                  'District : ${drivers[i].driverID}',
                                  //  ${districts[i].driverID},
                                  // driver= await readObj(driver.district, Driver)
                                  // district= await readObj(driver.driverID, District)
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                            new Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[],
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.only(
                            left: 55.0, right: 15.0, top: 25.0, bottom: 0.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Number of bins',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 350,
                                ),
                                new Text(
                                  'Performance',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 2.0, top: 2.0),
                        child: new Row(
                          //mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Align(
                              child: Container(
                                height: 50,
                                width: 100,
                                margin: EdgeInsets.only(
                                    top: 40, left: 40, right: 40),
                                decoration: new BoxDecoration(
                                  color: Color.fromARGB(255, 162, 255, 229),
                                  border: Border.all(
                                      color: Color(0xff28CC9E), width: 0.0),
                                  borderRadius: new BorderRadius.all(
                                      Radius.elliptical(100, 50)),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 35.0),
                                child: Text("${districts[i].numberOfBins}"),
                                //district=await readObj(DriverFields.id, district)
                              ),
                            ),
                            new Container(
                              height: 50,
                              width: 100,
                              margin:
                                  EdgeInsets.only(top: 40, left: 300, right: 0),
                              decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 162, 255, 229),
                                border: Border.all(
                                    color: Color(0xff28CC9E), width: 0.0),
                                borderRadius: new BorderRadius.all(
                                    Radius.elliptical(100, 50)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 35.0),
                              child: Text("60%"),
                            ),
                          ],
                        )),

                    Padding(
                        padding:
                            EdgeInsets.only(left: 55.0, right: 25.0, top: 25.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                new Text(
                                  'Bins collected',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: 350,
                                ),
                                new Text(
                                  'Bins not collected',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        )),
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                        child: new Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              child: Container(
                                height: 50,
                                width: 100,
                                margin: EdgeInsets.only(
                                    top: 40, left: 40, right: 40),
                                decoration: new BoxDecoration(
                                  color: Color.fromARGB(255, 162, 255, 229),
                                  border: Border.all(
                                      color: Color(0xff28CC9E), width: 0.0),
                                  borderRadius: new BorderRadius.all(
                                      Radius.elliptical(100, 50)),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10.0, horizontal: 35.0),
                                child: Text("${status[i].completed}"),
                                //status = await readObj(DriverFields.id, DriverStatus)
                              ),
                            ),
                            new Container(
                              height: 50,
                              width: 100,
                              margin:
                                  EdgeInsets.only(top: 40, left: 300, right: 0),
                              decoration: new BoxDecoration(
                                color: Color.fromARGB(255, 162, 255, 229),
                                border: Border.all(
                                    color: Color(0xff28CC9E), width: 0.0),
                                borderRadius: new BorderRadius.all(
                                    Radius.elliptical(100, 50)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 35.0),
                              child: Text("${status[i].incomplete}"),
                              //status = await readObj(DriverFields.id, DriverStatus)
                            ),
                          ],
                        )),

                    //  !_status ? _getActionButtons() : new Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0, top: 0.0, bottom: 0.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async {
                  // ignore: unused_local_variable
                  String email = EmailController.text;
                  String name = nameController.text;
                  String phone = phoneController.text;
                  String newId = IDController.text;
                  //  DriverFields.email = email;
                  //  driver.driverID =Id;
                  //  driver.firstName = name;
                  // await updateObj(Id,driver,tableDriver);
                  //mun = await updateObj(mun.municpalityID,mun, "municipality_admin");
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.red,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
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

  Future<List<Driver>> getDrivers() async {
    //Get drivers from DB
    List<Driver> driv;
    List<dynamic> driversDB = await readAll(tableDriver);
    driv = driversDB.cast();
    // print("in get drivers method");
    // print("drivers length ${driversDB.length}");
    return driv;
  }

  Future<List<District>> getDistricts() async {
    //Get drivers from DB
    List<District> dis;
    List<dynamic> districtDB = await readAll(tableDistrict);
    dis = districtDB.cast();
    print("in get district method");
    print("district length ${districtDB.length}");
    return dis;
  }

  Future<List<DriverStatus>> getStatus() async {
    //Get drivers from DB
    List<DriverStatus> status;
    List<dynamic> statusDB = await readAll(tableDriverStatus);
    status = statusDB.cast();
    print("in get district method");
    print("district length ${statusDB.length}");
    return status;
  }
}
