 import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:flutter/material.dart';
 
 showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              height: 300.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: Theme.of(context).colorScheme.primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }