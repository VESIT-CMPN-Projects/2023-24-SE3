import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:infi_co/hackathon_updates.dart';

class HackathonDetailsPage extends StatelessWidget {
  final String url;
  const HackathonDetailsPage({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechTonic Hackathon'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date: December 5, 2024',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Location: Chandigarh, India',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            Text(
              'Description:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Description for TechTonic hackathon',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchURL('https://example.com/techtonic'),
              child: Text('Register Now'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechFest - Explore the World of Innovation',
      home: HackathonUpdatesPage(),
      routes: {
        '/hackathon_details': (context) =>
            HackathonDetailsPage(url: 'https://example.com/techtonic'),
      },
    ),
  );
}
