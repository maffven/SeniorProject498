import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/first.dart';

class Notification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotificationDemo(),
    );
  }
}

class NotificationDemo extends StatefulWidget {
  @override
  _NotificationDemoState createState() => _NotificationDemoState();
}

class _NotificationDemoState extends State<NotificationDemo> {
  @override
  Widget build(BuildContext context) {
    final String title = "";
    // final Function onTap ;
    final bool enable = true;
    const kLightColor = Color(0xFF808080);
    const kDarkColor = Color(0xFF303030);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        title: Text("Notification"),
      ),
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
                child: Container(
              child: ListView(
                padding: const EdgeInsets.all(8),
                children: <Widget>[
                  Container(
                    height: 50,
                    child:
                        const Center(child: Text('Alnaseem Full bin 1807422')),
                  ),
                  Container(
                    height: 50,
                    child:
                        const Center(child: Text('AlRawdhah Full bin 1808422')),
                  ),
                  Container(
                    height: 50,
                    child:
                        const Center(child: Text('Alnaeem Full bin 1819422')),
                  )
                ],
              ),
            )

                // child: Image.asset('/Users/mac/Desktop/flutter_application_1/assets/images/first.png')),
                ),
          ),
          Padding(
            //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
            padding: const EdgeInsets.only(
                left: 15.0, right: 15.0, top: 20, bottom: 30),
            child: Text(
              '',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ]),

        //      ListTile(
        //       title: Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //        children: <Widget>[
        //   ListTile(
        //      leading: Container(
        //          height: 50.0, width: 50.0, decoration: BoxDecoration()),
        ////         title: Text(title, style: TextStyle(color: kDarkColor)),
        //subtitle: Text(subtitle, style: TextStyle(color: kLightColor)),
        //  onTap: onTap,
        //           enabled: enable,
        //         )
        //       ],
        //     ),
        //   ),

        //         Container(
        ///          height: 50,
        //          width: 250,
        //         margin: const EdgeInsets.only(top: 40.0),
        //        decoration: BoxDecoration(
        //            color: Color(0xff28CC9E),
        //            borderRadius: BorderRadius.circular(20)),
        //     child: FlatButton(
        //     onPressed: () {},
        //     child: Text(
        //       'Login',
        //      style: TextStyle(color: Colors.white, fontSize: 25),
        //    ),
        //  ),
        // ),
      ),
    );
  }
}
