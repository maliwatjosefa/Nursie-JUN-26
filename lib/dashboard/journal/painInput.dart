import 'package:flutter/material.dart';

class TextInputWidget extends StatefulWidget {
  final Function(String) callback;

  TextInputWidget(this.callback);

  @override
  _TextInputWidgetState createState() => _TextInputWidgetState();
}

class _TextInputWidgetState extends State<TextInputWidget> {
  final controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  void click() {
    widget.callback(controller.text);
    controller.clear();
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: TextField(
            controller: this.controller,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.medical_services),
              labelText: "Enter your answer here",
              suffixIcon: IconButton(
                icon: Icon(Icons.arrow_downward_rounded),
                splashColor: Colors.blue,
                tooltip: "Enter",
                onPressed: this.click,
              ),
            )));
  }
}
