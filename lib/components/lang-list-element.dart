import 'package:flutter/material.dart';
import 'package:vtranslate/models/lang.dart';

class LangListElement extends StatefulWidget {
  const LangListElement(
      {Key? key, required this.language, required this.onSelect})
      : super(key: key);

  final Lang language;
  final Function(Lang) onSelect;

  @override
  State<LangListElement> createState() => _LangListElementState();
}

class _LangListElementState extends State<LangListElement> {
  Widget _displayTrailingIcon() {
    if (this.widget.language.isDownloaded) {
      return Icon(Icons.check_circle);
    } else {
      return SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(this.widget.language.name),
      trailing: this._displayTrailingIcon(),
      onTap: () {
        this.widget.onSelect(this.widget.language);
      },
    );
  }
}
