import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import the splash screen
import 'expert_details.dart'; // Import the expert details page
import 'login.dart'; // Import the login page
import 'chatpage.dart'; // Import the chat page
import 'community.dart'; // Import the community page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "InTouch",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // Display splash screen first
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Delay navigation to main app page after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const MyHomePage(), // Navigate to main app page
        ),
      );
    });

    return Scaffold(
      backgroundColor: Colors.blue, // Set background color to blue
      body: Center(
        child: Text(
          'InTouch',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ), // Set text color to white
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InTouch'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      const LoginScreen(), // Navigate to LoginScreen
                ),
              );
            },
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all(
                Colors.grey,
              ), // Set text color to grey
            ),
            child: const Text('Login'),
          ),
          const SizedBox(width: 16), // Add space between login button and title
        ],
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpertDetailsPage(
                    expertName: 'Expert 1',
                    expertExperience: '5 years', // Example experience
                  ),
                ),
              );
            },
            child: _buildExpertCard('Expert 1'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpertDetailsPage(
                    expertName: 'Expert 2',
                    expertExperience: '8 years', // Example experience
                  ),
                ),
              );
            },
            child: _buildExpertCard('Expert 2'),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ExpertDetailsPage(
                    expertName: 'Expert 3',
                    expertExperience: '10 years', // Example experience
                  ),
                ),
              );
            },
            child: _buildExpertCard('Expert 3'),
          ),
          // Add more expert cards here
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'Video',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Call',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Community',
          ),
        ],
        onTap: (int index) {
          switch (index) {
            case 1:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChatPage()),
              );
              break;
            case 4:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CommunityPage()),
              );
              break;
            default:
              // Do nothing
              break;
          }
        },
      ),
    );
  }

  Widget _buildExpertCard(String name) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Center(
        child: Text(
          name,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
