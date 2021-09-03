import 'package:flutter/material.dart';

class LiveClasses extends StatefulWidget {
  const LiveClasses({Key? key}) : super(key: key);

  @override
  _LiveClassesState createState() => _LiveClassesState();
}

class _LiveClassesState extends State<LiveClasses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Live Classes Schedule',
          style: TextStyle(
              color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffFE834A),
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              ClassesCard(
                size: size,
                title: 'Sentences & Its Types',
                day: 'Thursday, July 22,2021',
                time: '6:57 AM',
                classStatus: 'Live',
                statusColor: Colors.green,
              ),
              ClassesCard(
                size: size,
                title: 'Noun',
                day: 'Saturday, July 10,2021',
                time: '8:42 AM',
                classStatus: 'Ended',
                statusColor: Colors.redAccent.shade200,
              ),
              ClassesCard(
                size: size,
                title: 'Countable & Uncountable Nouns',
                day: 'Friday, July 9,2021',
                time: '7:39 AM',
                classStatus: 'Ended',
                statusColor: Colors.redAccent.shade200,
              ),
              ClassesCard(
                size: size,
                title: 'Wh Family',
                day: 'Friday, July 9,2021',
                time: '9:30 AM',
                classStatus: 'Ended',
                statusColor: Colors.redAccent.shade200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClassesCard extends StatelessWidget {
  const ClassesCard({
    Key? key,
    required this.size,
    required this.classStatus,
    required this.day,
    required this.statusColor,
    required this.time,
    required this.title,
  }) : super(key: key);

  final Size size;
  final String title, day, time, classStatus;
  final Color statusColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(15),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            height: 145,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.purple.shade900,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: size.height / 70),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today_rounded,
                          color: Color(0xffFE834A),
                        ),
                        SizedBox(width: 10),
                        Text(
                          day,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: size.height / 85),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18),
                    child: Row(
                      children: [
                        Icon(
                          Icons.timer,
                          color: Color(0xffFE834A),
                        ),
                        SizedBox(width: 10),
                        Text(
                          time,
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(
                      classStatus,
                      style: TextStyle(
                          fontSize: 18,
                          color: statusColor,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
