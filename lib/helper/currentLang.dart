import 'package:vtranslate/models/lang.dart';

class CurrentLanguages {
  static Lang? sourceLang;
  static Lang? outputLang;

  static void setLanguage(bool source, Lang value) {
    if (source == true) {
      sourceLang = value;
    } else {
      outputLang = value;
    }
  }
}
