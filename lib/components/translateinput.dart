import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:vtranslate/helper/currentLang.dart';

class TranslateInput extends StatefulWidget {
  const TranslateInput({super.key});

  @override
  State<TranslateInput> createState() => _TranslateInputState();
}

class _TranslateInputState extends State<TranslateInput> {
  final TextEditingController _iptTextEditingController =
      TextEditingController();
  final TextEditingController _optTextEditingController =
      TextEditingController();

  String translatedText = "";
  GoogleTranslator translator = new GoogleTranslator();

  _onTextChanged(String text) {
    if (text != "") {
      translator
          .translate(text,
              from: CurrentLanguages.sourceLang.value.code,
              to: CurrentLanguages.outputLang.value.code)
          .then((translatedText) {
        setState(() {
          _optTextEditingController.text = translatedText.text;
        });
      });
    } else {
      setState(() {
        _optTextEditingController.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Card(
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: TextField(
                  maxLines: null,
                  controller: _iptTextEditingController,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  decoration: InputDecoration(hintText: "Enter text"),
                  onChanged: _onTextChanged,
                ),
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.16,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                child: TextField(
                  maxLines: null,
                  controller: _optTextEditingController,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  enabled: false,
                  decoration: InputDecoration(
                    hintText: "Translation",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
