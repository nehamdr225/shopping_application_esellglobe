import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Category.dart';
import 'package:esell/widget/molecules/TopBrands.dart';
import 'package:flutter/material.dart';

// class FSlider extends StatelessWidget {
//   final text;
//   final products;
//   final type;
//   FSlider({this.products, this.text, this.type});
// //
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildListDelegate(
//         <Widget>[
//           // Padding(
//           //   padding: EdgeInsets.all(10.0),
//           //   child: Text(text, style: Theme.of(context).textTheme.title),
//           // ),
//           // type == "Category"?
//           HorizontalList()
//           // Specialoffers(),
//         ],
//       ),
//     );
//   }
// }

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Category(
              name: MAIN[index]['name'],
              caption: MAIN[index]['cap'],
              src: MAIN[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}

class Consts extends StatefulWidget {
  final List cap;
  final List src;
  Consts({Key key, this.cap, this.src}) : super(key: key);
  @override
  _ConstsState createState() => _ConstsState();
}

class _ConstsState extends State<Consts> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Category(
              name: MAIN[index]['name'],
              caption: MAIN[index]['cap'],
              src: MAIN[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}

class Specialoffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100.0,
      // width: 200.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: SpecialOffers(
              src: specialOffers[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}

class Topbrands extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: TopBrands(
              src: topBrands[index]['src'],
            ),
          );
        }, //
      ),
    );
  }
}
