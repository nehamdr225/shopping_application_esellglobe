import 'package:flutter/material.dart';
import '../widget/colors.dart';

String dropdownValue ='One';

void main()=> runApp(SignupPage());

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Page(),
      
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  var selectedType;
  var selectedBloodType;

  List<String> _type=<String>[
    'User',
    'Seller'
  ];



  @override
  Widget build(BuildContext context) {
//    loadData();
    final name = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
                    labelText: 'FULL NAME',
                    labelStyle: TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: primarycolor)
                    )
                  ),
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
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
                );
    

    final number = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        icon: Icon(Icons.call),
        labelText: 'Mobile No.',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      obscureText: true,
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
    );

     //List pjson = [email, name, password, number];


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
                  child: Text('Logo here')
                  //Image.asset('assets/blooddrop.png'),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(150.0, 90.0, 0.0, 0.0),
                  child: Text("eSell", 
                    style: TextStyle(fontFamily: 'Victorian',fontSize: 60.0, fontWeight: FontWeight.bold, color: Colors.black54),),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(200.0, 130.0, 0.0, 40.0),
                  child: Text("Globe", 
                    style: TextStyle(fontFamily: 'Victorian',fontSize: 60.0, fontWeight: FontWeight.bold),),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 5.0, left:20.0, right: 20.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                email,
                SizedBox(height: 15.0,),
                  name,
                SizedBox(height: 15.0,),
                  password,
                SizedBox(height: 15.0,),
                  number,

                SizedBox(height: 15.0,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Icon(Icons.people_outline,
                    size:25.0,
                    color: Colors.grey),
                    SizedBox(width: 140.0,),
                    DropdownButton(
                      onChanged: (selectCategory){
                        setState(() {
                          selectedType= selectCategory;
                        });
                      },
                      value: selectedType,
                      hint: Text('Select your status'),
                      items: _type.map((value)=> DropdownMenuItem(
                        child: Text(
                          value,
                          style: TextStyle(color: Colors.grey) ,
                          ),
                        value: value
                      )).toList(),
                    ),
                  
                  ],  
                ),

                SizedBox(height: 30.0,),
                Container(
                  height: 40.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    shadowColor: Color(0xff311b92),
                    color: primarycolor,
                    elevation: 7.0,
                    child: RaisedButton(
                      color: icontheme2,   
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),            
                      onPressed: (){
                      //   Navigator.of(context).push(
                      //   MaterialPageRoute(builder: (context)=> WishlistPage()));
                      },
                      child: Center(
                        child: Text(
                          'Register',
                          style: TextStyle(
                            color:Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily:'Ropa Sans',
                            fontSize: 22.0
                          )
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ) ,),
        ],
      ),
      
    );
  }
}