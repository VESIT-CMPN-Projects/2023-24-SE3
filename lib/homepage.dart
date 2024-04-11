import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:infi_co/comment_box.dart'; // Import the CommentsPage
import 'package:infi_co/master.dart';
import 'quiz_screen.dart'; // Import the QuizScreen
import 'package:infi_co/ieee_conferences.dart'; // Import the IeeeConferencesPage
import 'package:infi_co/hackathon_updates.dart';
import 'package:infi_co/home_screen.dart';

// class MyHomePage extends StatelessWidget {
//   const MyHomePage({Key? key});

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage>{

  // }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 30),
                    title: Text('Hello Dear Tripti!', style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                    )),
                    subtitle: Text('Enhance your coding\nskills with us!', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white54,
                    )),
                    trailing: const CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/profilepic.jpg'),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  ),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 40,
                  mainAxisSpacing: 30,
                  children: [
                    itemDashboard('College Events', CupertinoIcons.play_rectangle, Colors.deepOrange, context),
                    itemDashboard('IEEE\nConferences\n& Analytics', CupertinoIcons.graph_circle, Colors.green, context),
                    itemDashboard('Internships', CupertinoIcons.person_2, Colors.purple, context),
                    itemDashboard('Comments', CupertinoIcons.chat_bubble_2, Colors.brown, context),
                    itemDashboard('Quizzes', CupertinoIcons.money_dollar_circle, Colors.indigo, context),
                    itemDashboard('Hackathon', CupertinoIcons.add_circled, Colors.teal, context),
                    itemDashboard('About', CupertinoIcons.question_circle, Colors.blue, context),
                    itemDashboard('Contact', CupertinoIcons.phone, Colors.pinkAccent, context),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget itemDashboard(String title, IconData iconData, Color background, BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (title == 'Internships') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Master()),
          );
        } else if (title == 'Quizzes') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => QuizScreen()),
          );
        } else if (title == 'IEEE\nConferences\n& Analytics') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => IEEEConferencesPage()),
          );
        } else if (title == 'Comments') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TestMe()),
          );
        } else if (title == 'Hackathon') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HackathonUpdatesPage()),
          );
        } else if (title == 'College Events') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }

        // Add conditions for other menu items if needed

        // Handle navigation for other items here
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).primaryColor.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: background,
                shape: BoxShape.circle,
              ),
              child: Icon(iconData, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(title.toUpperCase(), style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ),
    );
  }
}

