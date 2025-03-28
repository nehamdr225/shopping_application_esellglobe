import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/SearchPage.dart';
import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/atoms/BetterInputForm.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/passwordReset/resetPage.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class AccountEdit extends StatefulWidget {
  @override
  _AccountEditState createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  List name = [];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final user = Provider.of<UserModel>(context);
    final userData = user.user;

    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0,
            backgroundColor: Theme.of(context).colorScheme.primary,
            leading: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(CupertinoIcons.back),
                  Text(
                    "Back",
                    style: Theme.of(context)
                        .textTheme
                        .subtitle1
                        .copyWith(color: Colors.white),
                  ),
                ],
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              FIcons(
                icon: Icon(Icons.search),
                alignment: Alignment.centerRight,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchPage()));
                },
              ),
              FIcons(
                  icon: Image.asset(
                    "images/esellIcons/cart2.png",
                    color: Colors.white,
                    height: 20.0,
                    width: 20.0,
                  ),
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CartPage()));
                  })
            ],
          )),
      body: ListView(
        children: <Widget>[
          Stack(
            alignment: AlignmentDirectional.center,
            children: <Widget>[
              Container(
                color: Theme.of(context).colorScheme.primary,
                height: height * 0.30,
                width: width,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 45.0,
                child: userData['media'] != null
                    ? Image.network(userData['media'])
                    : Text(
                        userData['name'].split(' ').reduce((a, b) {
                          return '${a[0]} ${b[0]}';
                        }),
                        style: Theme.of(context).textTheme.bodyText2.copyWith(
                            color: primaryDark,
                            fontSize: 24.0,
                            fontWeight: FontWeight.w700),
                      ),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: InputField(
              value: userData['name'],
              title: 'Name',
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InputField(
              value: userData['email'],
              title: 'Email',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            child: InputField(
              value: userData['contact'],
              title: 'Contact',
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(bottom: 10.0),
            child: OutlineButton(
              child: Text(
                'Save Changes',
                style: TextStyle(
                    fontSize: 17.0,
                    color: Theme.of(context).colorScheme.primary),
              ),
              onPressed: null,
              // () {
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ChangePassword()));
              // },
              // fontSize: 20.0,
              // fontWeight: FontWeight.w600,
              // height: 50.0,
              // elevation: 0.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          FRaisedButton(
            text: 'Change Password',
            color: textColor,
            bg: Colors.white,
            width: width * 0.50,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            height: 45.0,
            elevation: 0.0,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ResetPage()));
            },
          ),
          FRaisedButton(
            text: 'Deactivate Account',
            color: textColor,
            bg: Colors.white,
            width: width * 0.50,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            height: 45.0,
            elevation: 0.0,
            onPressed: () {
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
          FRaisedButton(
            text: 'Delete Account',
            color: orderBar,
            bg: Colors.white,
            width: width * 0.50,
            fontSize: 15.0,
            fontWeight: FontWeight.w700,
            height: 45.0,
            elevation: 0.0,
            onPressed: () {
              // Navigator.push(context,
              //           MaterialPageRoute(builder: (context) => ChangePassword()));
            },
          ),
        ],
      ),
    );
  }
}
