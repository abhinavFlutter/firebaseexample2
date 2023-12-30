import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart';
class speechText extends StatefulWidget {
  const speechText({super.key});

  @override
  State<speechText> createState() => _speechTextState();
}

class _speechTextState extends State<speechText> {

SpeechToText stt=SpeechToText();
String _text = "hello";

void _listen() async {
  if (await stt.initialize()) {
    stt.listen(
      onResult: (result) {
        setState(() {
          _text = result.recognizedWords;
        });
      },
    );
  } else {
    print('Speech recognition not available');
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_text),
          TextButton(onPressed: () {
          _listen();

          }, child: Text("Press"))
        ],
      ),

    );
  }
}
