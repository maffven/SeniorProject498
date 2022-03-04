import 'package:flutter/material.dart';
//import 'package:custom_list_flutter_app/Person.dart';

class Notifications extends StatefulWidget {
  @override
  final Widget child;
  Notifications({Key key, this.child}) : super(key: key);
  NotificationState createState() => NotificationState();
}

class notif {
  String name;
  String count;

  notif({this.name, this.count});
}

List<notif> persons = [
  notif(name: 'Alrawdah ', count: 'Full bin 1807422'),
  notif(name: 'AlNaseem ', count: 'Full bin 1807422'),
  notif(name: 'AlWaha ', count: 'Full bin 1807422')
];

class NotificationState extends State<Notifications> {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  Widget personDetailCard(Person) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Card(
        color: Color.fromARGB(255, 255, 244, 208),
        child: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                // child: Container(
                // width: 50.0,
                // height: 50.0,
                // ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.circle,
                    color: Color.fromARGB(255, 252, 10, 10),
                    size: 15,
                  ),
                  SizedBox(
                    width: 50,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Person.name,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    Person.count,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        centerTitle: true,
        title: Text("Notifications"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications),
          ),
        ],

        //title: Text("Notifications"),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: Column(
          children: <Widget>[
            Column(
                children: persons.map((p) {
              return personDetailCard(p);
            }).toList()),
          ],
        ),
      ),
    ));
  }
}
