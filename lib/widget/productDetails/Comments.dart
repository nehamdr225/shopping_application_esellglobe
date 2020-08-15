import 'package:flutter/material.dart';

class PDcomments extends StatelessWidget {
  final String rating, commentTitle, comment, name, likes, dislikes, time;
  PDcomments(
      {this.rating: '3.9',
      this.commentTitle: 'Delightful',
      this.comment: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
      this.name: 'John Doe',
      this.likes: '2K',
      this.dislikes: '240',
      this.time: '2h ago'});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Comments",
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline3),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: Row(
            children: [
              CircleAvatar(
                minRadius: 25.0,
                backgroundImage: AssetImage("images/esell photo/Ellipse11.png"),
                //child: Image.asset("images/esell_photo/Ellipse11.png"),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.headline6.copyWith(fontWeight:FontWeight.w700)),
                  Text(time,
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(fontSize: 11.0, fontWeight: FontWeight.w500),
                          textAlign: TextAlign.start,
                          ),
                ],
              )
            ],
          ),
        ),
        Text(comment ?? '',
            textAlign: TextAlign.start,
            overflow: TextOverflow.visible,
            style: Theme.of(context).textTheme.caption),
      ],
    );
  }
}
