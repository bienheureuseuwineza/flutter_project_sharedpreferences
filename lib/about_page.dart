import 'package:flutter/material.dart';
import 'common_widgets.dart'; // Import common widgets

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About Us',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to our app! We are a team of passionate developers dedicated to creating amazing experiences for our users.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Our mission is to make your life easier and more enjoyable through innovative technology solutions. We believe in simplicity, creativity, and continuous improvement.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for choosing our app. We hope you love using it as much as we loved creating it!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ),
      drawer: CommonDrawer(), // Use CommonDrawer instead of defining it locally
      bottomNavigationBar: CommonBottomNavigationBar(currentIndex: 2), // Set currentIndex to 2 for About
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: AboutPage(),
//   ));
// }
