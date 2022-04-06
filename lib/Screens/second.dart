
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/first.dart';
import 'package:flutter_application_1/screens/Login.dart';


void main() {
  runApp(second());
  
 }
class second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: secondDemo(),
    );
  }
}

class secondDemo extends StatefulWidget {
  @override
  _secondDemo createState() => _secondDemo();
}

class _secondDemo extends State<secondDemo> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Color(0xffffDD83) ,
        title: Text("Login"),
      ),
      body: 
      SingleChildScrollView(
        child: Column(
         children: <Widget>[
      
           Padding(
              padding: const EdgeInsets.only(top: 150.0),
              child: Center(
                child: Container(
                  decoration: new BoxDecoration(
            image: new DecorationImage(image: AssetImage("/Users/mac/Desktop/flutter_application_1/assets/images/second.png"), fit: BoxFit.cover,),
          ),
                    width: 207,
                    height: 170,
                   // child: Image.asset('/Users/mac/Desktop/flutter_application_1/assets/images/first.png')),
               ), ),
            ),
             Padding(
             
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 20, bottom: 30),
              child: Text('\n Better manage the waste and \n be notified when bins are full',  style: TextStyle(fontSize: 24),
              ),
                   
            ),
            
          /*  FlatButton(
              onPressed: (){}
                //TODO FORGOT PASSWORD SCREEN GOES HERE
              },
             
            ),*/
           /* ListTile(
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
            ),*/
        
      
            /*Container(
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
                   Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  Login()),
  );
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
