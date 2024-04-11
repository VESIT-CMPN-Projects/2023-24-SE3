class NavigationItem {

  String title;

  NavigationItem(this.title);

}

List<NavigationItem> getNavigationItemList(){
  return <NavigationItem>[
    NavigationItem("Internships"),
    NavigationItem("Applications"),
  ];
}

class Application {

  String position;
  String company;
  String status;
  String price;
  String logo;

  Application(this.position, this.company, this.status, this.price, this.logo);

}

List<Application> getApplications(){
  return <Application>[
    Application("UI / UX Designer", "Nike Inc.", "Delivered", "", "assets/nike.png"),
    Application("Product Designer", "Google LLC", "Opened", "", "assets/google.png"),
    Application("Computer Graphics Developer", "Uber Technologies Inc.", "Cancelled", "", "assets/uber.png"),
    Application("Lead UI / UX Designer", "Apple Inc.", "Delivered", "", "assets/apple.png"),
    Application("UI Designer", "Amazon Inc.", "Not selected", "", "assets/amazon.jpg"),
  ];
}

class Internship {

  String position;
  String company;
  String price;
  String concept;
  String logo;
  String city;

  Internship(this.position, this.company, this.price, this.concept, this.logo, this.city);

}

List<Internship> getInternships(){
  return <Internship>[
    Internship("UI/UX", "Nike Inc.", "", "Full-Time", "assets/nike.png", "Bangalore, India"),
    Internship("Product Designer", "Google LLC", "", "Part-Time", "assets/google.png", "Hyderabad, India"),
    Internship("UI / UX Designer", "Uber Technologies Inc.", "", "Full-Time", "assets/uber.png", "Mumbai, India"),
    Internship("Lead UI/UX Designer", "Apple Inc.", "", "Part-Time", "assets/apple.png", "Mumbai, India"),
    Internship("Flutter Developer", "Amazon Inc.", "", "Full-Time", "assets/amazon.jpg", "Delhi, India"),
  ];
}

List<String> getInternshipsRequirements(){
  return <String>[
    "Exceptional communication skills and team-working skills",
    "Know the principles of animation and you can create high fidelity prototypes",
    "Direct experience using Adobe Premiere, Adobe After Effects & other tools used to create videos, animations, etc.",
    "Good UI/UX knowledge",
  ];
}