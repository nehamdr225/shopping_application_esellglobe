import 'package:esell/state/state.dart';
import 'package:flutter/material.dart';

class PDcomments extends StatelessWidget {
  final String rating, commentTitle, comment, name, likes, dislikes, time;
  PDcomments(
      {this.rating: '3.9',
      this.commentTitle: 'Delightful',
      this.comment: 'The product is very nice',
      this.name: 'Mishra',
      this.likes: '2K',
      this.dislikes: '240',
      this.time: '9 months'});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0.0),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Divider(),
            Padding( // rating chip and comment title
                padding:
                    const EdgeInsets.only(left: 10.0, bottom: 4.0, top: 8.0),
                child: Row( // rating chip
                  children: <Widget>[
                    Container(
                      width: 58.0,
                      height: 40.0,
                      child: Chip(
                        backgroundColor: Colors.green,
                        label: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              rating,
                              style: Theme.of(context).textTheme.body1.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 11.0,
                                  ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(2.0),
                            ),
                            Icon(
                              Icons.star,
                              size: 12.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding( // comment title by user
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        commentTitle,
                        style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              color: textColor,
                              fontSize: 14.0,
                            ),
                      ),
                    ),
                  ],
                )),
            Padding( // comment of user
              padding: const EdgeInsets.only(top: 8.0, left: 12.0),
              child: Text(
                comment,
                style: Theme.of(context).textTheme.body1.copyWith(
                      fontWeight: FontWeight.w400,
                      color: textColor,
                      fontSize: 14.0,
                    ),
              ),
            ),
            Padding( // photos uploaded by user
              padding: const EdgeInsets.only(top: 8.0, left: 12.0),
              child: Row(
                children: <Widget>[
                  Image.asset(
                    'images/esell photo/3brown.jpg',
                    height: 100.0,
                    width: 100.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                  ),
                  Image.asset(
                    'images/esell photo/3brown.jpg',
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),
            Row(
              // name of commenter and like dislike button
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Text(
                    name,
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[500],
                          fontSize: 14.0,
                        ),
                  ),
                ),
                Padding( // like dislike buttons
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.thumb_up,
                              color: Colors.grey[500],
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            likes,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500],
                                  fontSize: 12.0,
                                ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.thumb_down,
                              color: Colors.grey[500],
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                          Text(
                            dislikes,
                            style: Theme.of(context).textTheme.body1.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[500],
                                  fontSize: 12.0,
                                ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.more_vert,
                              color: Colors.grey[500],
                              size: 18,
                            ),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ))
              ],
            ),
            Padding( // certified or not if certified time is the variable
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check_circle,
                    color: Colors.grey[500],
                    size: 14.0,
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  Text(
                    'Certified Buyer . $time ago',
                    style: Theme.of(context).textTheme.body1.copyWith(
                          fontWeight: FontWeight.w400,
                          color: Colors.grey[500],
                          fontSize: 12.0,
                        ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
