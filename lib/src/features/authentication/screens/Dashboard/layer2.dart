import 'package:flutter/material.dart';
import 'package:safar_kar/src/constants/image_string.dart';

class Layer2 extends StatefulWidget {
  const Layer2({Key? key}) : super(key: key);

  @override
  _Layer2State createState() => _Layer2State();
}

class _Layer2State extends State<Layer2> {
  String selectedImage = '';
  bool showBookingDetails = false;
  bool showPlatformTicketDetails = false;
  bool showSeasonalBookingDetails = false;
  bool showBookingHistoryDetails = false;

  String platformTicketType = 'Individual';

  TextEditingController sourceController = TextEditingController();
  TextEditingController numberOfTicketsController = TextEditingController();
  TextEditingController destinationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              buildCircularImage(context, tBooking, 'Booking'),
              buildCircularImage(context, tPlatformTicket, 'Platform Ticket'),
              buildCircularImage(context, tSeasonalBooking, 'Seasonal Booking'),
              buildCircularImage(context, tBookingHistory, 'Booking History'),
            ],
          ),
        ),
        if (selectedImage.isNotEmpty)
          Column(
            children: [
              // 1 Circle
              if (showBookingDetails)
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Ticket Booking",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5.0),
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
                    TextField(
                      decoration: InputDecoration(labelText: 'Source'),
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Destination'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle booking button click
                        // You can add logic here to process the booking
                      },
                      child: Text('Book Now'),
                    ),
                  ],
                ),

              // 2nd Circle
              if (showPlatformTicketDetails)
                Column(
                  children: [
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
                    TextField(
                      controller: sourceController,
                      decoration: InputDecoration(labelText: 'Source'),
                    ),
                    TextField(
                      controller: numberOfTicketsController,
                      decoration: InputDecoration(
                        labelText: 'Number of Tickets',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle book button click for platform ticket
                        // You can add logic here to process the platform ticket booking
                      },
                      child: Text('Book'),
                    ),
                  ],
                ),

              // 3rd Circle
              if (showSeasonalBookingDetails)
                Column(
                  children: [
                    Text(
                      "Seasonal Booking",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    TextField(
                      controller: sourceController,
                      decoration: InputDecoration(labelText: 'Source'),
                    ),
                    TextField(
                      controller: destinationController,
                      decoration: InputDecoration(labelText: 'Destination'),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle seasonal booking button click
                        // You can add logic here to process the seasonal booking
                      },
                      child: Text('Book'),
                    ),
                  ],
                ),

              // 4th Circle
              if (showBookingHistoryDetails)
                Column(
                  children: [
                    Text(
                      "Booking History",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text('Latest Ticket: Ticket Details'),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        // Handle more button click for booking history
                        // You can add logic here to navigate to a new page displaying all tickets
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AllTicketsScreen(),
                          ),
                        );
                      },
                      child: Text('More'),
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
      ],
    );
  }

  Widget buildCircularImage(
      BuildContext context, String imageName, String imageType) {
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
