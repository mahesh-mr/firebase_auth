import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final FormFieldValidator validator;
  final IconData icons;
  final String title;
  final TextInputType textinputType;
  final int maxline;

  // ignore: prefer_const_constructors_in_immutables
  TextForm(
      {Key? key,
      required this.textinputType,
      required this.validator,
      required this.controller,
      required this.icons,
      required this.title,
      required this.maxline})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxline,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(1),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: white)),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: white),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: red),
          ),
          prefixIcon: Icon(
            icons,
            color: white,
          ),
          label: Text(title),
          fillColor: blackLight,
          focusColor: blackLight,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }
}
