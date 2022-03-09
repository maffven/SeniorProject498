import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
runApp(MyApp());
}

class MyApp extends StatefulWidget {
@override
_MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
void initState() {
	super.initState();
	readData();
}

bool isLoading = true;
List<String> list = [];
Future<void> readData() async {
	
	// Please replace the Database URL
	// which we will get in “Add Realtime Database”
	// step with DatabaseURL
	
	var url = "https://arduino-8abef-default-rtdb.firebaseio.com/"+"data.json";
	// Do not remove “data.json”,keep it as it is
	try {
	final response = await http.get(Uri.parse(url));
	final extractedData = json.decode(response.body) as Map<String, dynamic>;
	if (extractedData == null) {
		return;
	}
	extractedData.forEach((blogId, blogData) {
		list.add(blogData["Distance"]);
	});
	setState(() {
		isLoading = false;
	});
	} catch (error) {
	throw error;
	}
}

@override
Widget build(BuildContext context) {
	return MaterialApp(
	title: 'RealTime Database',
	theme: ThemeData(
		primarySwatch: Colors.green,
	),
	home: Scaffold(
		appBar: AppBar(
			title: Text("GeeksforGeeks"),
		),
		body: isLoading
			? CircularProgressIndicator()
			: ListView.builder(
				padding: const EdgeInsets.all(8),
				itemCount: list.length,
				itemBuilder: (BuildContext context, int index) {
					return Container(
						height: 50,
						child: Center(
						child: Text(
							list[index],
							style: TextStyle(color: Colors.green),
						),
						));
				})),
	);
}
}

