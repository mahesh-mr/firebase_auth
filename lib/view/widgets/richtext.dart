import 'dart:ffi';

import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichtextWidgets extends StatelessWidget {
   RichtextWidgets({required this.ontap,required this.text,
    Key? key,
  }) : super(key: key);
  VoidCallback ontap;
  String text; 

  @override
  Widget build(BuildContext context) {
    return RichText(
         text: TextSpan(
             text: text,
             style: const TextStyle(
                 color: Colors.white, fontSize: 18),
             children: <TextSpan>[
               TextSpan(
                
                   text: text,
                   style: TextStyle(color: blue, fontSize: 18),
                   recognizer: TapGestureRecognizer()
                     ..onTap =ontap,
                    
                     )
             ]),
       );
  }
}
