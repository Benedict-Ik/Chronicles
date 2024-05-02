import 'package:flutter/material.dart';

const minimumPadding = 5.0;

// Widget getSplashScreen() {
//   AssetImage assetImage = const AssetImage('lib/assets/images/splashImage.png');
//   Image image = Image(
//     image: assetImage,
//     width: 200.0,
//     height: 200.0,
//   );


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Splash Screen',
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ),
                );
              },
              child: Text('Get Started'),
            ),
          ],
        ),
      ),
    );
  }
}