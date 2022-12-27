import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechAPI {
  static final _speech = SpeechToText();

  static Future<bool> toggleRecording({
    required Function(String text) onResult,
  }) async {
    final isAvailable = await _speech.initialize();

    if (isAvailable) {
      _speech.listen(onResult: (value) => onResult(value.recognizedWords));
    }

    return isAvailable;
  }
}
