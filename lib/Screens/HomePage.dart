import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Home screen will come here.',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 25, color: Colors.grey),
        ),
      ),
    );
  }
}
