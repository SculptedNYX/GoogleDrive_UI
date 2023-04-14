import 'package:flutter/material.dart';
import 'offline.dart';
import 'recent.dart';

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
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Offline()));
          },
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

TextStyle logoStyleCreator(Color c, screenWidth) {
  return TextStyle(
      color: c,
      fontWeight: FontWeight.w400,
      fontSize: screenWidth * (6 / 100),
      fontFamily: "Poppins-Medium");
}

Row logo(context) {
  double screenWidth = MediaQuery.of(context).size.width;

  return Row(
    children: [
      RichText(
          text: TextSpan(
              style: TextStyle(
                  color: const Color.fromARGB(255, 73, 73, 73),
                  fontWeight: FontWeight.w400,
                  fontSize: screenWidth * (6 / 100),
                  fontFamily: "Poppins-Medium"),
              children: <TextSpan>[
            TextSpan(
                text: "G",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 64, 134, 244), screenWidth)),
            TextSpan(
                text: "o",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 235, 65, 50), screenWidth)),
            TextSpan(
                text: "o",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 251, 189, 0), screenWidth)),
            TextSpan(
                text: "g",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 64, 134, 244), screenWidth)),
            TextSpan(
                text: "l",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 49, 170, 82), screenWidth)),
            TextSpan(
                text: "e ",
                style: logoStyleCreator(
                    const Color.fromARGB(255, 235, 65, 50), screenWidth)),
            const TextSpan(text: "Drive")
          ]))
    ],
  );
}
