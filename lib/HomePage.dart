
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
         /* decoration: new BoxDecoration(
            image: new DecorationImage(image: AssetImage("assets/images/first.png"), fit: BoxFit.cover,),
          ),*/
        ),
           Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                  decoration: new BoxDecoration(
            image: new DecorationImage(image: AssetImage("assets/images/first.png"), fit: BoxFit.cover,),
          ),
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/images/first.png')),
              ),
            ),
             Padding(
             
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 30),
              child: Text('Track your bins effictevily \n for a better enviroment',  style: TextStyle(fontSize: 24),
              ),
                   
            ),
            
            FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
             
            ),
            ListTile(
          title: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ElevatedButton(
                 onPressed: _incrementCounter,
      style: ButtonStyle(
           backgroundColor: MaterialStateProperty.all( Color(0xff28CC9E) ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color: Color(0xff000000),
                      width: 0.4,
                  ),
              ),
          ),
      ),
      ),
           ElevatedButton(
             
              onPressed: _incrementCounter,
      style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all( Color(0xff28CC9E) ),
    
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(
                      color:Color(0xff000000),
                      width: 0.4,
                  ),
              ),
          ),
      ),
      
      ),
             /* Expanded(child: FlatButton(onPressed: () {},child: Text(""),color:  Color(0xff28CC9E),)),
              Expanded(child: FlatButton(onPressed: () {},child: Text(""),color: Color(0xff28CC9E),)),*/
     
             /*  RaisedButton(
              
                  onPressed: _incrementCounter,
                  color:Color(0xff28CC9E),
                ),
              
                 RaisedButton(
                  onPressed: _decrementCounter,
                 
                  color: Color(0xff28CC9E),
                  
                ),*/
            ],
          ),
            ),
            /* Container(
                margin: const EdgeInsets.only(
              right: 55,),
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
                margin: const EdgeInsets.only(
              left: 40,  bottom: 15),
              height: 20,
              width: 20,
              
              decoration: BoxDecoration(
                  color:  Color(0xff28CC9E) , borderRadius: BorderRadius.circular(40)),
              child: FlatButton(
                onPressed: () {
                 
                },
               
              ),
            ),*/
            Container(
              height: 50,
              width: 250,
               margin: const EdgeInsets.only(top: 40.0),
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

  void _incrementCounter(){

  }
  void _decrementCounter(){

  }
}
