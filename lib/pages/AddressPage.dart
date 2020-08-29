import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  final String name, city, country, location, mobileNo;
  final String houseNo;
  final String nameErr, mobilenoErr, cityErr, countryErr;
  final Function setName,
      setMobileNo,
      setHouseNo,
      setCountry,
      setCity,
      setLocation,
      save;
  final bool isBilling;
  AddressPage(
      {this.name,
      this.city,
      this.country,
      this.location,
      this.mobileNo,
      this.houseNo,
      this.setCity,
      this.setCountry,
      this.setHouseNo,
      this.setLocation,
      this.setMobileNo,
      this.setName,
      this.cityErr,
      this.countryErr,
      this.mobilenoErr,
      this.nameErr,
      this.save,
      this.isBilling: false});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String active = "Home";
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).colorScheme.primaryVariant;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        persistentFooterButtons: <Widget>[
          GradientButton(
            width: MediaQuery.of(context).size.width * 0.50,
            text: 'Save',
            onPressed: () {
              final status = widget.save();
              print(status);
              Navigator.pop(context);
            },
          ),
        ],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: FAppBar(
              wishlist: true,
              title: widget.isBilling
                  ? 'Add Billing Address'
                  : 'Add Shipping Address',
            )),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            child: ListView(
              children: <Widget>[
                Padding(
                  // full name
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 8.0, right: 8.0, top: 15.0),
                  child: FForms(
                    icon: Icon(Icons.person, color: primaryColor),
                    onChanged: widget.setName,
                    text: 'Full Name',
                    type: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Padding(
                  //phone number
                  padding: const EdgeInsets.all(8.0),
                  child: FForms(
                    icon: Icon(Icons.phone, color: primaryColor),
                    onChanged: widget.setMobileNo,
                    text: 'Mobile number',
                    type: TextInputType.phone,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Table(
                  //house no. and city
                  children: [
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FForms(
                          icon: Icon(Icons.home, color: primaryColor),
                          onChanged: widget.setHouseNo,
                          text: 'House no.',
                          type: TextInputType.number,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 15.0, color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FForms(
                          icon: Icon(Icons.location_city, color: primaryColor),
                          onChanged: widget.setCity,
                          text: 'City',
                          type: TextInputType.text,
                          textStyle: Theme.of(context)
                              .textTheme
                              .bodyText2
                              .copyWith(fontSize: 15.0, color: Colors.black),
                        ),
                      ),
                    ])
                  ],
                ),
                Padding(
                  //country
                  padding: const EdgeInsets.all(8.0),
                  child: FForms(
                    icon: Icon(Icons.place, color: primaryColor),
                    onChanged: widget.setCountry,
                    text: 'Country',
                    type: TextInputType.text,
                    textStyle: Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(fontSize: 15.0, color: Colors.black),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.isBilling
                      ? <Widget>[
                          // ClipRRect(
                          //   borderRadius: BorderRadius.circular(32.0),
                          //   child: FlatButton(
                          //     color: primary,
                          //     child: Text(
                          //       'Copy Shipping Address',
                          //       style: TextStyle(color: Colors.white, fontSize: 18.0),
                          //     ),
                          //     onPressed: () {
                          //       widget.save('ship');
                          //     },
                          //   ),
                          // )
                        ]
                      : <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 15.0, horizontal: 8.0),
                              child: Text(
                                'Select a label for effective delivery',
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    widget.setLocation('Office');
                                    setState(() {
                                      active = 'Office';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: active == 'Office'
                                            ? primaryColor
                                            : Colors.transparent,
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 15.0),
                                      child: Text(
                                        'OFFICE',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: active != "Office"
                                                ? textColor
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    widget.setLocation('Home');
                                    setState(() {
                                      active = 'Home';
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: active == 'Home'
                                            ? primaryColor
                                            : Colors.transparent,
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.0, vertical: 15.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'HOME',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: active != "Home"
                                                ? textColor
                                                : Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                ),
              ],
            ),
          ),
        ));
  }
}
