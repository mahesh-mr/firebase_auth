import 'package:firebase_auth_sample/controller/authservice.dart';
import 'package:firebase_auth_sample/view/home_screen.dart';
import 'package:firebase_auth_sample/view/register.dart';
import 'package:firebase_auth_sample/view/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
     
        primarySwatch: Colors.blue,
      ),
     home:StreamBuilder(
      stream: AuthService().firebaseauth.authStateChanges(),
      builder: (conterxt,AsyncSnapshot snapshot){
        if (snapshot.hasData) {
return HomeScreen() ;         
        }else{
          return  LoginScreen();
        }
      })
     
     
    
    );
  }
}
