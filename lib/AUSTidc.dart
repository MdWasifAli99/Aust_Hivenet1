import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AUSTidc extends StatefulWidget {
  @override
  State<AUSTidc> createState() => _AUSTidcState();
}

class _AUSTidcState extends State<AUSTidc> {
  List<Map<String, String>> _products = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      QuerySnapshot qn = await FirebaseFirestore.instance.collection("AustIDC").get();
      setState(() {
        for (var doc in qn.docs) {
          _products.add({
            "img": doc["img"],
            "title": doc["title"],
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
        title: Text("AUST IDC"),
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
            return Card(
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
