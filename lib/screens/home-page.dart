// ignore_for_file: file_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:vtranslate/components/chooselang.dart';
import 'package:vtranslate/components/translateinput.dart';
import 'package:vtranslate/models/lang.dart';
import 'package:vtranslate/screens/language-pages.dart';
import 'package:vtranslate/helper/currentLang.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var sourceLang = CurrentLanguages.sourceLang.value;
  var outputLang = CurrentLanguages.outputLang.value;

  @override
  void initState() {
    CurrentLanguages.sourceLang
        .addListener(() => sourceLang = CurrentLanguages.sourceLang.value);

    CurrentLanguages.outputLang
        .addListener(() => outputLang = CurrentLanguages.outputLang.value);
    super.initState();
  }

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
                ValueListenableBuilder<Lang>(
                  valueListenable: CurrentLanguages.sourceLang,
                  builder: (context, value, child) {
                    return ChooseLangWidget(
                      language: sourceLang.name,
                      title: "Source Language",
                    );
                  },
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.compare_arrows,
                      color: Colors.blue[600],
                    )),
                ValueListenableBuilder<Lang>(
                  valueListenable: CurrentLanguages.outputLang,
                  builder: (context, value, child) {
                    return ChooseLangWidget(
                      language: outputLang.name,
                      title: "Translation Language",
                    );
                  },
                ),
              ],
            ),
          ),
          TranslateInput(),
        ],
      ),
    );
  }
}
