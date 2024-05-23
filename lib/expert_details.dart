import 'package:flutter/material.dart';

class ExpertDetailsPage extends StatelessWidget {
  final String expertName;
  final String expertExperience;

  const ExpertDetailsPage({
    Key? key,
    required this.expertName,
    required this.expertExperience,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(expertName),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: $expertName',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Experience: $expertExperience',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Handle chat with expert
              },
              child: Text('Chat with Expert'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle call with expert
              },
              child: Text('Call with Expert'),
            ),
            ElevatedButton(
              onPressed: () {
                // Handle video call with expert
              },
              child: Text('Video Call with Expert'),
            ),
          ],
        ),
      ),
    );
  }
}
