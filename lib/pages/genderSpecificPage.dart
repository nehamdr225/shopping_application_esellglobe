import 'package:esell/pages/CategoryPage.dart';
import 'package:esell/state/src/consts.dart';
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/InfoNavBar.dart';
import 'package:esell/widget/molecules/genderGrid.dart';
import 'package:flutter/material.dart';

class GenderSpecific extends StatefulWidget {
  final gender;
  GenderSpecific({this.gender});

  @override
  _GenderSpecificState createState() => _GenderSpecificState();
}

class _GenderSpecificState extends State<GenderSpecific>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: NestedScrollView(
            controller: _scrollViewController,
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  leading: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  expandedHeight: 250.0,
                  floating: true,
                  pinned: true,
                  snap: true,
                  elevation: 1.0,
                  backgroundColor: theme.primary,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: Text("Men's Collection",
                            style: Theme.of(context).textTheme.subtitle1.copyWith(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.white)),
                      ),
                      background: Container(
                        width: size.width,
                        height: 240.0,
                        color: theme.primary,
                        child: Image.asset(
                          "images/esell photo/1black.jpg",
                          fit: BoxFit.cover,
                        ),
                      )),
                ),
                
              ];
            },
            body: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: MEN.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: <Widget>[
                      
                      InfoNavBar(
                        text: MEN[index]['name'],
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => CategoryPage(
                                text: MEN[index]['name'],
                              ),
                            ),
                          );
                        }, 
                      ),
                      Container(
                        padding: EdgeInsets.all(8.0),
                        height: 240.0,
                        child: GenderGrids(
                          gender: widget.gender,
                          crossAxisCount: 3,
                          cat: widget.gender == 'Male'
                              ? MEN[index]['name']
                              : WOMEN[index]['name'],
                        ),
                      ),
                    ],
                  );
                })));
  }
}
