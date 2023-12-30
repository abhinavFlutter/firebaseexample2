import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class textSpeech extends StatefulWidget {
  const textSpeech({super.key});

  @override
  State<textSpeech> createState() => _textSpeechState();
}

class _textSpeechState extends State<textSpeech> {



  var speakController=TextEditingController();
  // object creation
  FlutterTts tts = FlutterTts();

  Future<void> _speak(String text)async {
    await tts.speak(text);
    await tts.setSpeechRate(2.0);
    // await tts.setLanguage("ko");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
controller: speakController,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(onPressed: () {
              setState(() {
                print(speakController.text);
                _speak(speakController.text);


              });


            }, child: Text("Speak")),
          )
        ],
      )
    );
  }


  }

