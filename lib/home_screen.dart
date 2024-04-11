import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infi_co/csi.dart';
import 'package:infi_co/iste.dart';
import 'package:infi_co/ieee.dart';
import 'package:infi_co/isa.dart';

class HomeScreen extends StatelessWidget {
  Items item1 = new Items(
      title: "CSI",
      subtitle: "Computer Society of India",
      event: "3 Events",
      img: "assets/CSI.jpg");

  Items item2 = new Items(
    title: "ISTE",
    subtitle: "INDIAN SOCIETY FOR TECHNICAL EDUCATION ",
    event: "4 Events",
    img: "assets/ISTE.jpg",
  );
  Items item3 = new Items(
    title: "ISA",
    subtitle: "International Society of Automation",
    event: "4 Events",
    img: "assets/ISA.jpg",
  );
  Items item4 = new Items(
    title: "IEEE",
    subtitle: "Institute of Electrical and Electronics Engineers",
    event: "2 Events",
    img: "IEEE.jpg",
  );
  Items item5 = new Items(
    title: "GDSC",
    subtitle: "Google Developer Student Clubs",
    event: "4 Events",
    img: "assets/GDSC.jpg",
  );
  Items item6 = new Items(
    title: "CODECELL",
    subtitle: "Tinkerer's of Computer Department",
    event: "4 Events",
    img: "assets/CODECELL.jpg",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    return Scaffold(
      appBar: AppBar(
        title: Text('HOLA VESITIANS!'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 2),
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              if (data.title == "CSI") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WorkshopsPage(),
                  ),
                );
              } else if (data.title == "ISTE") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ISTEPage(),
                  ),
                );
              } else if (data.title == "ISA") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ISAPage(),
                  ),
                );
              } else if (data.title == "IEEE") {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IEEEPage(),
                  ),
                );
              }
            },
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Colors.black, Colors.pink],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    data.img,
                    width: 42,
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    data.subtitle,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white38,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 14,
                  ),
                  Text(
                    data.event,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items({
    required this.title,
    required this.subtitle,
    required this.event,
    required this.img,
  });
}
