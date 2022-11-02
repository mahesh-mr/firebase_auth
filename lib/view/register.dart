import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/controller/authservice.dart';
import 'package:firebase_auth_sample/view/login_screen.dart';
import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:firebase_auth_sample/view/widgets/login_btn.dart';
import 'package:firebase_auth_sample/view/widgets/textfeld.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final fomkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final width10 = SizedBox(width: width * .06);
    final height10 = SizedBox(height: height * .02);
    final height20 = SizedBox(height: height * .05);

    return Scaffold(backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "REGISTER",
            style: headlilne,
          ),
          height20,
          Form(
              key: fomkey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * .09),
                child: Column(
                  children: [
                    emailForm(),
                    height10,
                    passwordForm(),
                    height10,
                    SubmitButton(
                      title: "Register",
                      onpressed: () async {
                        bool isValid = fomkey.currentState!.validate();
                        if (isValid) {
                          User? result = await AuthService().register(
                              _passwordcontroller.text,
                              _emailcontroller.text,
                              context);

                          print(result);
                          print(result!.email);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ));

                          //   Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                        }
                      },
                    ),
                    height10,
                    RichText(
                      text: TextSpan(
                          text: 'Don\'t have an account?',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Login',
                                style: TextStyle(color: blue, fontSize: 18),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (contex) => LoginScreen(),
                                      ),
                                    );
                                  })
                          ]),
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }

  TextForm passwordForm() {
    return TextForm(
        textinputType: TextInputType.text,
        validator: (value) {
          if (value!.isEmpty) {
            return "Password minimum  1 length";
          } else if (!RegExp(r'(^[a-z A-Z]+$)').hasMatch(value)) {
            return 'valid Passsworsd';
          } else {
            return null;
          }
        },
        controller: _passwordcontroller,
        icons: Icons.lock,
        title: "Password",
        maxline: 1);
  }

  TextForm emailForm() {
    return TextForm(
        textinputType: TextInputType.text,
        validator: (value) {
          if (value == null) {
            return "Required Field";
          } else if (!RegExp(
                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
              .hasMatch(value)) {
            return "Enter a valid email";
          } else {
            return null;
          }
        },
        controller: _emailcontroller,
        icons: Icons.email,
        title: "Email",
        maxline: 1);
  }
}
