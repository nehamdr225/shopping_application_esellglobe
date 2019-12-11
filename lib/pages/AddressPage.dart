import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String name, city, country, location;
  int mobileno, houseno;
  String nameErr, mobilenoErr, housenoErr,cityErr, countryErr, locationErr;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final setName = (data) {
    //   if (nameValidator(data) && data != name && data != null)
    //     setState(() {
    //       name = data;
    //       nameErr = null;
    //     });
    //   else {
    //     setState(() {
    //       nameErr = "Name is not valid!";
    //     });
    //   }
    };

   final setMobileno = (data) {
    //   if (mobilenoValidator(data) && data != mobileno && data != null)
    //     setState(() {
    //       mobileno = data;
    //       mobilenoErr = null;
    //     });
    //   else
    //     setState(() {
    //       mobilenoErr = "mobile is not valid!";
    //     });
   };

    final setHouseno = (id) {
    //   if (housenoValidator(id) && id != houseno && id.length > 7)
    //     setState(() {
    //       housenoErr = null;
    //       houseno = id;
    //     });
    //   else
    //     setState(() {
    //       housenoErr =
    //           "houseno not valid! (Use AlphaNumeric with special characters e.g. AbC123@#!)";
    //     });
   };

   final setCity = (data) {
    //   if (data != city && data != null && cityValidator(data))
    //     setState(() {
    //       city = data;
    //       cityErr = null;
    //     });
    //   else
    //     setState(() {
    //       cityErr = "City name is not valid!";
    //     });
   };

   final setCountry = (data) {
    //   if (data != country && data != null && countryValidator(data))
    //     setState(() {
    //       country = data;
    //       countryErr = null;
    //     });
    //   else
    //     setState(() {
    //       countryErr = "country name is not valid!";
    //     });
   };

   final setLocation  = (data) {
    //   if (data == 'Office'){
    //     setState(() {
    //       location = data;
    //       locationErr = null;
    //     });
    //   }
    //   else{
    //     setState(() {
    //       location = data;
    //       locationErr = null;
    //     });
    //   }
   };

    return Scaffold(
      persistentFooterButtons: <Widget>[
        SizedBox(
          width: width - 150.0,
          child: FRaisedButton(
            text: 'Save',
            shape: true,
            color: Colors.white,
            bg: primaryDark,
            onPressed: (){},
          ),
        )
      ],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: 'Add Shipping Address',
          )),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width - 50.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    // full name
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      onChanged: setName,
                      text: 'Full Name',
                      type: TextInputType.text,
                    ),
                  ),
                  Padding(
                    //phone number
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      onChanged: setMobileno,
                      text: 'Mobile number',
                      type: TextInputType.phone,
                    ),
                  ),
                  Table(
                    //house no. and city
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FForms(
                            onChanged: setHouseno,
                            text: 'House no.',
                            type: TextInputType.number,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: FForms(
                            onChanged: setCity,
                            text: 'City',
                            type: TextInputType.text,
                          ),
                        ),
                      ])
                    ],
                  ),
                  Padding(
                    //country
                    padding: const EdgeInsets.all(8.0),
                    child: FForms(
                      onChanged: setCountry,
                      text: 'Country',
                      type: TextInputType.text,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: width - 50.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Select a label for effective delivery'),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        child: Container(
                          color: Colors.grey[200],
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 110.0,
                          child: InkWell(
                            onTap: setLocation('Office'),// not sure if this works please check <3 
                            child: Text('OFFICE'),
                          ),
                        ),
                      ),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.grey[200],
                          ),
                          alignment: Alignment.center,
                          height: 70.0,
                          width: 110.0,
                          child: InkWell(
                            child: Text('HOME'),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
