
import 'package:flutter/material.dart';
import 'package:flutter_application_1/HomePage.dart';

void main(){
runApp(MyApp());//function written by flutter 
}

/*class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp( title: 'Welcome to Flutter',
   home: Text('Manar Hennawi'),);
   //create this App
  }

}*/
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDemo(),
    );
  }
}
class HomeDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<HomeDemo> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Color(0xff28CC9E) ,
        title: Text("Login"),
      ),
      body: 
      SingleChildScrollView(
        child: Column(
          children: <Widget>[
        new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(image: new NetworkImage("images/bin.png"), fit: BoxFit.cover,),
          ),
        ),
           Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    /*decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(50.0)),*/
                    child: Image.asset('images/bin.png')),
              ),
            ),
                
             Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 30),
              child: Text('Track your bins effictevily \n for a better enviroment',  style: TextStyle(fontSize: 21),
              ),
                   
            ),
            
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
             
            ),
             Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  color:  Color(0xff28CC9E) , borderRadius: BorderRadius.circular(40)),
              child: FlatButton(
                onPressed: () {
                 
                },
               
              ),
            ),
            Container(
              height: 50,
              width: 250,
              
              decoration: BoxDecoration(
                  color:  Color(0xff28CC9E) , 
                  borderRadius: BorderRadius.circular(20)),
                  
              child: FlatButton(
                onPressed: () {
                 
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
}
