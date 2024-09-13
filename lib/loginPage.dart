import 'package:aust_hivenet1/HomePage.dart';
import 'package:aust_hivenet1/signUp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:aust_hivenet1/startingPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class loginPage extends StatefulWidget{
  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  //FirebaseAuth auth = FirebaseAuth.instance;
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 200,
                width: 300,
                child: Center(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Container(
                          width: 40,
                          height: 40,
                          child: Image.asset('assets/images/HiveNet.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:20.0,top: 10),
                        child: Text('Login', style: TextStyle(fontSize: 40, color: Colors.green,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:0,top: 0),
                child: Text('Email ID', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller: emailcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      hintText: 'example@aust.edu',
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left:0,top: 25),
                child: Text('Password', style: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),),
              ),
              Padding(padding:EdgeInsets.only(left:15, right:15, top:15 , bottom: 0),
                  child : TextField (
                    controller: passwordcontroller,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),

                      hintText: 'Give a strong password ',
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.only(left:200.0, top: 20),
              ),

              Container(
                height: 65,
                width: 360,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      child: Text( 'Login ', style: TextStyle(color: Colors.green, fontSize: 30,fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async{
                        try {
                          UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: emailcontroller.text,
                              password: passwordcontroller.text
                          );
                          var authCredential = userCredential.user;
                          print(authCredential!.uid);
                          if(authCredential.uid.isNotEmpty){
                            Navigator.push(context, CupertinoPageRoute(builder: (_)=>HomePage()));
                          }
                          else{
                            Fluttertoast.showToast(msg: "Something is wrong");
                          }

                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            Fluttertoast.showToast(msg: "No user found for that email.");

                          } else if (e.code == 'wrong-password') {
                            Fluttertoast.showToast(msg: "Wrong password provided for that user.");

                          }
                        } catch (e) {
                          print(e);
                        }
                      },

                    ),
                  ),
                ),
              ),
              Container(
                  child: Center(
                    child: Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.only(left: 50,top: 100),
                          child: Text('Dont have an account?  ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(left:1.0,top: 100),
                          child: InkWell(
                              onTap: (){
                           Navigator.push(context,
                           MaterialPageRoute(builder: (context) => signUp()));

              },
                              child: Text('Sign Up', style: TextStyle(fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),)),
                        )
                      ],
                    ),
                  )
              )
            ],
          ),
        )
    );
  }
}