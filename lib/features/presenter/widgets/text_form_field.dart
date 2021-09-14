import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatefulWidget {
  TextEditingController controller;
  TextInputType keyBoardType;
  String titleText;
  String exampleText;
  String? Function(String?)? validation;

  TextFormFieldWidget(this.controller, this.keyBoardType, this.titleText,
      this.exampleText, this.validation)
      : super();

  @override
  _TextFormFieldWidgetState createState() => _TextFormFieldWidgetState(
      this.controller,
      this.keyBoardType,
      this.titleText,
      this.exampleText,
      this.validation);
}

class _TextFormFieldWidgetState extends State<TextFormFieldWidget> {
  TextEditingController controller;
  TextInputType keyBoardType;
  String titleText;
  String exampleText;
  String? Function(String?)? validation;

  _TextFormFieldWidgetState(this.controller, this.keyBoardType, this.titleText,
      this.exampleText, this.validation);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: controller,
        validator: validation,
        keyboardType: keyBoardType,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          labelText: titleText,
          filled: true,
          fillColor: Colors.white,
          hintText: exampleText,
        ),
      ),
    );
  }
}
