
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
      home: ISTEPage(),
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

class ISTEPage extends StatefulWidget {
  @override
  _ISTEPageState createState() => _ISTEPageState();
}

class _ISTEPageState extends State<ISTEPage> {
  List<Workshops> workshops = [
    Workshops(
      name: "GRE workshop",
      modeOfConducting: "Online, Google Meet",
      hashtags: ["Tech", "Coding"],
      //registeredPeople: 200,
      registrationDeadline: DateTime.now().add(Duration(days: 1)),
      //teamSize: 3,
      eligibilityCriteria: "S.E, T.E and MCA members",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 1)),
      },
      Guidelines: {
        "Day 1": {"duration": "2 hours"},
      },
      workshopInformation: "Description: To help one mak informed Decisio about Future Studies ",
      contactOrganisers: {"name": "Roshan Dadlani", "mail": "roshan@gmail.com", "contactNo": "1234567890"},
      //rewardsAndPrizes: "Cash prizes",
      participationCertificate: true,
    ),
    Workshops(
      name: "Instagram using Python workshop",
      modeOfConducting: "Offline, Venue: B31 & B21" ,
      hashtags: ["Design", "Creativity"],
      //registeredPeople: 150,
      registrationDeadline: DateTime.now().add(Duration(days: 2)),
      //teamSize: 2,
      eligibilityCriteria: "F.E, S.E, T.E, B.E, and MCA students",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 1)),
        "Stage 2": DateTime.now().add(Duration(days: 1)),
      },
      Guidelines: {
        "Day 1": {"duration": "1.5 hours"},
        "Day 2": {"duration": "2.5 hours"},
      },
      workshopInformation: " Description: To learn the basics of python language, tkinter and how to integrate an APIs database. ",
      contactOrganisers: {"name": "Shruti Mishra", "mail": "shruti@gmail.com", "contactNo": "9876543210"},
      //rewardsAndPrizes: "Gift vouchers",
      participationCertificate: false,
    ),
    Workshops(
      name: "Dalal Street",
      modeOfConducting: "Offline, Venue: B31 & B21" ,
      hashtags: ["Design", "Creativity"],
      //registeredPeople: 150,
      registrationDeadline: DateTime.now().add(Duration(days: 3)),
      //teamSize: 2,
      eligibilityCriteria: "F.E, S.E, T.E, B.E, and MCA students",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 1)),
        "Stage 2": DateTime.now().add(Duration(days: 1)),
        "Stage 2": DateTime.now().add(Duration(days: 1)),
      },
      Guidelines: {
        "Day 1": {"duration": "1 hours"},
        "Day 2": {"duration": "2 hours"},
        "Day 2": {"duration": "3 hours"},
      },
      workshopInformation: " Description: To apply their expertise in stock trading and strategise their investments to earn more to win",
      contactOrganisers: {"name": "Shreyas Khadapkar", "mail": "shreyas@gmail.com", "contactNo": "9876543210"},
      //rewardsAndPrizes: "Gift vouchers",
      participationCertificate: false,
    ),
    Workshops(
      name: "Technical Debate",
      modeOfConducting: "Online, Google Meet" ,
      hashtags: ["Tech", "Coding"],
      //registeredPeople: 150,
      registrationDeadline: DateTime.now().add(Duration(days: 4)),
      //teamSize: 2,
      eligibilityCriteria: "F.E, S.E, T.E, B.E, and MCA students",
      stagesAndTimelines: {
        "Stage 1": DateTime.now().add(Duration(days: 2)),
        "Stage 2": DateTime.now().add(Duration(days: 2)),
      },
      Guidelines: {
        "Day 1": {"duration": "1.5 hours"},
        "Day 2": {"duration": "2.5 hours"},
        "Day 3": {"duration": "1.5 hours"},
        "Day 4": {"duration": "2.5 hours"},
      },
      workshopInformation: " Description: To showcase Technical skills and soft skills. ",
      contactOrganisers: {"name": "Jatin Chhabria", "mail": "jatin@gmail.com", "contactNo": "9876543210"},
      //rewardsAndPrizes: "Gift vouchers",
      participationCertificate: true,
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
  if (workshopName == "GRE workshop") {
    url = "https://forms.gle/VL9RgeyZwRnzEh3x7";
  } else if (workshopName == "Instagram using Python workshop") {
    url = "https://forms.gle/sbt7B3CYGLXscrF18";
  }
  else if (workshopName == "Dalal Street") {
    url = "https://forms.gle/tWsN8bTTZQ4rXxo27";
  }
  else if (workshopName == "Technical Debate") {
    url = "https://forms.gle/CaAM8b73CWBh8GNr8";
  }

  if (await canLaunch(url)) {
    await launch(url);
  } else {
    print('Could not launch $url');
  }
}

