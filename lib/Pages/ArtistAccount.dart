import 'package:flutter/material.dart';

class ArtistAccount extends StatelessWidget {
  const ArtistAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        color: Colors.black,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.34,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(230, 155, 52, 34),
                      Color.fromARGB(255, 63, 20, 8),
                      Color.fromARGB(255, 20, 12, 10),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "The Weeknd",
                      style:
                          TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 24.0),
                      child: Text(
                        "67,023,232 Monthly listeners",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ),
              Container(
                height: 300,
                width: 200,
                color: Colors.amber,
              ),
              Container(
                height: 300,
                width: 200,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
