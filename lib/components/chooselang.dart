import 'package:flutter/material.dart';
import 'package:vtranslate/screens/language-pages.dart';

class ChooseLangWidget extends StatefulWidget {
  const ChooseLangWidget(
      {Key? key, required this.language, required this.title})
      : super(key: key);

  final String language;
  final String title;

  @override
  State<ChooseLangWidget> createState() => ChooseLangWidgetState();
}

class ChooseLangWidgetState extends State<ChooseLangWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LangPage(title: this.widget.title)));
      },
      child: Padding(
        padding: const EdgeInsets.only(
            left: 16.0, right: 16.0, top: 8.0, bottom: 8.0),
        child: Text(
          this.widget.language,
          style: TextStyle(color: Colors.blue[600]),
        ),
      ),
    );
  }
}
