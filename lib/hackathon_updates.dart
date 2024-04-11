import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TechFest - Explore the World of Innovation',
      home: HackathonUpdatesPage(),
    );
  }
}

class Hackathon {
  final String title;
  final String date;
  final String location;
  final String description;
  final String url;
  final String type;
  final IconData icon;

  Hackathon({
    required this.title,
    required this.date,
    required this.location,
    required this.description,
    required this.url,
    required this.type,
    required this.icon,
  });
}

class HackathonUpdatesPage extends StatelessWidget {
  final List<Hackathon> hackathons = [
    Hackathon(
      title: 'CodeStorm',
      date: 'March 20, 2024',
      location: 'Delhi, India',
      description: 'Description for CodeStorm hackathon',
      url: 'https://madgcodes.github.io/hackathon-web/',
      type: 'Online',
      icon: Icons.code,
    ),
    Hackathon(
      title: 'Innovate-a-Thon',
      date: 'April 10, 2024',
      location: 'Mumbai, India',
      description: 'Description for Innovate-a-Thon hackathon',
      url: 'https://madgcodes.github.io/Hack_web2.0/',
      type: 'Offline',
      icon: Icons.lightbulb_outline,
    ),
    Hackathon(
      title: 'DevHacks',
      date: 'May 15, 2024',
      location: 'Bangalore, India',
      description: 'Description for DevHacks hackathon',
      url: 'https://madgcodes.github.io/hackathon-web/',
      type: 'Online',
      icon: Icons.computer,
    ),
    Hackathon(
      title: 'TechNest',
      date: 'June 5, 2024',
      location: 'Hyderabad, India',
      description: 'Description for TechNest hackathon',
      url: 'https://madgcodes.github.io/Hack_web2.0/',
      type: 'Offline',
      icon: Icons.wifi,
    ),
    Hackathon(
      title: 'HackWave',
      date: 'July 20, 2024',
      location: 'Chennai, India',
      description: 'Description for HackWave hackathon',
      url: 'https://madgcodes.github.io/hackathon-web/',
      type: 'Online',
      icon: Icons.waves,
    ),
    Hackathon(
      title: 'InnoHive',
      date: 'August 8, 2024',
      location: 'Pune, India',
      description: 'Description for InnoHive hackathon',
      url: 'https://madgcodes.github.io/Hack_web2.0/',
      type: 'Offline',
      icon: Icons.api,
    ),
    Hackathon(
      title: 'DataFrenzy',
      date: 'September 12, 2024',
      location: 'Ahmedabad, India',
      description: 'Description for DataFrenzy hackathon',
      url: 'https://madgcodes.github.io/hackathon-web/',
      type: 'Online',
      icon: Icons.storage,
    ),
    Hackathon(
      title: 'HackSphere',
      date: 'October 30, 2024',
      location: 'Jaipur, India',
      description: 'Description for HackSphere hackathon',
      url: 'https://madgcodes.github.io/Hack_web2.0/',
      type: 'Offline',
      icon: Icons.public,
    ),
    Hackathon(
      title: 'CyberQuest',
      date: 'November 18, 2024',
      location: 'Kolkata, India',
      description: 'Description for CyberQuest hackathon',
      url: 'https://madgcodes.github.io/hackathon-web/',
      type: 'Online',
      icon: Icons.security,
    ),
    Hackathon(
      title: 'TechTonic',
      date: 'December 5, 2024',
      location: 'Chandigarh, India',
      description: 'Description for TechTonic hackathon',
      url: 'https://madgcodes.github.io/Hack_web2.0/',
      type: 'Offline',
      icon: Icons.settings,
    ),
    // Add more hackathons here
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TechFest - Explore the World of Innovation'),
      ),
      body: ListView.builder(
        itemCount: hackathons.length,
        itemBuilder: (context, index) {
          final hackathon = hackathons[index];
          return GestureDetector(
            onTap: () => _launchURL(hackathon.url),
            child: Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        hackathon.icon,
                        color: Color.fromARGB(255, 18, 18, 18),
                      ),
                      SizedBox(width: 10),
                      Text(
                        hackathon.title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          SizedBox(width: 5),
                          Text(
                            '4.5',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.save,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Date: ${hackathon.date}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Type: ${hackathon.type}',
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    'Location: ${hackathon.location}',
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(height: 5),
                  Text(
                    hackathon.description,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}
