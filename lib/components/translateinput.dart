import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
import 'package:vtranslate/helper/currentLang.dart';

class TranslateInput extends StatefulWidget {
  const TranslateInput({super.key});

  @override
  State<TranslateInput> createState() => TranslateInputState();
}

class TranslateInputState extends State<TranslateInput> {
  static TextEditingController iptTextEditingController =
      TextEditingController();
  static final TextEditingController optTextEditingController =
      TextEditingController();

  updateOptForVoiceTranslation(String text) {
    setState(() {
      optTextEditingController.text = text;
    });
  }

  String translatedText = "";
  GoogleTranslator translator = new GoogleTranslator();

  void update(String text) {
    setState(() {
      iptTextEditingController.text = text;
    });
  }

  onTextChanged(String text) {
    if (text != "") {
      translator
          .translate(text,
              from: CurrentLanguages.sourceLang.value.code,
              to: CurrentLanguages.outputLang.value.code)
          .then((translatedText) {
        setState(() {
          optTextEditingController.text = translatedText.text;
        });
      });
    } else {
      setState(() {
        optTextEditingController.text = "";
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
                  controller: iptTextEditingController,
                  keyboardType: TextInputType.multiline,
                  expands: true,
                  decoration: InputDecoration(hintText: "Enter text"),
                  onChanged: onTextChanged,
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
                  controller: optTextEditingController,
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

class TextEditorFunctions {
  static void UpdateTranslation(String textToUpdate) async {
    TranslateInputState.iptTextEditingController.text = textToUpdate;
    await GoogleTranslator()
        .translate(TranslateInputState.iptTextEditingController.text,
            from: CurrentLanguages.sourceLang.value.code,
            to: CurrentLanguages.outputLang.value.code)
        .then((value) =>
            TranslateInputState().updateOptForVoiceTranslation(value.text));
  }
}
