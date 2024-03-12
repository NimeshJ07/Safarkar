import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/screens/AllTicket.dart';
import 'package:safar_kar/src/features/authentication/screens/Payment/payment.dart';
import 'package:safar_kar/src/features/authentication/screens/StudentCon.dart';
import 'package:safar_kar/src/features/authentication/screens/TicketDisplay.dart';
import 'package:safar_kar/src/features/authentication/screens/UsefulForYou/fares.dart';
import 'package:safar_kar/src/features/authentication/screens/UsefulForYou/map.dart';
import 'package:safar_kar/src/features/authentication/screens/UsefulForYou/penality.dart';

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
  TextEditingController ticketNumberController = TextEditingController();

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
  void initState() {
    super.initState();
    selectedImage = tBooking; // Set the default selected image to 'tBooking'
    showBookingDetails = true;
  }

  String? groupValue = 'issue';

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
        child: ListView(
          children: [
            //Layer 2
            Container(
              height: 150, // Adjust the height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  buildCircularImage(tBooking, 'Booking', 'Booking'),
                  buildCircularImage(
                      tPlatformTicket, 'Platform Ticket', 'Platform Ticket'),
                  buildCircularImage(
                      tSeasonalBooking, 'Seasonal Booking', 'Seasonal Booking'),
                  buildCircularImage(
                      tBookingHistory, 'Booking History', 'Booking History'),
                ],
              ),
            ),

            const Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),

            if (selectedImage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    if (showBookingDetails)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    "Ticket Booking",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
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
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Radio(
                                      value: 'Multiple',
                                      groupValue: platformTicketType,
                                      onChanged: (value) {
                                        setState(() {
                                          platformTicketType = "Multiple";
                                        });
                                      },
                                    ),
                                    Text('Multiple (Include with you)'),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.train_outlined),
                                            labelText: "Source",
                                            hintText:
                                                "Enter your Source Station",
                                            border: OutlineInputBorder(),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Text("-->",
                                          style: TextStyle(fontSize: 20.0)),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Expanded(
                                        child: TextFormField(
                                          decoration: const InputDecoration(
                                            prefixIcon:
                                                Icon(Icons.train_outlined),
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
                            SizedBox(height: 10.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the radius as needed
                              child: SizedBox(
                                width: 200.0,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(Payment());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    primary: tDarkColor,
                                  ),
                                  child: Text("Book Now"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    if (showPlatformTicketDetails)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    "Platform Ticket",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
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
                                Text('Multiple (Include with you)'),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50.0,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        prefixIcon: Icon(Icons.train_outlined),
                                        hintText: "Enter your Source Station",
                                        border: OutlineInputBorder(),
                                        contentPadding: EdgeInsets.symmetric(
                                            vertical: 12.0),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Visibility(
                                    visible: platformTicketType == 'Multiple',
                                    child: Container(
                                      height: 50.0,
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        decoration: const InputDecoration(
                                          prefixIcon:
                                              Icon(Icons.person_2_outlined),
                                          hintText: "Enter a Number of Person",
                                          border: OutlineInputBorder(),
                                          contentPadding: EdgeInsets.symmetric(
                                              vertical: 12.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: SizedBox(
                                width: 200.0,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(Payment());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    primary: tDarkColor,
                                  ),
                                  child: Text("Book Ticket"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    if (showSeasonalBookingDetails)
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0),
                                ),
                              ),
                              padding: const EdgeInsets.symmetric(
                                vertical: 10.0,
                                horizontal: 10.0,
                              ),
                              child: const Row(
                                children: [
                                  Text(
                                    "Seasonal Booking",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 15.0),
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 'issue',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue =
                                                          value as String?;
                                                    });
                                                  },
                                                ),
                                                Text('Issue Ticket'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Row(
                                              children: [
                                                Radio(
                                                  value: 'renew',
                                                  groupValue: groupValue,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      groupValue =
                                                          value as String?;
                                                    });
                                                  },
                                                ),
                                                Text('Renew Ticket'),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                if (groupValue ==
                                    'issue') // Conditionally show based on selection
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: sourceController,
                                            decoration: const InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.train_outlined),
                                              labelText: "Source",
                                              hintText:
                                                  "Enter your Source Station",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 8.0),
                                        Text("-->",
                                            style: TextStyle(fontSize: 20.0)),
                                        SizedBox(width: 8.0),
                                        Expanded(
                                          child: TextFormField(
                                            controller: destinationController,
                                            decoration: const InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.train_outlined),
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
                                if (groupValue ==
                                    'renew') // Conditionally show based on selection
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: TextFormField(
                                            controller: ticketNumberController,
                                            decoration: const InputDecoration(
                                              prefixIcon:
                                                  Icon(Icons.train_outlined),
                                              labelText: "Ticket Number",
                                              hintText:
                                                  "Enter Prevoius Ticket Number",
                                              border: OutlineInputBorder(),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: 10.0),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: SizedBox(
                                width: 200.0,
                                child: TextButton(
                                  onPressed: () {
                                    if (groupValue == 'renew') {
                                      if (ticketNumberController.text != null) {
                                        Get.to(StudentScreen(), arguments: {
                                          'ticketNumber':
                                              ticketNumberController.text,
                                        });
                                      }
                                    } else if (groupValue == 'issue') {
                                      if (sourceController.text != null &&
                                          destinationController.text != null) {
                                        Get.to(StudentScreen(), arguments: {
                                          'source': sourceController.text,
                                          'destination':
                                              destinationController.text,
                                        });
                                      }
                                    }
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    primary: tDarkColor,
                                  ),
                                  child: Text("Book Now"),
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    if (showBookingHistoryDetails)
                      Column(
                        children: [
                          Container(
                            width: 350,
                            height: 170,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    tWatermark2), // Setting the background image
                                fit: BoxFit.cover,
                                alignment: Alignment(0,
                                    -1.5), // Centering the image within the container
                                colorFilter: ColorFilter.mode(
                                  Colors.white.withOpacity(
                                      1), // Applying opacity (adjust the value as needed)
                                  BlendMode.dstATop,
                                ),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x33000000),
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Booked Ticket",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                "Fares : ",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                              Text(
                                                "20.00/-",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 50.0, right: 50.0, top: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Source ',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            'Destination',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Adult : 1',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'SECOND (||)',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'ORDINARY',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.only(
                                      left: 15.0, right: 15.0, top: 10.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            'Booking Date : 28/02/2024',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            'MTM : 202020222',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 10.0),
                                  child: Divider(
                                    height: BorderSide.strokeAlignCenter,
                                    color: Colors.grey.shade300,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10.0, right: 10.0, top: 10.0),
                                  child: InkWell(
                                    onTap: () {
                                      // Navigate to the new screen here
                                      Get.to(Ticket());
                                    },
                                    child: Row(
                                      children: [
                                        Icon(Icons.arrow_forward_outlined),
                                        SizedBox(width: 10.0),
                                        Text(
                                          "View Ticket",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
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
                              Get.to(AllTickets());
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                // Customize the container's appearance as needed
                                color: Color(
                                    0xFFFFE400), // Example background color
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
              ),

            const Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),

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

            Divider(height: 1, color: Color.fromRGBO(203, 199, 199, 1)),

            // Layer 3
            Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Useful for you",
                    style: TextStyle(
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      buildContainer(tCurrency, "Fares", () {
                        Get.to(Fares());
                        print("Fares pressed");
                      }),
                      SizedBox(width: 10.0),
                      buildContainer(tMaps, "Maps", () {
                        Get.to(Maps());
                        print("Maps pressed");
                      }),
                      SizedBox(width: 10.0),
                      buildContainer(tPenalty, "Penalties", () {
                        Get.to(Penalties());
                        print("Penalties pressed");
                      }),
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

  Widget buildCircularImage(String imageName, String imageType, String label) {
    bool isSelected = selectedImage == imageName;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          setState(() {
            selectedImage = imageName;
            showBookingDetails = (imageType == 'Booking');
            showPlatformTicketDetails = (imageType == 'Platform Ticket');
            showSeasonalBookingDetails = (imageType == 'Seasonal Booking');
            showBookingHistoryDetails = (imageType == 'Booking History');
          });
        }
      },
      child: Opacity(
        opacity: isSelected ? 1.0 : 0.5, // Adjust the opacity as needed
        child: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(imageName),
              ),
              SizedBox(height: 8), // Adjust the spacing between image and text
              Text(
                label,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildContainer(
      String assetImage, String label, VoidCallback onPressed) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
      ),
    );
  }
}
