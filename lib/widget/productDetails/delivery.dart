import 'package:flutter/material.dart';

class PDdelivery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 20.0),
              child: Text(
                'Usually delivered in',
                style:
                    Theme.of(context).textTheme.body1.copyWith(fontSize: 14.0),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 14.0, top: 10.0, bottom: 15.0),
              child: Text(
                '3-4 days',
                style: Theme.of(context)
                    .textTheme
                    .body1
                    .copyWith(fontSize: 16.0, fontWeight: FontWeight.w700),
                textAlign: TextAlign.left,
              ),
            ),
            Divider(
              thickness: 1.0,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "View Details",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontSize: 15.0, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: IconButton(
                      iconSize: 12.0,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey[500],
                        size: 16.0,
                      ),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
