import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registeration/bottomnav.dart';
import 'package:flutter_registeration/profile.dart';

Future signup(
    {required String Username,
    required String email,
    required String password,
    required BuildContext context}) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bottomnav(),
        ));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Registration Succes')));
  } catch (e) {
    print(e);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}

Future<void> login(
    {required String email,
    required String password,
    required BuildContext context}) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfileScreen(),
        ));
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Login Succes')));
  } catch (e) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(e.toString())));
  }
}
