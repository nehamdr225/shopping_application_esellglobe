import 'package:esell/entities/address.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {
  final Function save;
  final bool isBilling;
  final Address address;
  AddressPage({this.save, this.isBilling: false, this.address});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String name, city, country, location = "Home", mobileNo;
  String nameErr, mobileNoErr, cityErr, countryErr;
  String houseNo;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void setName(String value) => setState(() => name = value);

  void setCity(String value) => setState(() => city = value);

  void setCountry(String value) => setState(() => country = value);

  void setLocation(String value) => setState(() => location = value);

  void setMobileNo(String value) => setState(() => mobileNo = value);

  void setHouseNo(String value) => setState(() => houseNo = value);

  String active;
  @override
  Widget build(BuildContext context) {
    setState(() {
      active = widget.address.label ?? "Home";
      country = widget.address.country;
      location = widget.address.label;
    });
    final primaryColor = Theme.of(context).colorScheme.primaryVariant;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        persistentFooterButtons: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: GradientButton(
              width: MediaQuery.of(context).size.width,
              text: 'Save',
              onPressed: () {
                if (!_formKey.currentState.validate()) {
                  return;
                }
                // final status = widget.save();
                // print(status);
                Map<String, String> json = {
                  'name': name,
                  'city': city,
                  'houseNo': houseNo,
                  'label': location,
                  'contact': mobileNo,
                  'country': country,
                };
                widget.save(json, widget.isBilling);
                Navigator.pop(context);
              },
            ),
          ),
        ],
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(40.0),
            child: FAppBar(
              wishlist: true,
              title: widget.isBilling ? 'Billing Address' : 'Shipping Address',
            )),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                Padding(
                  // full name
                  padding: const EdgeInsets.only(
                      bottom: 8.0, left: 8.0, right: 8.0, top: 15.0),
                  child: FForms(
                    icon: Icon(Icons.person, color: primaryColor),
                    onChanged: setName,
                    validator: (value) =>
                        value.isEmpty ? 'Name is not valid!' : null,
                    text: 'Full Name',
                    type: TextInputType.text,
                    initialValue: widget.address.name,
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
                    onChanged: setMobileNo,
                    text: 'Mobile number',
                    initialValue: widget.address.contact,
                    validator: (value) => value.isEmpty && value.length != 10
                        ? 'Phone is not valid!'
                        : null,
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
                          onChanged: setHouseNo,
                          text: 'House no.',
                          initialValue: widget.address.houseNo,
                          validator: (value) =>
                              value.isEmpty ? 'Not valid!' : null,
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
                          onChanged: setCity,
                          initialValue: widget.address.city,
                          validator: (value) =>
                              value.isEmpty ? 'Not valid!' : null,
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
                    onChanged: setCountry,
                    text: 'Country',
                    initialValue: widget.address.country,
                    validator: (value) =>
                        value.isEmpty ? 'Country is not valid!' : null,
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
                                    setLocation('Office');
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
                                    setLocation('Home');
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
