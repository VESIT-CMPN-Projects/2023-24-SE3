import 'package:flutter/material.dart';
import 'package:infi_co/data.dart';
import 'package:infi_co/internship_detail.dart';

class Internships extends StatefulWidget {
  @override
  _InternshipsState createState() => _InternshipsState();
}

class _InternshipsState extends State<Internships> {
  List<Internship> internships = getInternships();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 32, left: 32, top: 48, bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.sort,
                size: 28,
              ),
              Row(
                children: [
                  Icon(
                    Icons.search,
                    size: 28,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  Icon(
                    Icons.filter_list,
                    size: 28,
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(right: 32, left: 32, top: 8, bottom: 20),
                  child: Text(
                    "Developer \nInternships \n at ISA-VESIT",
                    style: TextStyle(
                        fontSize: 32, fontWeight: FontWeight.bold, height: 1.2),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 16,
                    runSpacing: 16,
                    children: [
                      buildFilterOption("Developer"),
                      buildFilterOption("VESIT"),
                      //buildFilterOption(r"$30 - 50h"),
                      buildFilterOption("Part-Time"),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Recommended for you",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 190,
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: buildRecommendations(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Text(
                    "Recently added",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: buildLastInternships(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildFilterOption(String text) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 8,
            ),
            Icon(
              Icons.clear,
              size: 18,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildRecommendations() {
    List<Widget> list = [];
    list.add(SizedBox(
      width: 32,
    ));
    for (var i = 0; i < internships.length; i++) {
      list.add(buildRecommendation(internships[i]));
    }
    list.add(SizedBox(
      width: 16,
    ));
    return list;
  }

  Widget buildRecommendation(Internship internship) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InternshipDetail(internship: internship)),
        );
      },
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(internship.logo),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 4,
                    ),
                    child: Text(
                      internship.concept,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    internship.position,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildLastInternships() {
    List<Widget> list = [];
    for (var i = internships.length - 1; i > -1; i--) {
      list.add(buildLastInternship(internships[i]));
    }
    return list;
  }

  Widget buildLastInternship(Internship internship) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => InternshipDetail(internship: internship)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(bottom: 16),
        child: Row(
          children: [
            Container(
              height: 45,
              width: 45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(internship.logo),
                  fit: BoxFit.fitWidth,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    internship.position,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    internship.company,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}
