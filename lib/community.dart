import 'package:flutter/material.dart';
import 'group_list.dart'; // Import the group list page

class CommunityPage extends StatelessWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Community'),
        actions: [
          IconButton(
            onPressed: () {
              // Implement action for opening the menu
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: Column(
        children: [
          ListTile(
            leading: Icon(Icons.group),
            title: Text('Groups'),
            onTap: () {
              // Navigate to groups page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => GroupListPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.post_add),
            title: Text('Posts'),
            onTap: () {
              // Navigate to posts page
            },
          ),
          ListTile(
            leading: Icon(Icons.article),
            title: Text('News'),
            onTap: () {
              // Navigate to news page
            },
          ),
        ],
      ),
    );
  }
}
