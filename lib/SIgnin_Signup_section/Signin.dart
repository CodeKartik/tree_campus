import 'package:flutter/material.dart';
import 'package:tree_campus/SIgnin_Signup_section/Signup.dart';
import 'package:tree_campus/Screens/BottomBar.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool isPasswordVisible = false;

  checkMethod() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.2,
              width: size.width,
              color: Color(0xffFE834A),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 45,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email_outlined),
                  hintText: 'Email Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextField(
                obscureText: isPasswordVisible,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outline),
                  hintText: 'Password',
                  suffixIcon: IconButton(
                      onPressed: () {
                        checkMethod();
                      },
                      icon: isPasswordVisible
                          ? Icon(
                              Icons.visibility_off_rounded,
                              color: Color(0xffFE834A),
                            )
                          : Icon(
                              Icons.remove_red_eye_rounded,
                              color: Color(0xffFE834A),
                            )),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18),
              child:
                  TextButton(onPressed: () {}, child: Text('Forgot assword?')),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: MaterialButton(
                minWidth: size.width,
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ),
                  );
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Color(0xffFE834A),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 1.0,
                  width: size.width / 2.5,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'Or',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Container(
                  height: 1.0,
                  width: size.width / 2.5,
                  color: Colors.black,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: TextStyle(fontSize: 16, color: Colors.grey.shade600),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
              child: MaterialButton(
                minWidth: size.width,
                height: 45,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomBar(),
                    ),
                  );
                },
                child: Text(
                  'Do it later',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                color: Color(0xffFE834A),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
