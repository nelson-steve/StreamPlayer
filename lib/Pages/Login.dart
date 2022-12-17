import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(133, 34, 30, 30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 90),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.play_circle_outline,
                color: Colors.white,
                size: 80,
              ),
              SizedBox(width: 5),
              Text(
                "Stream",
                style: TextStyle(
                  color: Color.fromARGB(255, 207, 70, 15),
                  fontSize: 40,
                ),
              ),
            ],
          ),
          const SizedBox(height: 120),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                "Login",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Sign in to continue",
                style: Theme.of(context).primaryTextTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Center(
              child: Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextField(
              cursorColor: Colors.deepOrange,
              autofocus: false,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade900,
                  focusColor: Colors.amber,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Name or email",
                  hintStyle: TextStyle(color: Colors.grey.shade700)
                  // fillColor: Colors.amber,
                  // iconColor: Colors.amberAccent,
                  // focusColor: Colors.amber,
                  ),
            ),
          )),
          const SizedBox(height: 20),
          Center(
              child: Padding(
            padding: const EdgeInsets.only(left: 16.0, right: 16.0),
            child: TextField(
              cursorColor: Colors.deepOrange,
              autofocus: false,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade900,
                  focusColor: Colors.amber,
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Password",
                  hintStyle: TextStyle(color: Colors.grey.shade700)
                  // fillColor: Colors.amber,
                  // iconColor: Colors.amberAccent,
                  // focusColor: Colors.amber,
                  ),
            ),
          )),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(top: 8.0, right: 16.0),
              child: Text(
                "Forgot password",
                style: TextStyle(color: Color.fromARGB(255, 207, 70, 15)),
              ),
            ),
          ]),
          const SizedBox(height: 60),
          Container(
            width: 150,
            height: 60,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 207, 70, 15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(
              child:
                  Text("Log in", style: Theme.of(context).textTheme.headline5),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: Theme.of(context).textTheme.caption,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/signUp', (Route<dynamic> route) => false);
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(color: Color.fromARGB(255, 207, 70, 15)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
