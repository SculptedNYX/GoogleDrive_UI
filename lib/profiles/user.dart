import 'dart:math' as math;
import 'package:flutter/material.dart';

import '../files.dart';

int currentUser = 0;

// User Data
class Profile {
  List<Item> storage = [];
  late Color color;
  late String userName;

  Profile(this.userName, this.storage) {
    color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    // accounts.add(this);
  }

  Widget icon(context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * (8 / 100),
      height: screenWidth * (8 / 100),
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Center(
          child: Text(
        userName[0],
        style: const TextStyle(color: Colors.white),
      )),
    );
  }
}

Profile def = Profile("Yehya", common);
List<Profile> accounts = [def];

class Storage {}
