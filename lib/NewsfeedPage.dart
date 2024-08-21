import 'package:flutter/material.dart';

class NewsfeedPage extends StatelessWidget {
  final String param;

  NewsfeedPage({required this.param});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Newsfeed'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {

            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {

            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(

                backgroundColor: Colors.green,
                child: Text('A'),
              ),
              title: Text('Title $index'),
              subtitle: Text(
                'Welcome To AUST Hivenet Newsfeed ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: TextButton(
                onPressed: () {

                },
                child: Text('Read more'),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
