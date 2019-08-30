// import 'package:EsellGlobe/widget/atoms/Details.dart';
// import 'package:EsellGlobe/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
//import '../store/ProductModel.dart';

class SubCategory extends StatelessWidget {
  final String cap;
  final src;
  SubCategory({this.cap, this.src});
  @override
  Widget build(BuildContext context) {
    //var product = Provider.of<ProductModel>(context);
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Container(
        width: 150,
        height: 202.0,
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(
              //     builder: (context) => ProductDetails(id: id)));
            },
            child: Stack(
              children: <Widget>[
                Image.asset(src),
                // Container(
                //   color: Colors.black45,
                //   decoration: BoxDecoration(
                //     borderRadius:
                //   )
                // )
                //Divider(height: 1),
                // Details(
                //   name: cap,
                //   price: ''
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
