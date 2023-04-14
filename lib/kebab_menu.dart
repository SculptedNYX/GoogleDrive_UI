import 'package:flutter/material.dart';

import 'files.dart';

Widget kebabmenu(context, Item item) {
  Icon starredIcon =
      const Icon(Icons.star_border, color: Color.fromARGB(255, 73, 73, 73));
  String starredText = "Add to Starred";

  Icon offlineIcon = const Icon(Icons.check_circle_outline_sharp,
      color: Color.fromARGB(255, 73, 73, 73));
  String offlineText = "Make available offline";

  if (item.starred) {
    starredIcon =
        const Icon(Icons.star, color: Color.fromARGB(255, 73, 73, 73));
    starredText = "Remove from Starred";
  }

  if (item.offline) {
    offlineIcon =
        const Icon(Icons.check_circle, color: Color.fromARGB(255, 73, 73, 73));
    offlineText = "Avalible offline";
  }

  return SizedBox(
    height: double.maxFinite,
    child: ListView(
      scrollDirection: Axis.vertical,
      children: [
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Row(
              children: [
                item.itemType,
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    item.name,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                    onPressed: () {
                      item.starred = !item.starred;
                    },
                    icon: starredIcon,
                    label: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          starredText,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 27, 30, 37)),
                        ))),
                ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
                    onPressed: () {
                      item.offline = !item.offline;
                    },
                    icon: offlineIcon,
                    label: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          offlineText,
                          style: const TextStyle(
                              color: Color.fromARGB(255, 27, 30, 37)),
                        )))
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                dummyKebabOption(
                    const Icon(
                      Icons.link,
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                    "Copy link"),
                dummyKebabOption(
                    const Icon(Icons.file_copy_outlined,
                        color: Color.fromARGB(255, 73, 73, 73)),
                    "Make a copy"),
                dummyKebabOption(
                    const Icon(Icons.arrow_circle_right_outlined,
                        color: Color.fromARGB(255, 73, 73, 73)),
                    "Send a copy"),
              ],
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                dummyKebabOption(
                    const Icon(
                      Icons.open_with_sharp,
                      color: Color.fromARGB(255, 73, 73, 73),
                    ),
                    "Open wtih"),
                dummyKebabOption(
                    const Icon(Icons.file_download_outlined,
                        color: Color.fromARGB(255, 73, 73, 73)),
                    "Download"),
                dummyKebabOption(
                    const Icon(Icons.folder_open_outlined,
                        color: Color.fromARGB(255, 73, 73, 73)),
                    "Show file location"),
              ],
            ),
          ),
        )
      ],
    ),
  );
}

Widget dummyKebabOption(Icon icon, String text) {
  return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
          elevation: 0, backgroundColor: const Color.fromARGB(0, 0, 0, 0)),
      onPressed: () {},
      icon: icon,
      label: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Color.fromARGB(255, 27, 30, 37)),
          )));
}
