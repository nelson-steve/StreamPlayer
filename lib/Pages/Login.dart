import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  void initState() async {
    super.initState();
    await Firebase.initializeApp();
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "barry.allen1@example.com",
              password: "SuperSecretPassword!");
      Navigator.of(context)
          .pushNamedAndRemoveUntil('/core', (Route<dynamic> route) => false);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void getuser() {
    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }
  }

  void deleteUser() async {
    try {
      String email = 'barry.allen@example.com';
      String password = 'SuperSecretPassword!';

// Create a credential
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await FirebaseAuth.instance.currentUser!
          .reauthenticateWithCredential(credential);
      await FirebaseAuth.instance.currentUser!.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        print(
            'The user must reauthenticate before this operation can be executed.');
      }
    }
  }

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
              controller: emailController,
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
              controller: passwordController,
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
          InkWell(
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 70, 15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Log in",
                    style: Theme.of(context).textTheme.headline5),
              ),
            ),
            onTap: login,
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
