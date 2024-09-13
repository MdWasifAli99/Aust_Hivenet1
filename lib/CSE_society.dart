import 'package:aust_hivenet1/details.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CSE_society extends StatefulWidget {
  @override
  State<CSE_society> createState() => _CSE_societyState();
}

class _CSE_societyState extends State<CSE_society> {
  List<Map<String, String>> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot qn = await FirebaseFirestore.instance.collection("CSE Dept").get();
      setState(() {
        for (var doc in qn.docs) {
          _products.add({
            "img": doc["img"],
            "title": doc["title"],
            "description": doc["description"],
          });
        }
        _isLoading = false;
      });
    } catch (e) {
      print("Error fetching products: $e");
      setState(() {
        _isLoading = false;
      });
    }
  }

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
      body: SafeArea(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: _products.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1, childAspectRatio: 1),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (_)=>details(_products[index]))),
              child: Card(
                elevation: 2,
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 2,
                      child: Image.network(_products[index]["img"]!),
                    ),
                    SizedBox(height: 20),
                    Text(_products[index]["title"]!),
                  ],
                ),
              ),
            );
          },
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
