// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vtranslate/components/chooselang.dart';
import 'package:vtranslate/components/translateinput.dart';
import 'package:vtranslate/models/lang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final sourceLang = Lang('English', 'en', true);
  final outputLang = Lang('Hindi', 'hi', true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("vTranslate"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
            color: Color.fromARGB(255, 230, 229, 229),
            elevation: 5.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ChooseLangWidget(language: sourceLang.name),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.compare_arrows,
                      color: Colors.blue[600],
                    )),
                ChooseLangWidget(language: outputLang.name)
              ],
            ),
          ),
          TranslateInput()
        ],
      ),
    );
  }
}
