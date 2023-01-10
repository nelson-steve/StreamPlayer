import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? errorMessage = "";

  final nameContoller = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  void getUser() {}

  void createNewUser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: "barry.allen2@example.com",
              password: "SuperSecretPassword!");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void createUser() async {
    setState(() {
      print("Hello");
    });
    try {
      await _auth.createUserWithEmailAndPassword(
          email: emailController.text.toString(),
          password: passwordController.text.toString());
    } on FirebaseAuthException catch (e) {
      setState(() {
        print(e.message);
      });
    }
  }
  // Future<void> createUserWithEmailAndPassword() async {
  //   print("Hello");
  //   try {
  //     await _auth.createUserWithEmailAndPassword(
  //         email: emailController.text, password: passwordController.text);
  //   } on FirebaseAuthException catch (e) {
  //     setState(() {
  //       print(e.message);
  //     });
  //   }
  // }

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(133, 34, 30, 30),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 50),
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
          const SizedBox(height: 50),
          Row(
            children: const [
              SizedBox(width: 20),
              Text(
                "Create Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(width: 20),
              Text(
                "Enter your details to continue",
                style: Theme.of(context).primaryTextTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 20),
          InputField(
            input: "Name",
            controller: nameContoller,
          ),
          const SizedBox(height: 20),
          InputField(
            input: "Email",
            controller: emailController,
          ),
          const SizedBox(height: 20),
          InputField(
            input: "Password",
            controller: passwordController,
          ),
          const SizedBox(height: 20),
          InputField(
            input: "Confirm Password",
            controller: passwordController,
          ),
          const SizedBox(height: 60),
          GestureDetector(
            child: Container(
              width: 150,
              height: 60,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 207, 70, 15),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text("Sign Up",
                    style: Theme.of(context).textTheme.headline5),
              ),
            ),
            onTap: createNewUser,
          ),
          SizedBox(height: 60),
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
                      '/logIn', (Route<dynamic> route) => false);
                },
                child: Text(
                  "Log in",
                  style: TextStyle(color: Color.fromARGB(255, 207, 70, 15)),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String input;
  final TextEditingController controller;
  const InputField({super.key, required this.input, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.deepOrange,
        autofocus: false,
        decoration: InputDecoration(
            fillColor: Colors.grey.shade900,
            focusColor: Colors.amber,
            filled: true,
            border: InputBorder.none,
            hintText: input,
            hintStyle: TextStyle(color: Colors.grey.shade700)
            // fillColor: Colors.amber,
            // iconColor: Colors.amberAccent,
            // focusColor: Colors.amber,
            ),
      ),
    ));
  }
}
