import 'package:flutter/material.dart';
import 'package:tree_campus/SIgnin_Signup_section/Signin.dart';
// import 'package:tree_campus/Screens/BottomBar.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Signin(),
      theme: ThemeData(
        fontFamily: 'SF',
        primaryColor: Color(0xffFE834A),
      ),
    ));
