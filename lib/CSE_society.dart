import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CSE_society extends StatefulWidget {
  @override
  State<CSE_society> createState() => _CSE_societyState();
}

class _CSE_societyState extends State<CSE_society> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AUST CSE Society"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("CSE Dept").snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: Text("Loading..."),
            );
          } else {
            return GridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data!.docs.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              itemBuilder: (context, index) {
                DocumentSnapshot data = snapshot.data!.docs[index];
                return GridTile(
                  child: Image.network(data["img"]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
