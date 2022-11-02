import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_sample/controller/authservice.dart';
import 'package:firebase_auth_sample/view/home_screen.dart';
import 'package:firebase_auth_sample/view/register.dart';
import 'package:firebase_auth_sample/view/style/style.dart';
import 'package:firebase_auth_sample/view/widgets/login_btn.dart';
import 'package:firebase_auth_sample/view/widgets/textfeld.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_builder.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _fomkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;
    final width10 = SizedBox(width: width * .06);
    final height10 = SizedBox(height: height * .02);
    final height20 = SizedBox(height: height * .05);

    return Scaffold(
      backgroundColor: black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "LOGIN",
            style: headlilne,
          ),
          height20,
          Form(
            key: _fomkey,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .09),
              child: Column(
                children: [
                  emailForm(),
                  height10,
                  passwordForm(),
                  height10,
                  SubmitButton(
                    title: "Login",
                    onpressed: () async {
                      bool isValid = _fomkey.currentState!.validate();
                      if (isValid) {
                        User? result = await AuthService().login(
                            _passwordcontroller.text,
                            _emailcontroller.text,
                            context);
                        print(result);
                        print(result!.email);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  HomeScreen()
                            ));
                        //     Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                      }
                    },
                  ),

                  // SignInButton(
                  //   Buttons.Facebook,
                  //   mini: true,
                  //   onPressed: () {},
                  // ),
                  height10,
                  SignInButton(Buttons.GoogleDark, text: "Continue With Google",
                      onPressed: () async {
               User? result=      await AuthService().signInWithGoogle();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  HomeScreen(),
                        ));
                  }),
                  height10,

                  RichText(
                    text: TextSpan(
                        text: 'Don\'t have an account?',
                        style: const TextStyle(color: white, fontSize: 18),
                        children: <TextSpan>[
                          TextSpan(
                              text: ' Register',
                              style: const TextStyle(color: blue, fontSize: 18),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (contex) => RegisterScreen(),
                                    ),
                                  );
                                  // Get.to(SignUp());
                                  // navigate to desired screen
                                })
                        ]),
                  ),
                ],
              ),
            ),
          ),
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
