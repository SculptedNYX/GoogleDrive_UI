import 'dart:math' as math;
import 'package:flutter/material.dart';

int currentUser = 0;

// User Data
class Profile {
  late List<Storage> storage;
  late Color color;
  late String userName;

  Profile(this.userName) {
    color =
        Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);
    // accounts.add(this);
  }
}

Profile def = Profile("Yehya");
List<Profile> accounts = [def];

class Storage {}
