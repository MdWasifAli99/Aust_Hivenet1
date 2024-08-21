import 'package:flutter/material.dart';

class AUSTrobotics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AUST Invention And Design Club"),
        backgroundColor: Colors.green, // Customize the color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Add your club logo image here
            Image.asset('assets/images/HiveNet.png'), // Replace with your image asset
            Image.asset('assets/professional.png'), // Replace with your image asset
            Image.asset('assets/images/HiveNet.png'),
            Image.asset('assets/Club_Activity.png'),
            // Add a carousel widget for multiple club images
            // Example: carousel_slider package

            // Add club information (description, contact details, etc.)
            // Example: Text widgets with relevant information

            // Add a section for club news (list of articles)
            // Example: ListView.builder with news articles
          ],
        ),
      ),
    );
  }
}
