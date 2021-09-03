import 'package:flutter/material.dart';
import 'package:tree_campus/Games/conversation%20game/conversationGame.dart';
import 'package:tree_campus/constants/constants.dart';

class SelectAvatar extends StatelessWidget {
  const SelectAvatar({Key? key, required this.typename}) : super(key: key);
  final String typename;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kcolor,
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: size.height,
            width: size.width / 2,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [kcolor, Colors.white, kcolor])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/girl.png',
                ),
                SizedBox(height: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) =>
                                ConversationGame(typename: typename)));
                  },
                  color: Colors.green,
                  child: Text(
                    'Rina',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: size.height,
            width: size.width / 2,
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [kcolor, Colors.white, kcolor])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/boy.png',
                  height: 110,
                ),
                SizedBox(height: 20),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: Duration(seconds: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      content: Text('Please select Rinas avatar'),
                    ));
                  },
                  color: Colors.green,
                  child: Text(
                    'Ravi',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
