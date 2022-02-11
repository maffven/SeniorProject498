import 'package:flutter/material.dart';

void main()
{
  final TextEditingController _controller = new TextEditingController();
  var items = ['Working a lot harder', 'Being a lot smarter', 'Being a self-starter', 'Placed in charge of trading charter'];
  runApp(
    new MaterialApp(
      title: 'Drop List Example',
      home: new Scaffold(
        appBar: new AppBar(title: const Text('Drop List Example')),
        body: new Center(
          child: new Container(
            child: new Column(
              children: [
                new Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: new Row(
                    children: <Widget>[
                      new Expanded(
                        child: new TextField(controller: _controller)
                      ),
                      new PopupMenuButton<String>(
                        icon: const Icon(Icons.arrow_drop_down),
                        onSelected: (String value) {
                          _controller.text = value;
                        },
                        itemBuilder: (BuildContext context) {
                          return items.map<PopupMenuItem<String>>((String value) {
                            return new PopupMenuItem(child: new Text(value), value: value);
                          }).toList();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}