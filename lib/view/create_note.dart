import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/controller/firestore_service.dart';
import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:firebase_auth_sample/view/widgets/textfeld.dart';
import 'package:flutter/material.dart';

class CreateNote extends StatelessWidget {
  CreateNote({Key? key, required this.user}) : super(key: key);
  User user;

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _discrtiptionController = TextEditingController();
  final GlobalKey<FormState> _fomkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final width10 = SizedBox(width: width * .06);
    final height10 = SizedBox(height: height * .02);
    final height20 = SizedBox(height: height * .05);
    return Scaffold(
      backgroundColor: blackLight,
      appBar: AppBar(
        backgroundColor: blackLight,
        elevation: 0,
        title: Text(
          "Add Notes",
          style: headlilne,
        ),
        actions: [
          IconButton(
            onPressed: () async {
            bool isValid = _fomkey.currentState!.validate();
                      if (isValid) {
                await FirestoreService().insertNote(_titleController.text,
                    _discrtiptionController.text, user.uid);
               Navigator.pop(context);
               print("pop work");
              } 
            },
            icon: Icon(
              Icons.check,
              color: white,
            ),
          ),
        ],
      ),
      body: Form(
        key: _fomkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Ttitle",
              style: sublilne,
            ),
            height10,
            TextForm(
                textinputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "note min 1 letter";
                  } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                },
                controller: _titleController,
                icons: Icons.text_fields,
                title: "title",
                maxline: 1),
            height20,
            Text(
              "discription",
              style: sublilne,
            ),
            height10,
            TextForm(
                textinputType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "note min 1 letter";
                  } else if(!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
                    return "Enter a valid email";
                  } else {
                    return null;
                  }
                },
                controller: _discrtiptionController,
                icons: Icons.text_fields,
                title: "title",
                maxline: 15),
          ],
        ),
      ),
    );
  }
}
