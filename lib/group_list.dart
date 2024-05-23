import 'package:flutter/material.dart';

class GroupListPage extends StatelessWidget {
  const GroupListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Groups'),
      ),
      body: ListView.builder(
        itemCount: 10, // Number of groups
        itemBuilder: (context, index) {
          // Build list items here
          return ListTile(
            title: Text('Group ${index + 1}'),
            onTap: () {
              // Handle group tap
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show options for creating and deleting groups
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Wrap(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Create Group'),
                    onTap: () {
                      // Implement create group action
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.delete),
                    title: Text('Delete Group'),
                    onTap: () {
                      // Implement delete group action
                      Navigator.pop(context);
                    },
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
