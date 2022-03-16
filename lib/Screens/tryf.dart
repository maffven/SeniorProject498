import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));
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
List<Map<dynamic,dynamic>> distanceList = [];
  Future<DataSnapshot> getData() async{
     //var user = await FirebaseAuth.instance.currentUser();
     
  }
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
  final ref = FirebaseFirestore.instance.collection("arduino-8abef-default-rtdb");
 final dbRef = FirebaseDatabase.instance.reference().child("arduino-8abef-default-rtdb");
 

}
}

