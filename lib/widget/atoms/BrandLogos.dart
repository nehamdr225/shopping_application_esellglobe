import 'package:flutter/material.dart';

class BrandLogos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //1
      width: 200.0,
      height: 40.0,
      child: FloatingActionButton(
        child: const Text(
          'eSell Globe',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Ropa Sans',
            fontSize: 32.0,
          ),
        ),
        shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(7.0)),
        ),
        onPressed: () {},
      ),
    );
  }
}
