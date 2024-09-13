
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:aust_hivenet1/CSE_society.dart';

class details extends StatefulWidget {
  var _product;
  details(this._product);
  @override
  _detailsState createState() => _detailsState();
}

class _detailsState extends State<details> {

  Future going() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("going");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("event")
        .doc()
        .set({
      "name": widget._product["title"],
      "description": widget._product["description"],
      "images": widget._product["img"],
    }).then((value) => print("Added to going"));
  }

  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
    FirebaseFirestore.instance.collection("users-favourite-event");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("event")
        .doc()
        .set({
      "name": widget._product["title"],
      "description": widget._product["description"],
      "images": widget._product["img"],
    }).then((value) => print("Added to favourite"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users-favourite-items").snapshots(),
            builder: (context, snapshot) {
              return IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () {
                  addToFavourite();
                },
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: Image.network(widget._product["img"]),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget._product['title'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(widget._product['description']),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () {
                    going();
                  },
                  child: Text(
                    "Going",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
