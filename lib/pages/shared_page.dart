import 'package:flutter/material.dart';

class Shared extends StatelessWidget {
  const Shared({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Icon(
              Icons.share,
              size: screenWidth * (30 / 100),
              color: Colors.orange,
            ),
          ),
          Center(
            child: Text(
              "No Shared Items",
              style: TextStyle(
                  color: const Color.fromARGB(255, 73, 73, 73),
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * (6 / 100),
                  fontFamily: "Poppins-Medium"),
            ),
          )
        ],
      ),
    );
  }
}
