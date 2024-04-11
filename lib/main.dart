import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:infi_co/firebase_options.dart';
import 'package:infi_co/ieee_conferences.dart';
import 'package:infi_co/quiz_screen.dart';
import 'package:infi_co/comment_box.dart';
import 'package:infi_co/master.dart';
import 'package:infi_co/login.dart';
import 'package:infi_co/register.dart';
import 'package:infi_co/homepage.dart';
import 'package:infi_co/welcomepage.dart';
import 'package:infi_co/home_screen.dart';


void main() async {
  runApp(const MyApp());
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinity Corridor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: TestMe());
      //home: QuizScreen());
      //home: Master());
//         home: IEEEConferencesPage());
//
//
//
//   }
// }
      home: const MyWelcomepage(),
      initialRoute: 'welcomepage',
      routes: {
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'homepage': (context) => MyHomePage(),
        'welcomepage': (context) => MyWelcomepage(),
        'hackathon_updates': (context) => MyApp(),
        'ieee_conferences': (context) => IEEEConferencesPage(),
        'master': (context) => Master(),
        'comment_box': (context) => TestMe(),
        'quiz_screen': (context) => QuizScreen(),
        'home_screen': (context) => HomeScreen(),
      },
    );
  }
}

