import 'package:brew_crew/models/myuser.dart';
import 'package:brew_crew/screens/wrapper.dart';
import 'package:brew_crew/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
/*All Firebase versions have been updated and now you have to call Firebase.initializeApp()
 before using any Firebase product and all Firebase products now depend on firebase_core. 
 So follow these steps:
 1. Add firebase_core : ^0.5.0 in the pubspec.yaml file
 2. And initialize it in your main() method:
 3. Add 2 line 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  */
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser?>.value(
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
