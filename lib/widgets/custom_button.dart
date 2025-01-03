
import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class CustomButton extends StatelessWidget {
   CustomButton({this.onTap, required this.text}) ;
  final String text;
  final ui.VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        width: double.infinity,
        height: 50,
        child:  Center(
          child: Text(text,
            style:  const TextStyle(
              color: Colors.black,
              fontSize: 24,
            ),),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: Colors.white,
        ),
      ),
    );
  }
}
