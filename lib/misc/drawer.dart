import 'package:flutter/material.dart';
import '../data.dart';
import '../pages/recent.dart';

Drawer drawDrawer(context) {
  double screenWidth = MediaQuery.of(context).size.width;
  double screenHeight = MediaQuery.of(context).size.height;
  return Drawer(
    width: screenWidth * (80 / 100),
    elevation: 0,
    child: ListView(
      children: [
        Row(
          children: [
            Container(
              width: screenWidth * (80 / 100),
              decoration: const BoxDecoration(
                  border: Border(
                      bottom: BorderSide(width: 0.5, color: Colors.grey))),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(
                      screenWidth * (5 / 100),
                      screenHeight * (2 / 100),
                      screenWidth * (3 / 100),
                      screenHeight * (3 / 100)),
                  child: logo(context)),
            ),
          ],
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.access_time_sharp,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Recent",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Recent()));
          },
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.check_circle_outline_outlined,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Offline",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.delete_outline,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Trash",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.cloud_upload_outlined,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Backups",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.settings,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Settings",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.help_outline,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Help & feedback",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        ),
        ListTile(
          minVerticalPadding: 1,
          minLeadingWidth: 5,
          leading: Icon(
            Icons.cloud_queue,
            color: const Color.fromARGB(255, 73, 73, 73),
            size: screenWidth * (6 / 100),
          ),
          title: Text(
            "Storage",
            style: TextStyle(fontSize: screenWidth * (4 / 100)),
          ),
          onTap: () {},
        )
      ],
    ),
  );
}
