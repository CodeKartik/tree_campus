import 'package:flutter/material.dart';
import 'package:tree_campus/Games/conversation%20game/conversationGame.dart';
import 'package:tree_campus/Games/conversation%20game/level%20selection.dart';

class Games extends StatefulWidget {
  const Games({Key? key}) : super(key: key);

  @override
  _GamesState createState() => _GamesState();
}

class _GamesState extends State<Games> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Games',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFE834A),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: size.height / 3.5,
                width: size.width,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Text(
                        'Bird Saver',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: size.height / 7,
                          width: size.width / 1.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.orange.shade600, Colors.white],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '''Save Bird - Learn English
Play & Win Discount Coupons''',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      right: -5,
                      child: Image.asset(
                        'assets/bird.png',
                        height: 130,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (c) => LevelSelection()));
              },
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Container(
                  height: size.height / 3.5,
                  width: size.width,
                  // color: Colors.amber,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 10,
                        left: 5,
                        child: Text(
                          'Conversation game',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(
                            height: size.height / 7,
                            width: size.width / 1.4,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.blueAccent, Colors.white],
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '''Let's Talk
with your Virtual friend.''',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        // top: -20,
                        right: -5,
                        child: Image.asset(
                          'assets/conversation.png',
                          height: 120,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: size.height / 3.5,
                width: size.width,
                // color: Colors.amber,
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Text(
                        'Lock and Key',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          height: size.height / 7,
                          width: size.width / 1.4,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.pink, Colors.white],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '''Lock & Key
Learn English with fun''',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: -20,
                      right: -5,
                      child: Image.asset(
                        'assets/lock.png',
                        height: 150,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
