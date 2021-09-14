import 'package:flutter/material.dart';

class DropDownWidget extends StatefulWidget {

  String dropDownValue;
  List<String> listItens;

  DropDownWidget({Key? key, required this.dropDownValue, required this.listItens}) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState(this.dropDownValue, this.listItens);
}

class _DropDownWidgetState extends State<DropDownWidget> {

  String dropdownValue;
  List<String> listItens;

  _DropDownWidgetState(this.dropdownValue, this.listItens);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      isExpanded: true,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: listItens
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
