
import 'package:firebaseexample2/screen1.dart';
import 'package:firebaseexample2/sopeechText.dart';
import 'package:firebaseexample2/textSpeech.dart';
import 'package:flutter/material.dart';

import 'form.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home:speechText()
    );
  }
}
