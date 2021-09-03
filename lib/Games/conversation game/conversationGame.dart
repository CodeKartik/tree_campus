import 'package:avatar_glow/avatar_glow.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:tree_campus/Screens/games.dart';
import 'package:tree_campus/constants/constants.dart';

class UserCommands {
  final String englishCommand;
  final String hindiCommand;

  UserCommands(
    this.englishCommand,
    this.hindiCommand,
  );
}

class ConversationGame extends StatefulWidget {
  const ConversationGame({Key? key, required this.typename}) : super(key: key);
  final String typename;

  @override
  _ConversationGameState createState() => _ConversationGameState();
}

class _ConversationGameState extends State<ConversationGame> {
  late stt.SpeechToText _speechToText;
  bool _isListening = false;
  String _text = "";
  String speakText = '';
  bool isCorrect1 = false;
  bool isCorrect2 = false;
  bool isCorrect3 = false;
  bool isAnswerCorrect = false;
  int score = 0;
  late FlutterTts flutterTts;
  int index = 0;

  List<bool> answers = [false, false, false];

  List<UserCommands> rinasCommands = [
    UserCommands('Thank you', 'धन्यवाद '),
    UserCommands('Please be kind', 'कृपया दयालु बनें '),
    UserCommands('Don\'t shout', 'चिल्लाओ मत '),
  ];

  List<UserCommands> ravisCommands = [
    UserCommands('you are welcome', 'आपका स्वागत है'),
    UserCommands('yes', 'हां'),
    UserCommands('sorry', 'माफ़ करना'),
  ];

  @override
  void initState() {
    super.initState();
    _speechToText = stt.SpeechToText();
    flutterTts = FlutterTts();
  }

  _listen() async {
    if (!_isListening) {
      bool available = await _speechToText.initialize(
        onStatus: (value) => print('onStatus : $value'),
        onError: (value) => print('onError : $value'),
      );

      if (available) {
        setState(() {
          _isListening = true;
        });
        _speechToText.listen(
            onResult: (value) => setState(() {
                  _text = value.recognizedWords;
                  // if (value.hasConfidenceRating && value.confidence > 0) {
                  //   _confidence = value.confidence;
                  // }
                }));
      }
    } else {
      setState(() {
        _isListening = false;
        _speechToText.stop();
      });
    }
  }

  _stopTolisten() {
    setState(() {
      _isListening = false;
      _speechToText.stop();
    });
  }

