import 'package:esell/pages/AddressPage.dart';
import 'package:esell/widget/AnimatingLine.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class CheckoutPage extends StatefulWidget {
  final price;
  final items;

  CheckoutPage({this.price, this.items});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String name, city, country, location, mobileNo;
  String nameErr, mobileNoErr, cityErr, countryErr;
  int houseNo;
  Map shippingInfo, billingInfo;

  void setName(String value) {
    if (value.length > 10) {
      setState(() {
        name = value;
        nameErr = null;
      });
    } else {
      setState(() {
        name = value;
        nameErr = 'Name is not valid!';
      });
    }
  }

  void setCity(String value) {
    if (value.length > 5) {
      setState(() {
        city = value;
        cityErr = null;
      });
    } else {
      setState(() {
        city = value;
        cityErr = 'City is not valid!';
      });
    }
  }

  void setCountry(String value) {
    if (value.length > 5) {
      setState(() {
        country = value;
        countryErr = null;
      });
    } else {
      setState(() {
        country = value;
        countryErr = 'Country is not valid!';
      });
    }
  }

  void setLocation(String value) {
    setState(() {
      location = value;
    });
  }

  void setMobileNo(String value) {
    if (value.length >= 10) {
      setState(() {
        mobileNo = value;
        mobileNoErr = null;
      });
    } else {
      setState(() {
        mobileNo = value;
        mobileNoErr = 'Mobile no. is not valid!';
      });
    }
  }

  void setHouseNo(int value) {
    setState(() {
      houseNo = value;
    });
  }

  String saveShippingInfo() {
    if (name != null && city != null && country != null && mobileNo != null) {
      setState(() {
        shippingInfo = {
          'name': name,
          'house': houseNo ?? 'N/A',
          'city': city,
          'country': country,
          'location': location,
          'mobile': mobileNo
        };
      });
      return 'done';
    }
    return 'error';
  }

  String saveBillingInfo() {
    if (name != null && city != null && country != null && mobileNo != null) {
      setState(() {
        billingInfo = {
          'name': name,
          'house': houseNo ?? 'N/A',
          'city': city,
          'country': country,
          'location': location,
          'mobile': mobileNo
        };
      });
      return 'done';
    }
    return 'error';
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final user = Provider.of<UserModel>(context);
    final width = MediaQuery.of(context).size.width;

    void placeOrder() {
      if (name != null && city != null && country != null && mobileNo != null) {
        user.placeOrder().then((result) {
          if (result['error'] == null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AnimatingLine()),
            );
          }
        });
      }
    }

    return Scaffold(
      persistentFooterButtons: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 50.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FancyText(
                      text: 'Rs. ${widget.price}',
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                      size: 15.0,
                    ),
                  ],
                ),
                FancyText(
                  text: 'VAT included',
                  size: 14.0,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w300,
                ),
              ],
            )),
        SizedBox(
          width: 10.0,
        ),
        SizedBox(
          width: 150.0,
          child: FRaisedButton(
            bg: primaryDark,
            text: 'Place Order',
            color: Colors.white,
            shape: true,
            onPressed: name != null ? placeOrder : null,
          ),
        ),
      ],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: 'Checkout',
          )),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: <Widget>[
          Card(
            child: Column(
              children: <Widget>[
                InfoNavBar(
                  text: 'Shipping Details',
                  size: 18.0,
                  icon: FlatButton(
                      child: Text('Edit'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressPage(
                                name: name,
                                city: city,
                                country: country,
                                location: location,
                                mobileNo: mobileNo,
                                houseNo: houseNo,
                                nameErr: nameErr,
                                cityErr: cityErr,
                                countryErr: countryErr,
                                mobilenoErr: mobileNoErr,
                                setCity: setCity,
                                setCountry: setCountry,
                                setHouseNo: setHouseNo,
                                setLocation: setLocation,
                                setMobileNo: setHouseNo,
                                setName: setName,
                                save: saveShippingInfo),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(country != null
                    ? '$houseNo, $city, $country'
                    : 'Please provide shipping details.'),
                SizedBox(
                  height: 20.0,
                ),
                InfoNavBar(
                  text: 'Bill to default billing address',
                  size: 18.0,
                  icon: FlatButton(
                      child: Text('Edit'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddressPage(
                                name: name,
                                city: city,
                                country: country,
                                location: location,
                                mobileNo: mobileNo,
                                houseNo: houseNo,
                                nameErr: nameErr,
                                cityErr: cityErr,
                                countryErr: countryErr,
                                mobilenoErr: mobileNoErr,
                                setCity: setCity,
                                setCountry: setCountry,
                                setHouseNo: setHouseNo,
                                setLocation: setLocation,
                                setMobileNo: setHouseNo,
                                setName: setName,
                                save: saveBillingInfo),
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 40.0,
                  width: width - 40.0,
                  child: FForms(
                    type: TextInputType.phone,
                    text: 'Enter your phone number',
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  height: 40.0,
                  width: width - 40.0,
                  child: FForms(
                    type: TextInputType.emailAddress,
                    text: 'Enter your email address',
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
              ],
            ),
          ),
          Divider(),
          Column(
              children: widget.items.map<Widget>((fav) {
            final product = products.one(fav['product']);
            return Container(
              margin: EdgeInsets.only(top: 15),
              height: 80.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(1, 1),
                      blurRadius: 1),
                  BoxShadow(
                      color: Colors.black12,
                      offset: Offset.fromDirection(-1, 1),
                      blurRadius: 1)
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(3.0),
                    child: Image.network(
                        product['media'][0]['src'].length > 0
                            ? product['media']['src'][0]
                            : '',
                        height: 100.0,
                        width: 70.0),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          product['name'],
                          style: TextStyle(
                              fontFamily: "Helvetica",
                              color: textColor,
                              fontSize: 14.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Quantity:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                fav['quantity'].toString(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Size:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                fav['size'] ?? "N/A",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text('Color:',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(fav['color'] ?? "N/A"),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          padding: EdgeInsets.all(3.0),
                          child: Text("Rs. ${product['price']}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red)),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList()),
        ],
      ),
    );
  }
}
