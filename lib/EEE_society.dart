import 'package:flutter/material.dart';

class EEE_society extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AUST EEE Society"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {

            },
          ),
        ],// Customize the color
      ),
      body: SingleChildScrollView(
        child:Container(
          color: Colors.lightGreen[100],
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('assets/images/HiveNet.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome to AUST EEE Society',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Department of  Electrical and Electronic Engineering',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                      'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {

              },
            ),
            IconButton(
              icon: Icon(Icons.notification_important),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
