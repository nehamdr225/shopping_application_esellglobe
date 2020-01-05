import 'package:esell/pages/AccountPage.dart';
import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ChangePassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserModel>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.5,
            title: Text('Change Password',
                style: Theme.of(context).textTheme.title.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500)),
            backgroundColor: primaryDark,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AccountPage()));
              },
            ),
            actions: <Widget>[
              FIcons(
                icon: Icons.search,
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              FIcons(
                  icon: Icons.shopping_cart,
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  })
            ],
          )),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FForms(
              underline: true,
              text: 'Mobile Number',
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FForms(
              underline: true,
              text: 'New Password',
              height: 75.0,
              width: width * 0.90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FForms(
              underline: true,
              text: 'Retype Password',
              height: 75.0,
              width: width * 0.90,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text('Enter OTP sent to your phone',
                style: Theme.of(context).textTheme.title.copyWith(
                    color: textColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w700)),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: FForms(
                  underline: true,
                  text: 'OTP',
                  type: TextInputType.number,
                  height: 75.0,
                  width: width * 0.70,
                ),
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.20,
                  child: Text('Resend',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: primaryDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.40,
                  child: Text('Cancel',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: Colors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  width: width * 0.40,
                  child: Text('Save',
                      style: Theme.of(context).textTheme.title.copyWith(
                          color: primaryDark,
                          fontSize: 16,
                          fontWeight: FontWeight.w700)),
                ),
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
