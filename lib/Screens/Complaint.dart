import 'package:flutter/material.dart';

void main() {
  runApp(Complaint());
  
 }


class Complaint extends StatelessWidget {
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
                      new Expanded(child: new TextField(controller: binId,
                         decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.greenAccent)),
                            labelText: 'Bin Id',
                            suffixStyle: const TextStyle(color: Colors.green)),
                      )
                      
                      ),
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
                      new Expanded(child: new TextField(
                           decoration: new InputDecoration(
                            border: new OutlineInputBorder(
                                borderSide:
                                    new BorderSide(color: Colors.greenAccent)),
                            labelText: 'District',
                            suffixStyle: const TextStyle(color: Colors.green)),
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
                    onPressed: () {},
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
}