import 'package:flutter/material.dart';

class ActionButton extends StatefulWidget {
  const ActionButton(
      {Key? key, required this.icon, required this.text, required this.onPress})
      : super(key: key);

  final IconData icon;
  final String text;
  final Function onPress;

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: TextButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
                EdgeInsets.symmetric(vertical: 2.0, horizontal: 8.0))),
        onPressed: () {},
        child: Column(
          children: <Widget>[
            Icon(
              this.widget.icon,
              size: 23.0,
              color: Colors.blue[800],
            ),
            Text(
              this.widget.text,
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
