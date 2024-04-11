
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshops Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        // Customize the dark theme here
        // Example:
        primaryColor: Colors.blue, // Change the primary color
        hintColor: Colors.green, // Change the accent color
        // You can customize other aspects of the dark theme here
      ),
      home: IEEEPage(),
    );
  }
}

class Workshops {
  final String name;
  final String modeOfConducting;
  final List<String> hashtags;
  //final int registeredPeople;
  final DateTime registrationDeadline;
  //final int teamSize;
  final String eligibilityCriteria;
  final Map<String, DateTime> stagesAndTimelines;
  final Map<String, Map<String, dynamic>> Guidelines;
  final String workshopInformation;
  final Map<String, String> contactOrganisers;
  //final String rewardsAndPrizes;
  final bool participationCertificate;
  bool isLiked;
  bool isRegistered;

  Workshops({
    required this.name,
    required this.modeOfConducting,
    required this.hashtags,
    //required this.registeredPeople,
    required this.registrationDeadline,
    //required this.teamSize,
    required this.eligibilityCriteria,
    required this.stagesAndTimelines,
    required this.Guidelines,
    required this.workshopInformation,
    required this.contactOrganisers,
    //required this.rewardsAndPrizes,
    required this.participationCertificate,
    this.isLiked = false,
    this.isRegistered = false,
  });
}

class IEEEPage extends StatefulWidget {
  @override
  _IEEEPageState createState() => _IEEEPageState();
}

