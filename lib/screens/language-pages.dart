import 'package:flutter/material.dart';
import 'package:vtranslate/components/lang-list-element.dart';
import 'package:vtranslate/models/lang.dart';
import 'package:vtranslate/helper/currentLang.dart';
import 'package:vtranslate/screens/home-page.dart';

class LangPage extends StatefulWidget {
  const LangPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<LangPage> createState() => _LangPageState();
}

class _LangPageState extends State<LangPage> {
  final List<Lang> _langList = [
    Lang('Afrikaans', 'af', false),
    Lang('Arabic', 'ar', false),
    Lang('Belarusian', 'be', false),
    Lang('Bulgarian', 'bg', false),
    Lang('Bengali', 'bn', false),
    Lang('Catalan', 'ca', false),
    Lang('Czech', 'cs', false),
    Lang('Welsh', 'cy', false),
    Lang('Danish', 'da', false),
    Lang('German', 'de', false),
    Lang('Greek', 'el', false),
    Lang('English', 'en', false),
    Lang('Esperanto', 'eo', false),
    Lang('Spanish', 'es', false),
    Lang('Estonian', 'et', false),
    Lang('Persian', 'fa', false),
    Lang('Finnish', 'fi', false),
    Lang('French', 'fr', false),
    Lang('Irish', 'ga', false),
    Lang('Galician', 'ga', false),
    Lang('Gujarati', 'gu', false),
    Lang('Hebrew', 'he', false),
    Lang('Hindi', 'hi', false),
    Lang('Croatian', 'hr', false),
    Lang('Haitian', 'ht', false),
    Lang('Hungarian', 'hu', false),
    Lang('Indonesian', 'id', false),
    Lang('Icelandic', 'is', false),
    Lang('Italian', 'it', false),
    Lang('Japanese', 'ja', false),
    Lang('Georgian', 'ka', false),
    Lang('Kannada', 'kn', false),
    Lang('Korean', 'ko', false),
    Lang('Lithuanian', 'lt', false),
    Lang('Latvian', 'lv', false),
    Lang('Macedonian', 'mk', false),
    Lang('Marathi', 'mr', false),
    Lang('Malay', 'ms', false),
    Lang('Maltese', 'mt', false),
    Lang('Dutch', 'nl', false),
    Lang('Norwegian', 'no', false),
    Lang('Polish', 'pl', false),
    Lang('Portuguese', 'pt', false),
    Lang('Romanian', 'ro', false),
    Lang('Russian', 'ru', false),
    Lang('Slovak', 'sk', false),
    Lang('Slovenian', 'sl', false),
    Lang('Albanian', 'sq', false),
    Lang('Swedish', 'sv', false),
    Lang('Swahili', 'sw', false),
    Lang('Tamil', 'ta', false),
    Lang('Telugu', 'te', false),
    Lang('Thai', 'th', false),
    Lang('Tagalog', 'tl', false),
    Lang('Turkish', 'tr', false),
    Lang('Ukranian', 'uk', false),
    Lang('Urdu', 'ur', false),
    Lang('Vietnamese', 'vi', false),
    Lang('Chinese', 'zh', false),
  ];

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
    print(CurrentLanguages().sourceLang.value.name);
    print(CurrentLanguages().outputLang.value.name);
    // print(CurrentLanguages.sourceLang.name);
    // print(CurrentLanguages.outputLang.name);
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
        itemCount: _langList.length,
        itemBuilder: (BuildContext context, int index) {
          return LangListElement(
              language: _langList[index], onSelect: _sendBackLanguage);
        },
      ),
    );
  }
}
