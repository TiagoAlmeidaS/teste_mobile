import 'package:flutter/material.dart';
import 'package:teste_mobile/core/app_gradients.dart';

class ButtonAssentosWidget extends StatefulWidget {

  int index;
  bool isChecked = false;
  Function() onPressed;


  ButtonAssentosWidget({required this.index, required this.isChecked, required this.onPressed});

  @override
  _ButtonAssentosWidgetState createState() => _ButtonAssentosWidgetState();
}

class _ButtonAssentosWidgetState extends State<ButtonAssentosWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ElevatedButton(
            onPressed: widget.onPressed, child: Container(
            decoration: BoxDecoration(
                gradient: AppGradients.linear
            ),
            child: Text(widget.index.toString(),
                style: TextStyle(fontSize: 14, color: Colors.white))))
    );
  }
}
