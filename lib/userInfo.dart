import 'package:aust_hivenet1/HomePage.dart';
import 'package:aust_hivenet1/signUp.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:aust_hivenet1/startingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';

class userInfo extends StatefulWidget{
  @override
  State<userInfo> createState() => _userInfo();
}

class _userInfo extends State<userInfo> {
  @override
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  final name = TextEditingController();
  final id = TextEditingController();
  final dept = TextEditingController();
  final db = FirebaseFirestore.instance;
  //FirebaseAuth auth = FirebaseAuth.instance;
  userDatatoDB()async{
    final FirebaseAuth auth = FirebaseAuth.instance;
    var currentUser =  auth.currentUser;

    final docData = {

      "Email": emailcontroller.text.toString(),
      "Password": passwordcontroller.text.toString(),
      "Name": name.text.toString(),
      "ID": id.text.toString(),
      "Department":dept.text.toString(),
      "dateExample": Timestamp.now(),
    };

    db
        .collection("Users")
        .doc(currentUser!.email)
        .set(docData)
        .onError((e, _) => print("Error writing document: $e"));
    print('success');

  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:20.0,top: 80),
                child: Text('User Information', style: TextStyle(fontSize: 40, color: Colors.green,fontWeight: FontWeight.bold),),
              ),
          
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
          
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email ID',
                      hintText: 'example@aust.edu',
                    ),
                  )
              ),
          
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Give a strong password ',
                    ),
                  )
              ),
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller: name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Name',
          
                    ),
                  )
              ),
          
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller:id,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'ID',
                      hintText: 'Give student id ',
                    ),
                  )
              ),
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller: dept,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Department',
          
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ElevatedButton(
                  child: Text( 'Submit ', style: TextStyle(color: Colors.green, fontSize: 30,fontWeight: FontWeight.bold),
                  ),
                  onPressed: () async {
                    userDatatoDB();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));

                  },
          
                ),
              ),
          
          
          
            ],
          ),
        )
    );
  }
}