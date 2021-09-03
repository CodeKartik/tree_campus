import 'package:flutter/material.dart';
import 'package:tree_campus/Games/conversation%20game/select%20avatar.dart';
import 'package:tree_campus/constants/constants.dart';

class ConversationType extends StatelessWidget {
  const ConversationType({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kcolor,
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (c) => SelectAvatar(
                              typename: 'Good Manners',
                            )));
              },
              minWidth: size.width,
              height: 50,
              child: Text('Good Manners'),
            ),
            SizedBox(height: 20),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.white,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                  ),
                  content: Text('Please select Good Manners'),
                ));
              },
              minWidth: size.width,
              height: 50,
              child: Text('out of home'),
            ),
          ],
        ),
      ),
    );
  }
}
