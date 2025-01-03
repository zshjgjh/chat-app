import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../constants.dart';

class PasswordCustomTextFormField extends StatefulWidget {

  PasswordCustomTextFormField ({this.hintText,this.onChanged,this.obsecure=true});
  String? hintText;
  Function(String)? onChanged;
  bool obsecure;

  @override
  State<PasswordCustomTextFormField> createState() => _PasswordCustomTextFormFieldState();
}

class _PasswordCustomTextFormFieldState extends State<PasswordCustomTextFormField> {
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      obscureText: widget.obsecure,
      validator: (value){
        if(value!.isEmpty){
          return 'field is required';

        }
      },
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffix: IconButton(onPressed: () {
           if (widget.obsecure==true){
             widget.obsecure=false;
           }else{
             widget.obsecure=true;
           }
           setState(() {

           });
        },
          icon: Icon(Icons.remove_red_eye_rounded),
          color: Colors.black,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
          fontSize: 12,
        ),
        border:const OutlineInputBorder(
          borderSide: BorderSide(
              color: Colors.white
          ),
        ) ,

      ),
    );
  }
}