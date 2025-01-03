import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomTextFormField extends StatelessWidget {

  CustomTextFormField ({this.hintText,this.onChanged});
  String? hintText;
  Function(String)? onChanged;


  @override
  Widget build(BuildContext context) {
    return  TextFormField(

      validator: (value){
        if(value!.isEmpty){
          return 'field is required';

        }
      },
      onChanged: onChanged,
      decoration: InputDecoration(
          hintText: hintText,
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