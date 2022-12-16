import 'package:vtranslate/models/lang.dart';

class CurrentLanguages {
  static Lang sourceLang = Lang('English', 'en', false);
  static Lang outputLang = Lang('French', 'fr', false);

  static void setLanguage(bool source, Lang value) {
    if (source == true) {
      sourceLang = value;
    } else {
      outputLang = value;
    }
  }
}
