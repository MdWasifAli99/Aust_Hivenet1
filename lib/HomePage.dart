import 'package:aust_hivenet1/AUSTidc.dart';
import 'package:aust_hivenet1/AUSTrobotics.dart';
import 'package:aust_hivenet1/CSE_society.dart';
import 'package:aust_hivenet1/EEE_society.dart';
import 'package:aust_hivenet1/NewsfeedPage.dart';
import 'package:aust_hivenet1/profile.dart';
import 'package:aust_hivenet1/signUpPage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  final FirebaseFirestore _firestoreInstance = FirebaseFirestore.instance;

  
  List todoList = [];
  String singlevalue = "";
  List<String> imageUrls = [];
  List<String> _carouselImages= [];

  void initState() {

    fetchCarouselImages();
    super.initState();
  }

  fetchCarouselImages() async {
    try {
      QuerySnapshot qn = await _firestoreInstance.collection("slider").get();
      setState(() {
        for (var doc in qn.docs) {
          _carouselImages.add(doc["path"]);

        }
      });

    } catch (e) {
      print("Error fetching carousel images: $e");
    }

  }


  addString(content) {
    setState(() {
      singlevalue = content;
    });
  }

  addList() {
    setState(() {
      todoList.add({"value": singlevalue});
    });
  }

  deleteItem(index) {
    setState(() {
      todoList.removeAt(index);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),),
        backgroundColor: Colors.green,
      ),
      body:
      Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 3.5,
              child: CarouselSlider(
                  items: _carouselImages.map<Widget>((item) => Padding(
                    padding: const EdgeInsets.only(left: 3, right: 3),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(item),
                              fit: BoxFit.fitWidth)),
                    ),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 0.8,
                      enlargeStrategy: CenterPageEnlargeStrategy.height,
                      onPageChanged: (val, carouselPageChangedReason) {

                      })),
            ),

            Expanded(
              flex: 90,
              child: ListView.builder(
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      color: Colors.green,
                      child: SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: Container(
                          margin: EdgeInsets.only(left: 20),
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 80,
                                child: Text(
                                  todoList[index]['value'].toString(),
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 20,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.white,
                                    child: TextButton(
                                      onPressed: () {
                                        deleteItem(index);
                                      },
                                      child: Icon(
                                        Icons.delete,
                                        color: Colors.black,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: Container(
                        height: 40,
                        child: TextFormField(
                          onChanged: (content) {
                            addString(content);
                          },
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              fillColor: Colors.grey,
                              filled: true,
                              labelText: 'Event name,date,location...',
                              labelStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: SizedBox(
                          width: 5,
                        )),
                    Expanded(
                        flex: 27,
                        child: ElevatedButton(
                          onPressed: () {
                            addList();
                          },
                          child: Container(
                              height: 15,
                              width: double.infinity,
                              alignment: Alignment.center,
                              child: Text("Add")),
                        )),
                  ],
                )),
          ],
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.green),
                accountName: Text(
                  "Abhishek Mishra",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("abhishekm977@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "A",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_sharp),
              title: const Text(' AUST IDC '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AUSTidc()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.abc_outlined),
              title: const Text(' AUST Robotics '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AUSTrobotics()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.adb_rounded),
              title: const Text(' CSE Society '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CSE_society()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.account_balance_sharp),
              title: const Text(' EEE Society '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EEE_society()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.add_alert_rounded),
              title: const Text(' News Feed '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NewsfeedPage(param: '')));

              },
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text(' Edit Profile '),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => profile()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LogOut'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => signUpPage()));

              },
            ),
          ],
        ),
      ),//Drawer
    );
  }
}





