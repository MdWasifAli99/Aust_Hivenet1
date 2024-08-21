import 'package:aust_hivenet1/loginPage.dart';
import 'package:flutter/material.dart';

class signUpPage extends StatelessWidget {
  const signUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xFFFFFFFF), // White
                  Color(0xFFFFFFFF), // White
                ]
            )
        ),
        child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 100.0),
                child: Image(

                    image: AssetImage('assets/professional.png')),
              ),
              const SizedBox(
                height: 50,
              ),
              const Text('Lets Get Professional',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black
              ),),
              const Text('Stay connected to your dedicated society and clubs.',style: TextStyle(
                  fontSize:12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45
              ),),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPage()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.green),
                  ),
                  child: const Center(child: Text('SIGN IN',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 125, 23, 100)
                  ),),),
                ),
              ),
              const SizedBox(height: 30,),
              GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => loginPage()));
                },
                child: Container(
                  height: 53,
                  width: 320,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(19 , 122, 77, 100),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color:Colors.lightGreen),
                  ),
                  child: const Center(child: Text('SIGN UP',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),),),
                ),
              ),
              const Spacer(),
              const Text('Login with @aust.edu mail',style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45
              ),),//
              const SizedBox(height: 43,),

            ]
        ),
      ),

    );
  }
}