  speak() async {
    await flutterTts.speak(speakText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                '$score / 3',
                style: TextStyle(
                    color: Colors.lightGreen.shade300,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
          // title: Text('Confidence: ${(_confidence * 100.0).toStringAsFixed(1)}%'),
          title: Text(
            widget.typename,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Visibility(
                      visible: answers[0] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: RinasMessage(
                          rinasCommands: rinasCommands,
                          messageIndex: 0,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: answers[0] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 1000),
                        child: RavisMessage(
                          ravisCommands: ravisCommands,
                          messageIndex: 0,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: answers[1] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: RinasMessage(
                          rinasCommands: rinasCommands,
                          messageIndex: 1,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: answers[1] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 1000),
                        child: RavisMessage(
                          ravisCommands: ravisCommands,
                          messageIndex: 1,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: answers[2] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 500),
                        child: RinasMessage(
                          rinasCommands: rinasCommands,
                          messageIndex: 2,
                        ),
                      ),
                    ),
                    Visibility(
                      visible: answers[2] ? true : false,
                      child: DelayedDisplay(
                        delay: Duration(milliseconds: 1000),
                        child: RavisMessage(
                          ravisCommands: ravisCommands,
                          messageIndex: 2,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )),
            Container(
              height: 200,
              width: Size.infinite.width,
              color: Colors.deepOrangeAccent.shade200,
              child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        " \" ${rinasCommands[index].englishCommand} \"  बोलिये",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      AvatarGlow(
                        animate: _isListening,
                        glowColor: Colors.white,
                        endRadius: 50.0,
                        duration: const Duration(milliseconds: 1000),
                        repeatPauseDuration: const Duration(microseconds: 100),
                        repeat: true,
                        child: GestureDetector(
                          onLongPress: () {
                            _listen();
                          },
                          onLongPressUp: () {
                            _stopTolisten();
                            print('this is a text length :${_text.length}');
                            print('This is text after button release :$_text');

                            if (index == 2) {
                              Future.delayed(Duration(milliseconds: 3000), () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Great Effrorts",
                                          style: TextStyle(
                                            color: Colors.green,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        content: Text(
                                          'Score : $score / 3',
                                          style: TextStyle(
                                            color: Colors.deepPurple.shade900,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        actions: [
                                          MaterialButton(
                                              color: Colors.green,
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (c) =>
                                                            Games()));
                                              },
                                              child: Text(
                                                'Ok',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ))
                                        ],
                                      );
                                    });
                              });
                            }

                            Future.delayed(Duration(milliseconds: 100), () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: _text.toLowerCase() ==
                                              rinasCommands[index]
                                                  .englishCommand
                                                  .toLowerCase()
                                          ? Text(
                                              'Points Scored',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              'Well Tried',
                                              style: TextStyle(
                                                  color: Colors.grey.shade700,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            rinasCommands[index].englishCommand,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5),
                                          Text(
                                            _text,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: _text.toLowerCase() ==
                                                        rinasCommands[index]
                                                            .englishCommand
                                                            .toLowerCase()
                                                    ? Colors.green
                                                    : Colors.red),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        Visibility(
                                            visible: _text.toLowerCase() !=
                                                    rinasCommands[index]
                                                        .englishCommand
                                                        .toLowerCase()
                                                ? true
                                                : false,
                                            child: MaterialButton(
                                                color: kcolor,
                                                onPressed: () {
                                                  setState(() {
                                                    _text = "";
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  'Try again',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ))),
                                        MaterialButton(
                                            color: kcolor,
                                            onPressed: () {
                                              setState(() {
                                                if (_text.toLowerCase() ==
                                                    rinasCommands[index]
                                                        .englishCommand
                                                        .toLowerCase()) {
                                                  score++;
                                                }
                                                _text = "";
                                                answers[index] = true;
                                                speakText = ravisCommands[index]
                                                    .englishCommand;
                                                if (index <
                                                    rinasCommands.length - 1) {
                                                  index++;

                                                  print(
                                                      'This is index from btn $index');
                                                } else {
                                                  print('index overflow');
                                                }
                                              });
                                              Future.delayed(
                                                  Duration(milliseconds: 1000),
                                                  () {
                                                speak();
                                              });
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              'Next',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18,
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                            });
                          },
                          child: Material(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: CircleAvatar(
                              backgroundColor: kcolor,
                              radius: 30,
                              child: Icon(
                                _isListening ? Icons.mic : Icons.mic_none,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Hold to record, release to send.',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ],
                  )),
            ),
          ],
        ));
  }
}

class RavisMessage extends StatelessWidget {
  const RavisMessage({
    Key? key,
    required this.ravisCommands,
    required this.messageIndex,
  }) : super(key: key);

  final List<UserCommands> ravisCommands;
  final int messageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Color(0xffE3F696),
            radius: 30,
            backgroundImage: AssetImage('assets/boy.png'),
          ),
          SizedBox(width: 10),
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)),
            child: Container(
              height: 62.5,
              color: Color(0xffE3F696),
              width: 160,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(ravisCommands[messageIndex].englishCommand),
                    Text(ravisCommands[messageIndex].hindiCommand),
                    // speak(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RinasMessage extends StatelessWidget {
  const RinasMessage({
    Key? key,
    required this.rinasCommands,
    required this.messageIndex,
  }) : super(key: key);

  final List<UserCommands> rinasCommands;
  final int messageIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomLeft: Radius.circular(12)),
            child: Container(
              height: 62.5,
              color: Color(0xffA7DEF5),
              width: 160,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(rinasCommands[messageIndex].englishCommand),
                    Text(rinasCommands[messageIndex].hindiCommand),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/girl.png'),
          ),
        ],
      ),
    );
  }
}
