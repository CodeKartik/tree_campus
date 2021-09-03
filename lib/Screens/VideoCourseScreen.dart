import 'package:flutter/material.dart';

class VideoCourse extends StatelessWidget {
  const VideoCourse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blueGrey.shade800,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_rounded),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Word of the day :',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffFE834A),
                ),
              ),
              SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  height: size.height / 3,
                  width: size.width,
                  color: Colors.black87,
                  child: Center(
                    child: Text(
                      'Video will play here',
                      style: TextStyle(
                        fontSize: 28,
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 40,
                    onPressed: () {},
                    child: Text(
                      'Previous',
                      style: TextStyle(fontSize: 18),
                    ),
                    color: Color(0xffFE834A),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 40,
                    onPressed: () {},
                    child: Text(
                      'Next',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    color: Color(0xffFE834A),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
