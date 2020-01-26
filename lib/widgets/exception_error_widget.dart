import 'package:flutter/material.dart';

class ExceptionErrorWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onPressed;

  const ExceptionErrorWidget({Key key, @required this.title, @required this.iconData, @required this.onPressed}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 12,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(this.title, textAlign: TextAlign.center,),
            SizedBox(height: 5),
            Icon(this.iconData),
            SizedBox(height: 10,),
            RaisedButton(
              child: Text("Try again"),
              onPressed: onPressed,
            ),
          ],
        ),
      ),
    );
  }
}