import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_registeration/firebase_options.dart';
import 'package:flutter_registeration/login.dart';
import 'package:flutter_registeration/registeration.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MaterialApp(
      home: Login(),
    ),
  );
}
