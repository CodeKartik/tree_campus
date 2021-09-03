import 'package:flutter/material.dart';
import 'package:tree_campus/SIgnin_Signup_section/Signin.dart';
import 'package:tree_campus/Screens/BottomBar.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xffFE834A),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => BottomBar(),
            ),
          );
        },
        backgroundColor: Color(0xffFE834A),
        child: Icon(Icons.arrow_forward),
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signin(),
                ),
              );
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Sign up',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 45,
                    color: Colors.white),
              ),
            ),
          ),
          Container(
            height: size.height * 0.75,
            width: size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: SingleChildScrollView(
                child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'Enter the following details to sign up',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Textfield(
                    hinttext: 'Full Name',
                  ),
                  Textfield(
                    hinttext: 'Enter your email',
                  ),
                  Textfield(
                    hinttext: 'Password',
                  ),
                  Textfield(
                    hinttext: 'Mobile',
                  ),
                  Textfield(
                    hinttext: 'Age',
                  ),
                  Textfield(
                    hinttext: 'Occupation',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account ?",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w400),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signin(),
                              ),
                            );
                          },
                          child: Text(
                            'Sign in',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
          )
        ],
      )),
    );
  }
}

class Textfield extends StatelessWidget {
  const Textfield({
    Key? key,
    required this.hinttext,
  }) : super(key: key);
  final String hinttext;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        height: 50,
        child: TextField(
          // autofocus: true,
          decoration: InputDecoration(
              fillColor: Colors.grey.shade200,
              filled: true,
              hintText: hinttext,
              border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(30))),
        ),
      ),
    );
  }
}
