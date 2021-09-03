import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tree_campus/Screens/Courses.dart';
import 'package:tree_campus/Screens/HomePage.dart';
import 'package:tree_campus/Screens/LiveClasses.dart';
import 'package:tree_campus/Screens/games.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _currentpage = 0;
  final controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentpage,
        animationDuration: Duration(milliseconds: 500),
        height: 55,
        color: Color(0xffFE834A),
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.home_filled, size: 30, color: Colors.white),
          Icon(Icons.book_rounded, size: 30, color: Colors.white),
          Icon(Icons.games_rounded, size: 30, color: Colors.white),
          Icon(Icons.video_call_rounded, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          controller.animateToPage(index,
              duration: Duration(milliseconds: 500), curve: Curves.ease);
          setState(() {
            _currentpage = index;
          });
          print(_currentpage);
        },
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (page) {
          setState(() {
            _currentpage = page;
          });
        },
        children: [
          HomePage(),
          Courses(),
          Games(),
          LiveClasses(),
        ],
      ),
    );
  }
}
