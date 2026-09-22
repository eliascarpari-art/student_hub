
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ElevateButtonComponent extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color cor;

  //Construtor
  ElevateButtonComponent(
      {required this.label, required this.onPressed, required this.cor});


  @override
  Widget build(BuildContext context) {
    return
      ElevatedButton(
          style:ElevatedButton.styleFrom(backgroundColor: cor),
          onPressed:onPressed,
          child: Text(label)
      );
  }
}