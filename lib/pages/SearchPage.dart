import 'package:esell/state/state.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
//import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  final searchController;
  SearchPage({Key key, this.searchController}) : super(key: key);

  _SearchPageState createState() => _SearchPageState(
    
  );
}

class _SearchPageState extends State<SearchPage> {
  List searchResult = [];
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).colorScheme.primaryVariant);
    //final merchants = Provider.of<MerchantsModel>(context).merchants;

    //void search(String query) {
      // List result = [];
      // if (query.length > 0)
      //   result = merchants.where((merchant) {
      //     return merchant["name"].toLowerCase().contains(query.toLowerCase()) ||
      //         merchant["address"].toLowerCase().contains(query.toLowerCase()) ||
      //         merchant["category"].toLowerCase().contains(query.toLowerCase());
      //   }).toList();
      // if (result != null)
      //   setState(() {
      //     searchResult = result;
      //   });
   // }

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
              elevation: 0.0,
              iconTheme: IconThemeData(color: iconthemelight),
              backgroundColor: Theme.of(context).colorScheme.primary,
              title: TextField(
                autofocus: true,
                onChanged: (value) {
                  widget.searchController(value);
                },
                style: TextStyle(color: Colors.black),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    hintText: "Search for Fashion!",
                    hintStyle: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 12,
                        color: Colors.black54),
                    // labelStyle: ,
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent))),
              )),
        ),
        body: Container(
            color: Theme.of(context).colorScheme.background,
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              children: searchResult.length > 0
                  ? searchResult.map((result) {
                      return ListTile(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           DetailPage(id: result["_id"])),
                            // );
                          },
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.help_outline,
                              size: 22,
                              color: Colors.white,
                            ),
                            radius: 12.0,
                            backgroundColor:
                                Theme.of(context).colorScheme.primary,
                          ),
                          trailing: Icon(Icons.arrow_forward_ios, size: 14),
                          title: Text(
                            result["name"],
                            style: TextStyle(
                                color: textColor, fontFamily: "Helvetica"),
                          ),
                          subtitle: Text(
                            result["address"],
                            style: TextStyle(
                                color: textColor, fontFamily: "Helvetica"),
                          ));
                    }).toList()
                  : [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Did not find any matches!",
                            style: TextStyle(
                                color: textColor, fontFamily: "Helvetica"),
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                    ],
            )));
  }
}
