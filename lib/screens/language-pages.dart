// flutter imports
import 'package:flutter/material.dart';

// Language List Elemen
import 'package:vtranslate/components/lang-list-element.dart';

// Models
import 'package:vtranslate/models/lang.dart';

// Global Variables
import 'package:vtranslate/helper/currentLang.dart';
import 'package:vtranslate/helper/allLangs.dart';

class LangPage extends StatefulWidget {
  const LangPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  _sendBackLanguage(Lang returnedLanguage) {
    // if (this.widget.title == "Source Language") {
    //   setState(() {
    //     CurrentLanguages.sourceLang = returnedLanguage;
    //   });
    // } else if (this.widget.title == "Translation Language") {
    //   setState(() {
    //     CurrentLanguages.outputLang = returnedLanguage;
    //   });
    // } else {
    //   throw Error();
    // }

    if (this.widget.title == "Source Language") {
      CurrentLanguages().changeSource(returnedLanguage);
    } else if (this.widget.title == "Translation Language") {
      CurrentLanguages().changeOutput(returnedLanguage);
    } else {
      throw Error();
    }

    Navigator.pop(context);
    print(CurrentLanguages.sourceLang.value.name);
    print(CurrentLanguages.outputLang.value.name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.widget.title),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: AllLanguages.langList.length, //_langList.length,
        itemBuilder: (BuildContext context, int index) {
          return LangListElement(
              language: AllLanguages.langList[index],
              onSelect: _sendBackLanguage);
        },
      ),
    );
  }
}
