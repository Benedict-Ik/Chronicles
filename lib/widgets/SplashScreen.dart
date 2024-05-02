import 'dart:js';

import 'package:flutter/material.dart';

const double minimumPadding = 5.0;

Widget getSplashScreen() {
  AssetImage assetImage = AssetImage('lib/assets/images/splashImage.png');
  Image image = Image(
    image: assetImage,
    width: 200.0,
    height: 200.0,
  );

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 35.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: minimumPadding * 15),
        image,
        SizedBox(height: minimumPadding * 5),
        Text(
          "Nothing’s Here 🙁",
          style: TextStyle(
            fontSize: 30,
            decoration: TextDecoration.none,
            color: Color(0xFF3A3A3A),
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: minimumPadding * 5),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            "Add a new note to record an event, a memory or a lingering thought",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.normal,
              decoration: TextDecoration.none,
              color: Color(0xFF3A3A3A),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: minimumPadding * 5),
        // Wrap ElevatedButton with Expanded
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  // print("Button pressed");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ));
                },
                child: Text("Create a new note",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    )),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFBC103),
                    foregroundColor: Color(0xFF000000)),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
