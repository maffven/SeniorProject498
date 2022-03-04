import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DriverSatus extends StatefulWidget {
  @override
  final Widget child;
  DriverSatus({Key key, this.child}) : super(key: key);
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<DriverSatus> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
      length: 1,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Status"),
        ),
        body: TabBarView(children: [
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
                              'District : AlNaseem , AlRawdhah',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
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
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 350,
                            ),
                            new Text(
                              'Performance',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 2.0, top: 2.0),
                    child: new Row(
                      //mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Align(
                          child: Container(
                            height: 50,
                            width: 100,
                            margin:
                                EdgeInsets.only(top: 40, left: 40, right: 40),
                            decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 162, 255, 229),
                              border: Border.all(
                                  color: Color(0xff28CC9E), width: 0.0),
                              borderRadius: new BorderRadius.all(
                                  Radius.elliptical(100, 50)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 35.0),
                            child: Text("22"),
                          ),
                        ),
                        new Container(
                          height: 50,
                          width: 100,
                          margin: EdgeInsets.only(top: 40, left: 300, right: 0),
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
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              width: 350,
                            ),
                            new Text(
                              'Bins not collected',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    )),
                Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 2.0),
                    child: new Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Align(
                          child: Container(
                            height: 50,
                            width: 100,
                            margin:
                                EdgeInsets.only(top: 40, left: 40, right: 40),
                            decoration: new BoxDecoration(
                              color: Color.fromARGB(255, 162, 255, 229),
                              border: Border.all(
                                  color: Color(0xff28CC9E), width: 0.0),
                              borderRadius: new BorderRadius.all(
                                  Radius.elliptical(100, 50)),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 35.0),
                            child: Text("12"),
                          ),
                        ),
                        new Container(
                          height: 50,
                          width: 100,
                          margin: EdgeInsets.only(top: 40, left: 300, right: 0),
                          decoration: new BoxDecoration(
                            color: Color.fromARGB(255, 162, 255, 229),
                            border: Border.all(
                                color: Color(0xff28CC9E), width: 0.0),
                            borderRadius: new BorderRadius.all(
                                Radius.elliptical(100, 50)),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 35.0),
                          child: Text("10"),
                          //child: Icon(CupertinoIcons.bell),
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      SizedBox(
                        width: 280,
                      ),
                      Icon(
                        CupertinoIcons.bell,
                        size: 50,
                      ),
                    ],
                  ),

                  //  !_status ? _getActionButtons() : new Container(),
                )
              ],
            ),
          ),
        ]),
      ),
    ));
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
}
