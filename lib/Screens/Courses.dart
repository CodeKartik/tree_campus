import 'package:flutter/material.dart';
import 'package:tree_campus/Screens/LessonScreen.dart';
import 'package:tree_campus/Screens/VideoCourseScreen.dart';

class Courses extends StatefulWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  _CoursesState createState() => _CoursesState();
}

class _CoursesState extends State<Courses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: GestureDetector(
                    onTap: () {},
                    child: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 20,
                      color: Colors.grey.shade800,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Spoken English',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Tree Campus',
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade600),
                ),
                SizedBox(height: size.height / 24),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Container(
                    height: size.height / 6,
                    color: Color(0xffFE834A),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TopcontainerTitleColumns(
                          icon1: Icon(
                            Icons.article_outlined,
                            color: Colors.white,
                          ),
                          title1: ' 78 Lessons',
                          icon2: Icon(
                            Icons.alarm_rounded,
                            color: Colors.white,
                          ),
                          title2: ' 12 Weeks',
                        ),
                        SizedBox(width: 35),
                        TopcontainerTitleColumns(
                          icon1: Icon(
                            Icons.school_rounded,
                            color: Colors.white,
                          ),
                          title1: ' 10 Students',
                          icon2: Icon(
                            Icons.quiz_outlined,
                            color: Colors.white,
                          ),
                          title2: ' 5 Quiz',
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: size.height / 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '''Introduction &
Greetings''',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        height: size.height / 20,
                        width: size.width / 2.5,
                        color: Color(0xffCFE4F9),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.watch_later_outlined,
                              color: Colors.blueAccent.shade200,
                            ),
                            SizedBox(width: 10),
                            Text(
                              '3 hours, 20 min',
                              style: TextStyle(
                                  color: Colors.blueAccent.shade200,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: size.height / 25),
                CustomTile(
                  size: size,
                  bgColor: Color(0xffFE834A),
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 32.5,
                  ),
                  title: Text(
                    'Introduction',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    'Introduction of the course',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  ontap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => VideoCourse()));
                  },
                ),
                SizedBox(height: size.height / 25),
                CustomTile(
                  size: size,
                  bgColor: Color(0xffCFE4F9),
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xffFE834A),
                    size: 32.5,
                  ),
                  title: Text(
                    'Greeting Part 1',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    'How to greet when you meet',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  ontap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LessonScreen()));
                  },
                ),
                SizedBox(height: size.height / 25),
                CustomTile(
                  size: size,
                  bgColor: Color(0xffCFE4F9),
                  icon: Icon(
                    Icons.play_arrow_rounded,
                    color: Color(0xffFE834A),
                    size: 32.5,
                  ),
                  title: Text(
                    'Word of the Day',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    'Learn new word every day',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  ontap: () {},
                ),
                SizedBox(height: size.height / 25),
                CustomTile(
                  size: size,
                  bgColor: Color(0xffCFE4F9),
                  icon: Icon(
                    Icons.play_lesson_rounded,
                    color: Color(0xffFE834A),
                    size: 32.5,
                  ),
                  title: Text(
                    'Greetings',
                    style: TextStyle(fontSize: 22),
                  ),
                  subtitle: Text(
                    '',
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  ontap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({
    Key? key,
    required this.size,
    required this.bgColor,
    required this.icon,
    required this.subtitle,
    required this.title,
    required this.ontap,
  }) : super(key: key);

  final Size size;
  final Icon icon;
  final Color bgColor;
  final Text title, subtitle;
  final Function ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: GestureDetector(
        onTap: () {
          ontap();
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(18),
              child: Container(
                height: size.height / 15.5,
                width: size.width / 8,
                color: bgColor,
                child: icon,
              ),
            ),
            SizedBox(width: 18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                subtitle,
              ],
            )
          ],
        ),
      ),
    );
  }
}

class TopcontainerTitleColumns extends StatelessWidget {
  const TopcontainerTitleColumns({
    Key? key,
    required this.icon1,
    required this.icon2,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final Icon icon1, icon2;
  final String title1, title2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            icon1,
            Text(
              title1,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ],
        ),
        SizedBox(height: 17),
        Row(
          children: [
            icon2,
            Text(
              title2,
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            )
          ],
        )
      ],
    );
  }
}
