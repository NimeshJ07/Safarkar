import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/screens/Payment/payment.dart';
import 'Dashboard/layer2.dart';
import 'package:safar_kar/src/features/authentication/screens/profile/profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
    );
  }
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String selectedImage = '';
  bool showBookingDetails = false;
  bool showPlatformTicketDetails = false;
  bool showSeasonalBookingDetails = false;
  bool showBookingHistoryDetails = false;

  String platformTicketType = 'Individual';

  TextEditingController sourceController = TextEditingController();
  TextEditingController numberOfTicketsController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  int _selectedIndex = 0;
  static List<Widget> _screens = [Dashboard(), StudentScreen(), Profile()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Get.to(_screens[index]);
        break;
      case 1:
        Get.to(_screens[index]);
        break;
      case 2:
        Get.to(_screens[index]);
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Layer 1
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          "SafarKar",
          style: Theme.of(context).textTheme.headline6,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            child: IconButton(
              onPressed: () {
                Get.to(Profile());
              },
              icon: const Image(
                image: AssetImage(tProfile),
              ),
            ),
          )
        ],
      ),

      body: Container(
        color: Color.fromARGB(255, 235, 241, 247),
        child: ListView(
          children: [
            //Layer 2
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCircularImage(tBooking, 'Booking'),
                  buildCircularImage(tPlatformTicket, 'Platform Ticket'),
                  buildCircularImage(tSeasonalBooking, 'Seasonal Booking'),
                  buildCircularImage(tBookingHistory, 'Booking History'),
                ],
              ),
            ),
            SizedBox(height: 20),
            Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),
            if (selectedImage.isNotEmpty)
              Column(
                children: [
                  if (showBookingDetails)
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          "Ticket Booking",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'Individual',
                              groupValue: platformTicketType,
                              onChanged: (value) {
                                setState(() {
                                  platformTicketType = "Individual";
                                });
                              },
                            ),
                            Text('Individual'),
                            Radio(
                              value: 'Multiple',
                              groupValue: platformTicketType,
                              onChanged: (value) {
                                setState(() {
                                  platformTicketType = "Multiple";
                                });
                              },
                            ),
                            Text('Multiple'),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right:
                                      20.0), // Adjust the left margin as needed
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.train_outlined),
                                        labelText: "Source",
                                        hintText: "Enter your Source Station",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between the text fields and -->
                                  Text("-->", style: TextStyle(fontSize: 20.0)),
                                  SizedBox(width: 8.0), // Add some more spacing
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.train_outlined),
                                        labelText: "Destination",
                                        hintText:
                                            "Enter your Destination Station",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 200.0,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(Payment());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              foregroundColor: tDarkColor,
                            ),
                            child: const Text("Book Now"),
                          ),
                        ),
                      ],
                    ),
                  if (showPlatformTicketDetails)
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          "Platform Booking",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Radio(
                              value: 'Individual',
                              groupValue: platformTicketType,
                              onChanged: (value) {
                                setState(() {
                                  platformTicketType = "Individual";
                                });
                              },
                            ),
                            Text('Individual'),
                            Radio(
                              value: 'Multiple',
                              groupValue: platformTicketType,
                              onChanged: (value) {
                                setState(() {
                                  platformTicketType = "Multiple";
                                });
                              },
                            ),
                            Text('Multiple'),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            children: [
                              TextFormField(
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.train_outlined),
                                  labelText: "Source",
                                  hintText: "Enter your Source Station",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                              SizedBox(height: 20),
                              TextFormField(
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                  labelText: "Person",
                                  hintText: "Enter a Number of Person",
                                  border: OutlineInputBorder(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 200.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              foregroundColor: tDarkColor,
                            ),
                            child: const Text("Book Ticket"),
                          ),
                        ),
                      ],
                    ),
                  if (showSeasonalBookingDetails)
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          "Seasonal Booking",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right:
                                      20.0), // Adjust the left margin as needed
                              child: Row(
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.train_outlined),
                                        labelText: "Source",
                                        hintText: "Enter your Source Station",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      width:
                                          8.0), // Add some spacing between the text fields and -->
                                  Text("-->", style: TextStyle(fontSize: 20.0)),
                                  SizedBox(width: 8.0), // Add some more spacing
                                  Expanded(
                                    child: TextFormField(
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.train_outlined),
                                        labelText: "Destination",
                                        hintText:
                                            "Enter your Destination Station",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0),
                        SizedBox(
                          width: 200.0,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: tPrimaryColor,
                              foregroundColor: tDarkColor,
                            ),
                            child: const Text("Book Now"),
                          ),
                        ),
                      ],
                    ),
                  if (showBookingHistoryDetails)
                    Column(
                      children: [
                        SizedBox(height: 10.0),
                        Text(
                          "Booking History",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
                        Container(
                          width: 320,
                          height: 180,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x33000000),
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    color: Color(0xFFFFE400),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Flexible(
                                          child: Text(
                                            'Booked Ticket',
                                            textAlign: TextAlign.justify,
                                            style: TextStyle(
                                              fontFamily: 'Readex Pro',
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey[300],
                                        ),
                                        Text(
                                          'Fare : \$20',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Source ',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Text(
                                        'Destination',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                            padding:
                                                EdgeInsets.only(left: 20.0)),
                                        Text(
                                          'Via : CLA',
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Adult : 1',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Text(
                                        'SECOND (||)',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Text(
                                        'ORDINARY',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Booking Date : 28/02/2024',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 40,
                                        child: VerticalDivider(
                                          thickness: 1,
                                          color: Colors.grey[300],
                                        ),
                                      ),
                                      Text(
                                        'MTM : 202020222',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color.fromARGB(255, 1, 222, 82)
                                        .withOpacity(0.1),
                                  ),
                                  padding: EdgeInsets.all(50),
                                  child: Transform.rotate(
                                    angle: -20 * 3.141592653589793 / 180,
                                    child: Text(
                                      'BOOKED',
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 158, 158, 157),
                                        fontWeight: FontWeight.bold,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            // Handle more button click for booking history
                            // You can add logic here to navigate to a new page displaying all tickets
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AllTicketsScreen(),
                              ),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              // Customize the container's appearance as needed
                              color:
                                  Color(0xFFFFE400), // Example background color
                              borderRadius: BorderRadius.circular(
                                  8), // Example border radius
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Icon(
                                //   Icons.more_horiz,
                                //   color: Colors.white, // Example icon color
                                // ),
                                Text(
                                  'View All',
                                  style: TextStyle(
                                    color: Colors.black, // Example text color
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!showBookingDetails &&
                      !showPlatformTicketDetails &&
                      !showSeasonalBookingDetails &&
                      !showBookingHistoryDetails)
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          showBookingDetails = true;
                        });
                      },
                      child: Text(
                        'Click to book',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                ],
              ),
            SizedBox(height: 20),
            Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),

            //Layer 3
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "Nearby Stations",
                        style: TextStyle(
                          fontSize: 15.0,
                          // fontWeight: FontWeight.bol,
                        ),
                      ),
                      SizedBox(width: 20.0),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.train_outlined, size: 30.0),
                      SizedBox(
                          width: 10), // Add some spacing between icon and text
                      Text(
                        "Kurla (1.2 km)",
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Spacer(),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),

            // Layer 3
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Useful for you",
                    style: TextStyle(
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 100.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildContainer(tCurrency, "Fares"),
                            SizedBox(width: 10.0), // Adjust the width as needed
                            buildContainer(tMaps, "Maps"),
                            SizedBox(width: 10.0), // Adjust the width as needed
                            buildContainer(tPenalty, "Penalties"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // Layer 5
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Student',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget buildCircularImage(String imageName, String imageType) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedImage = imageName;
          showBookingDetails = (imageType == 'Booking');
          showPlatformTicketDetails = (imageType == 'Platform Ticket');
          showSeasonalBookingDetails = (imageType == 'Seasonal Booking');
          showBookingHistoryDetails = (imageType == 'Booking History');
        });
      },
      child: Container(
        margin: EdgeInsets.all(8),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: AssetImage(imageName),
        ),
      ),
    );
  }
}

Widget buildContainer(String assetImage, String label) {
  return Container(
    width: 100.0, // Set a fixed width
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Color.fromARGB(255, 245, 242, 242),
      borderRadius: BorderRadius.circular(10.0),
    ),
    child: Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(assetImage),
          height: 40.0,
          width: 40.0,
        ),
        SizedBox(height: 8.0),
        Text(label),
      ],
    ),
  );
}

class AllTicketsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('All Tickets'),
      ),
      body: Center(
        child: Text('Display all tickets here'),
      ),
    );
  }
}

class StudentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Screen'),
      ),
      body: Center(
        child: Text('Content of Student Screen'),
      ),
    );
  }
}
