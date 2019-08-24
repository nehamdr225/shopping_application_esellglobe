import 'package:flutter/material.dart';
import 'package:EsellGlobe/widget/atoms/ImageHolder.dart';

class SubCatProducts extends StatelessWidget {
  final String text;
  final image;
  SubCatProducts({this.text, this.image});
  @override
  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            height: 140.0,
            width: 150.0,
            child: Material(
                borderRadius: BorderRadius.circular(12.0),
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => HeroDetails(id: "id")));
                    },
                    child:
                        Stack(alignment: Alignment.center, children: <Widget>[
                      ImageHolder(image: image),
                      Container(
                        // color: Colors.black38,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.black38),
                      ),
                      Text(text,
                          style: TextStyle(
                              fontFamily: 'Ropa Sans',
                              fontSize: 16.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold))
                    ])))));
  }
}
