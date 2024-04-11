import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';

class IEEEConference {
  final String title;
  final String date;
  final String location;
  final String tag;
  final String url;

  IEEEConference({
    required this.title,
    required this.date,
    required this.location,
    required this.tag,
    required this.url,
  });
}

class IEEEConferencesPage extends StatefulWidget {
  @override
  _IEEEConferencesPageState createState() => _IEEEConferencesPageState();
}

class _IEEEConferencesPageState extends State<IEEEConferencesPage> {
  late String _selectedTopic;
  final List<String> _topics = [
    'AI',
    'Machine Learning',
    'Blockchain',
    'IoT',
    'Cybersecurity',
  ];

  final List<IEEEConference> conferences = [
    IEEEConference(
      title: 'TechSummit',
      date: 'April 20, 2024',
      location: 'New York, USA',
      tag: 'Upcoming',
      url: 'https://apec-conf.org/',
    ),
    IEEEConference(
      title: 'InnovateTech',
      date: 'March 15, 2024',
      location: 'London, UK',
      tag: 'Previous',
      url: 'https://dasconference.ro/',
    ),
    IEEEConference(
      title: 'CodeFest',
      date: 'May 10, 2024',
      location: 'San Francisco, USA',
      tag: 'Upcoming',
      url: 'https://ecai.ro/',
    ),
    IEEEConference(
      title: 'FutureTech',
      date: 'June 25, 2024',
      location: 'Tokyo, Japan',
      tag: 'Previous',
      url: 'https://ieeegreentech.org/',
    ),
    IEEEConference(
      title: 'InnoTech',
      date: 'August 8, 2024',
      location: 'Sydney, Australia',
      tag: 'Upcoming',
      url: 'https://apec-conf.org/',
    ),
    IEEEConference(
      title: 'TechCon',
      date: 'September 12, 2024',
      location: 'Paris, France',
      tag: 'Previous',
      url: 'https://example.com/techcon',
    ),
    IEEEConference(
      title: 'SmartCities',
      date: 'February 15, 2025',
      location: 'Barcelona, Spain',
      tag: 'Upcoming',
      url: 'https://example.com/smartcities',
    ),
    IEEEConference(
      title: 'RoboTech',
      date: 'March 10, 2025',
      location: 'Osaka, Japan',
      tag: 'Previous',
      url: 'https://example.com/robotech',
    ),
    IEEEConference(
      title: 'DataSecurity',
      date: 'April 5, 2025',
      location: 'Toronto, Canada',
      tag: 'Upcoming',
      url: 'https://example.com/datasecurity',
    ),
    IEEEConference(
      title: 'HealthTech',
      date: 'May 20, 2025',
      location: 'Munich, Germany',
      tag: 'Previous',
      url: 'https://example.com/healthtech',
    ),
    IEEEConference(
      title: 'EnergySummit',
      date: 'June 15, 2025',
      location: 'Singapore',
      tag: 'Upcoming',
      url: 'https://example.com/energysummit',
    ),
    IEEEConference(
      title: 'CloudComputing',
      date: 'July 10, 2025',
      location: 'New Delhi, India',
      tag: 'Previous',
      url: 'https://example.com/cloudcomputing',
    ),
  ];

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _showTopicPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton<String>(
                value: _selectedTopic,
                items: _topics.map((String topic) {
                  return DropdownMenuItem<String>(
                    value: topic,
                    child: Text(topic),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    _selectedTopic = value!;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Perform filtering based on selected topic
                },
                child: Text('Apply'),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildItem(BuildContext context, int index) {
    final conference = conferences[index];
    final List<Color> colors = [
      Colors.blue[700]!,
      Colors.red[700]!,
      Colors.green[700]!,
      Colors.orange[700]!,
      Colors.purple[700]!,
      Colors.yellow[700]!,
    ];
    final Color color = colors[index % colors.length];

    return GestureDetector(
      onTap: () => _launchURL(conference.url),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withOpacity(0.7),
              color.withOpacity(0.9),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              conference.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Date: ${conference.date}',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              'Location: ${conference.location}',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(height: 5),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color:
                    conference.tag == 'Upcoming' ? Colors.orange : Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                conference.tag,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conference vibes\n all day♾️❤️!'),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Material(
                color: Colors.white,
                child: IconButton(
                  onPressed: () => _showTopicPicker(context),
                  icon: Icon(Icons.search),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(CupertinoIcons.settings_solid),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.black,
          padding: EdgeInsets.all(10),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemCount: conferences.length,
            itemBuilder: buildItem,
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IEEE Conferences',
      theme: ThemeData.dark(),
      home: IEEEConferencesPage(),
    );
  }
}
