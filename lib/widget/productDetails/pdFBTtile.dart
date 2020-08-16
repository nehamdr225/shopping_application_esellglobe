import 'package:flutter/material.dart';

class FBTtile extends StatelessWidget {
  final image;
  final name;
  final price;
  FBTtile({this.image, this.name, this.price});
  @override
  Widget build(BuildContext context) {
    final imagesrc = "https://api.shop2more.com" + image;
    return Padding(
      padding: const EdgeInsets.only(right:8.0, top: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 170.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.0),
          border: Border.all(
            color: Color(0xffA1A1A1),
            width: 0.1
          )
        ),
        child: Material(
          borderRadius: BorderRadius.circular(8.0),
          child: InkWell(
            onTap: () {},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Center(
                  child: Image.network(
                    imagesrc,
                    fit: BoxFit.contain,
                    width: 80.0,
                    height: 100.0,
                  ),
                ),
                Divider(height: 2),
                Column(
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Text("₹ $price", style: Theme.of(context).textTheme.caption)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
