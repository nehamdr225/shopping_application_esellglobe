import 'package:esell/entities/cart.dart';
import 'package:esell/pages/AddressPage.dart';
import 'package:esell/widget/AnimatingLine.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Snackbar.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';
import 'package:quiver/iterables.dart';

class CheckoutPage extends StatefulWidget {
  final List<CartItem> items;

  CheckoutPage({this.items});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  String name, city, country, location = "Home", mobileNo;
  String nameErr, mobileNoErr, cityErr, countryErr;
  String houseNo;
  Map shippingInfo, billingInfo;

  final scaffoldKey = GlobalKey<ScaffoldState>();

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

  void setHouseNo(String value) {
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
        // print(shippingInfo);
      });
      return 'done';
    }
    return 'error';
  }

  String saveBillingInfo(type) {
    if (type == "ship" && shippingInfo != null) {
      setState(() {
        billingInfo = {
          'name': shippingInfo['name'],
          'house': shippingInfo['houseNo'] ?? 'N/A',
          'city': shippingInfo['city'],
          'country': shippingInfo['country'],
          'mobile': shippingInfo['mobileNo']
        };
        // print(billingInfo);
      });
      return 'done';
    }
    if (name != null && city != null && country != null && mobileNo != null) {
      setState(() {
        billingInfo = {
          'name': name,
          'house': houseNo ?? 'N/A',
          'city': city,
          'country': country,
          'mobile': mobileNo
        };
      });
      return 'done';
    }
    return 'error';
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final width = MediaQuery.of(context).size.width;

    var previews = [];
    for (final item in widget.items) {
      previews.add(item.product.media.front);
    }

    return Scaffold(
      persistentFooterButtons: <Widget>[
        Container(
            alignment: Alignment.centerLeft,
            height: 40.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FancyText(
                      text: 'Total : Rs. ${widget.items[0].product.price}',
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
        Builder(
          builder: (BuildContext context) {
            return FRaisedButton(
              width: width * 0.45,
              height: 40.0,
              bg: primaryDark,
              text: 'Place Order',
              color: Colors.white,
              shape: true,
              onPressed: name != null
                  ? () {
                      if (shippingInfo != null) {
                        final List orderDatas = widget.items
                            .map<Map>((item) => {
                                  "userInfo": shippingInfo,
                                  "billing": billingInfo ?? shippingInfo,
                                  'product': item.product.id,
                                  'seller': item.product.seller,
                                })
                            .toList();
                        // final orderData = {
                        //   "userInfo": shippingInfo,
                        //   "billing": billingInfo ?? shippingInfo,
                        //   'product': widget.item['product']['_id'],
                        //   'seller': widget.item['product']['seller'],
                        // };
                        // print(orderDatas);
                        // return;
                        orderDatas.forEach((orderData) {
                          user.placeOrder(orderData).then((result) {
                            // print('THIS IS THE RESULT');
                            // print(result);
                            if (result['error'] != null) {
                              buildAndShowSnackBar(context, 'Error ordering');
                            } else {
                              buildAndShowSnackBar(context, 'Order created');
                              user.deleteFromCart(orderData['product']);
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => AnimatingLine()));
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnimatingLine()),
                                (Route<dynamic> route) => false,
                              );
                            }
                          });
                        });
                      }
                    }
                  : null,
            );
          },
        )
      ],
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: FAppBar(
            wishlist: true,
            title: 'Checkout',
          )),
      // backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              InfoNavBar(
                text: 'Shipping Details',
                size: 18.0,
                icon: FlatButton(
                    child: Text('Edit', style: TextStyle(color: primaryDark)),
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
                              setMobileNo: setMobileNo,
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
                    child: Text('Edit', style: TextStyle(color: primaryDark)),
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
                              setMobileNo: setMobileNo,
                              setName: setName,
                              save: saveBillingInfo,
                              isBilling: true),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 10.0,
              ),
              Container(
                alignment: Alignment.center,
                child: billingInfo != null && billingInfo['house'] != null
                    ? Text('$houseNo, $city, $country')
                    : FlatButton(
                        color: orderBar,
                        child: Text(
                          'Copy Shipping Details',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          saveBillingInfo('ship');
                        },
                      ),
              ),
              SizedBox(
                height: 40.0,
              ),
            ],
          ),
          InfoNavBar(
            text: "Products & Details",
            //icon: Text(''),
            onPressed: null,
          ),
          Column(
            children: zip<dynamic>([previews, widget.items])
                .map<Widget>(
                  (values) => Container(
                    margin: EdgeInsets.only(top: 20, bottom: 10),
                    height: 80.0,
                    // decoration: BoxDecoration(
                    //   color: Colors.white,
                    //   boxShadow: [
                    //     BoxShadow(
                    //         color: Colors.black12,
                    //         offset: Offset.fromDirection(1, 1),
                    //         blurRadius: 1),
                    //     BoxShadow(
                    //         color: Colors.black12,
                    //         offset: Offset.fromDirection(-1, 1),
                    //         blurRadius: 1)
                    //   ],
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Image.network(
                                'https://api.shop2more.com' + values[0],
                                height: 100.0,
                                width: 70.0),
                          ),
                        ),
                        Flexible(
                          flex: 2,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                values[1].product.name == null
                                    ? Text('No Product')
                                    : Text(
                                        values[1].product.name,
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
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        values[1].quantity.toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text('Size:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        values[1].size.toString() ?? "N/A",
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text('Color:',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(values[1].color ?? "N/A"),
                                    ),
                                  ],
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  padding: EdgeInsets.all(3.0),
                                  child: Text("Rs. ${values[1].product.price}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