class _IEEEPageState extends State<IEEEPage> {
  List<Workshops> workshops = [
    Workshops(
      name: "NODE.JS WORKSHOP",
      modeOfConducting: "Online, Google Meet",
      hashtags: ["Tech", "Coding"],
      //registeredPeople: 200,
      registrationDeadline: DateTime.now().add(Duration(days: 2)),
      //teamSize: 3,
      eligibilityCriteria: "S.E, T.E and MCA members",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 1)),
        "Stage 2": DateTime.now().add(Duration(days: 1)),
      },
      Guidelines: {
        "Day 1": {"duration": "The participants will be required to install Node.js and Visual Studio Code on their machines before the workshop. The workshop will commence with an explanation about the basics of HTML and CSS by Vaishnavi Ainapure (EXECOM-D12A) and Abhijeet Thikekar (Treasurer-D12A), who will teach the participants how to create the front-end of the application by conducting an interactive programming session. Geet Ramchandani (EXECOM-D10) will then take the session further by explaining to the participants about node.js, socket.io, and their applications. This will be followed by a short code-along session to design the backend of the application. Any doubts regarding the first session will be cleared in the break."},
        "Day 2": {"duration": "The second session will begin with Mr. Geet Ramchandani continuing the code-along session and setting the basic frame of the server. Then, Mr. Aditya Mohan will take over and work towards making the application capable of transferring messages. He will teach the participants how to make different groups, how to transfer data to and from the server, and also display it. This will be followed by an interactive quiz on Kahoot. Thus, the participants will learn how to make an interesting web-based chat app. All the doubts will be cleared after the session."},
      },
      workshopInformation: "Concept:  The Workshop will be conducted on the 22nd of November, 2024, in the form of two sessions, with the platform being Google Meet. The first session will begin at 9:00 AM and conclude at 11:00 AM. The second session will begin at noon and conclude at 1:30 PM. The participants will be taught how to make a chat app using node.js and socket.io that can maintain different chat rooms and allow conversation between people.",
      contactOrganisers: {"name": "Abhijit Thikekar", "mail": "abhijit@gmail.com", "contactNo": "1234567890"},
      //rewardsAndPrizes: "Cash prizes",
      participationCertificate: true,
    ),
    Workshops(
      name: "CYBER SECURITY WEBINAR",
      modeOfConducting: "Online, Google Meet" ,
      hashtags: ["Tech", "Coding"],
      //registeredPeople: 150,
      registrationDeadline: DateTime.now().add(Duration(days: 1)),
      //teamSize: 2,
      eligibilityCriteria: "F.E, S.E, T.E, B.E, and MCA students",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 1)),
      },
      Guidelines: {
        "Day 1": {"duration": "Dr. Vanita Joshi, faculty at ICFAI Business School, will start the webinar by interacting with the participants and asking them about their understanding of Cyber Security. This will be followed by an explanation about different types of malware and system vulnerabilities caused by snooping, intrusions, and cyber vandalism. Dr. Vanita Joshi will explain more about crimes such as identity theft, phishing, click fraud, and cyberterrorism. Loss of revenue, lowered market value, legal liability, and many other points will be discussed, giving the participants an idea about how cyber-crimes and cyber-attacks affect businesses. Dr. Vanita Joshi will also explain recent cyber-attacks through examples like the Cosmos Bank (Pune) case study, Canara Bank case study, breach of 1.1 billion records of Indian Aadhar cardholders, to name a few. This will be followed by an explanation about how these things could be prevented using strong passwords, firewalls, encryption, multi-factor authentication, etc. All the doubts of participants will be cleared during the Q&A session."},
      },
      workshopInformation: " Concept: The Workshop will be conducted on December 2, 2024, with the platform being Zoom. The session will begin at 11:30 AM and conclude at 1:00 PM. The participants will gain knowledge and information about the basics of Cyber Security, including various Cyber Laws and Malwares.",
      contactOrganisers: {"name": "Shruti Mishra", "mail": "shruti@gmail.com", "contactNo": "9876543210"},
      //rewardsAndPrizes: "Gift vouchers",
      participationCertificate: false,
    ),

    // Add more workshops here
  ];

  String? _statusFilter;
  String? _eventTypeFilter;
  String? _teamSizeFilter;
  String? _paymentFilter;
  String? _eligibilityFilter;
  String? _categoryFilter;
  TextEditingController _searchController = TextEditingController();

  void _filterWorkshops() {
    setState(() {
      // Implement filtering logic based on the selected filter options
    });
  }

  List<Workshops> _searchWorkshops(String query) {
    return workshops.where((workshop) => workshop.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Workshops"),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: WorkshopsSearch(workshops),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: Text('Live Only', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          onTap: () {
                            setState(() {
                              // Implement live only filter logic
                            });
                            Navigator.pop(context);
                          },
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Status', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select status'),
                            value: _statusFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _statusFilter = value;
                              });
                            },
                            items: ['Live', 'Expired', 'Closed', 'Recent'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Event Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select event type'),
                            value: _eventTypeFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _eventTypeFilter = value;
                              });
                            },
                            items: ['Online', 'Offline'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Team Size', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select team size'),
                            value: _teamSizeFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _teamSizeFilter = value;
                              });
                            },
                            items: ['1', '2', '3+'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Payment', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select payment'),
                            value: _paymentFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _paymentFilter = value;
                              });
                            },
                            items: ['Paid', 'Free'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Eligibility', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select eligibility'),
                            value: _eligibilityFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _eligibilityFilter = value;
                              });
                            },
                            items: ['Professionals', 'Startups', 'School Students', 'College Students'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        ListTile(
                          title: Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                          trailing: DropdownButton<String>(
                            hint: Text('Select category'),
                            value: _categoryFilter,
                            onChanged: (String? value) {
                              setState(() {
                                _categoryFilter = value;
                              });
                            },
                            items: ['Search', 'Data Analytics', 'Data Science', 'Product Focused', 'Programming'].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: _filterWorkshops,
                            child: Text('Apply Filters', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workshops.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkshopsDetailsPage(workshop: workshops[index]),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(workshops[index].name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: Icon(workshops[index].isLiked ? Icons.favorite : Icons.favorite_border),
                          onPressed: () {
                            setState(() {
                              workshops[index].isLiked = !workshops[index].isLiked;
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Text("Mode of Conducting: ${workshops[index].modeOfConducting}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Hashtags: ${workshops[index].hashtags.join(", ")}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    //Text("Registered People: ${workshops[index].registeredPeople}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Registration Deadline: ${workshops[index].registrationDeadline}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    //Text("Team Size: ${workshops[index].teamSize}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Eligibility Criteria: ${workshops[index].eligibilityCriteria}", style: TextStyle(fontSize: 16)),
                    SizedBox(height: 5),
                    Text("Stages and Timelines:", style: TextStyle(fontSize: 16)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: workshops[index].stagesAndTimelines.entries.map((entry) {
                        return Text("${entry.key}: ${entry.value}", style: TextStyle(fontSize: 16));
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class WorkshopsDetailsPage extends StatelessWidget {
  final Workshops workshop;

  WorkshopsDetailsPage({required this.workshop});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(workshop.name),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mode of Conducting:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue)),
            Text(workshop.modeOfConducting, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Hashtags:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            Text(workshop.hashtags.join(", "), style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            //Text("Registered People:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
            //Text(workshop.registeredPeople.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Registration Deadline:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
            Text(workshop.registrationDeadline.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            //Text("Team Size:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
            //Text(workshop.teamSize.toString(), style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Eligibility Criteria:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal)),
            Text(workshop.eligibilityCriteria, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Stages and Timelines:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.brown)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: workshop.stagesAndTimelines.entries.map((entry) {
                return Text("${entry.key}: ${entry.value}", style: TextStyle(fontSize: 16));
              }).toList(),
            ),
            SizedBox(height: 10),
            Text("Guidelines:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: workshop.Guidelines.entries.map((entry) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${entry.key}:", style: TextStyle(fontSize: 16)),
                    Text("  Duration: ${entry.value['duration']}", style: TextStyle(fontSize: 16)),
                    //Text("  Marks: ${entry.value['marks']}", style: TextStyle(fontSize: 16)),
                  ],
                );
              }).toList(),
            ),
            SizedBox(height: 10),
            Text("Workshops Information:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green)),
            Text(workshop.workshopInformation, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Contact the Organisers:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.orange)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Name: ${workshop.contactOrganisers['name']}", style: TextStyle(fontSize: 16)),
                Text("Mail: ${workshop.contactOrganisers['mail']}", style: TextStyle(fontSize: 16)),
                Text("Contact No: ${workshop.contactOrganisers['contactNo']}", style: TextStyle(fontSize: 16)),
              ],
            ),
            SizedBox(height: 10),
            //Text("Rewards and Prizes:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red)),
            // Text(workshop.rewardsAndPrizes, style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            Text("Participation Certificate:", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.purple)),
            Text(workshop.participationCertificate ? "Yes" : "No", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _launchURL(workshop.name);
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class WorkshopsSearch extends SearchDelegate<String> {
  final List<Workshops> workshops;

  WorkshopsSearch(this.workshops);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final List<Workshops> searchResults = query.isEmpty
        ? workshops
        : workshops.where((workshop) => workshop.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          onTap: () {
            close(context, searchResults[index].name);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<Workshops> searchResults = query.isEmpty
        ? workshops
        : workshops.where((workshop) => workshop.name.toLowerCase().contains(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: searchResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(searchResults[index].name),
          onTap: () {
            close(context, searchResults[index].name);
          },
        );
      },
    );
  }
}

void _launchURL(String workshopName) async {
  String url = "";
  if (workshopName == "NODE.JS WORKSHOP") {
    url = "https://lu.ma/";
  } else if (workshopName == "CYBER SECURITY WEBINAR") {
    url = "https://forms.gle/YeZCdAEzcPAf3ne56";
  }


  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

