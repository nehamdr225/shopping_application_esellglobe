import 'package:flutter/material.dart';
import '../widget/colors.dart';
import './Home.dart';
import './Signup.dart';


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 50.0, 0.0, 0.0),
                  child: Image.asset('assets/blooddrop.png'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(150.0, 90.0, 0.0, 0.0),
                  child: Text("Blood", 
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(180.0, 130.0, 0.0, 0.0),
                  child: Text("Bank", 
                    style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 35.0, left:20.0, right: 20.0),
            child: Column(
              children: <Widget>[
                SizedBox(height: 30.0,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'EMAIL',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    )
                  ),
                ),
                SizedBox(height: 40.0,),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'PASSWORD',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    )
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 20.0,),
                Container(
                  alignment: Alignment(1.0, 0.0),
                  padding: EdgeInsets.only(top:15.0, left:20.0),
                  child: InkWell(
                    child: Text('Forgot Password',
                    style: TextStyle(
                      color: primarycolor,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat',
                      decoration: TextDecoration.underline
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 80.0,),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Colors.redAccent,
                    color: primarycolor,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, 
                          MaterialPageRoute(builder:(context) => HomePageApp())
                        );  
                      },
                      child: Center(
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Montserrat'
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ) ,),
            SizedBox(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('New here?',
                  style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'Montserrat'),
                  ),
                  SizedBox(width: 5.0,),
                  InkWell(
                    onTap: (){
                      Navigator.push(
                      context, MaterialPageRoute(builder: (context) => SignupPage()),//place, count, density)),
                    );
                    },
                    child: Text('Register',
                      style: TextStyle(fontFamily: 'Montserrat', color: primarycolor, 
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline),),
                  )
              ],
            )

        ],
      ),
      
    );
  }
}