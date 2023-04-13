import 'package:flutter/material.dart';

class Item {
  late String name;
  DateTime lastOpened = DateTime.now();
  late Icon itemType;
  late String thumbnail;
  int recentCount = 3;

  Item(this.name, this.itemType, this.thumbnail);
}

Icon pdf = const Icon(
  Icons.picture_as_pdf,
  color: Color.fromARGB(255, 215, 74, 66),
);

Icon png = const Icon(
  Icons.image,
  color: Color.fromARGB(255, 215, 74, 66),
);

List<Item> common = [
  Item("Assignment 1", pdf,
      "https://www.greenfoothills.org/wp-content/uploads/2017/11/PDF-icon-1.png"),
  Item("Pink Rose", png,
      "http://www.photos-public-domain.com/wp-content/uploads/2011/09/pink-rose-close-up.jpg"),
  Item("Chair", png,
      "https://i5.walmartimages.com/asr/0524c749-e8c6-43ea-bd7f-59506a5e9316.8a7bb1aaf59ae6bb0c48ee77a5e637fb.jpeg")
];
