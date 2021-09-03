import 'package:flutter/material.dart';
import 'package:tree_campus/Games/conversation%20game/convType.dart';
import 'package:tree_campus/constants/constants.dart';

class LevelSelection extends StatelessWidget {
  const LevelSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcolor,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => ConversationType()));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Container(
                    height: 50,
                    width: 180,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Beginner',
                      style: TextStyle(
                        color: kcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  content: Text('Please select Beginner level'),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Container(
                    height: 50,
                    width: 180,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Intermediate',
                      style: TextStyle(
                        color: kcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  content: Text('Please select Beginner level'),
                ));
              },
              child: Padding(
                padding: const EdgeInsets.fromLTRB(100, 10, 0, 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20)),
                  child: Container(
                    height: 50,
                    width: 180,
                    color: Colors.white,
                    child: Center(
                        child: Text(
                      'Expert',
                      style: TextStyle(
                        color: kcolor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
