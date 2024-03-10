import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/screens/Payment/payment.dart';
import 'package:safar_kar/src/features/authentication/screens/welcome/welcome.dart';

class SeasonalTicket extends StatelessWidget {
  const SeasonalTicket({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seasonal Ticket Display'),
      ),
      body: Container(
        color: Colors.yellow,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: Colors.yellow,
                child: const Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Center(
                        child: Icon(
                          Icons.emoji_emotions_outlined,
                          size: 50,
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Center(
                        child: Text(
                          'HAPPY JOURNEY',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Your Ticket Booked Successfully',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ), // Add spacing between the two containers
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, bottom: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
                    child: Container(
                      width: 350,
                      height: 650,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Text(
                                  "YOUR TICKET DETAILS",
                                  style: TextStyle(
                                      fontSize: 25, color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              left: 10.0,
                              right: 10.0,
                            ),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  'Ticket No. :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '123456789',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SEASONAL TICKET",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "100.00/-",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 15),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Name: ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('Safarkar Project',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                SizedBox(width: 70),
                                const Text(
                                  'Age : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('21',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Source Station",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "Destination Station",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, right: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "SION",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      "DADAR",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Adult : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('1',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                                SizedBox(width: 15),
                                const Text(
                                  'Child : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('0',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15.0)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  'Class : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('SECOND',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15.0)),
                                SizedBox(width: 40),
                                const Text(
                                  'Duration : ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 5),
                                const Text('MONTHLY',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15.0)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Paperless Ticket ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                const Text('27 KM',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 15.0)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                Text(
                                  'Validity :',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '01/01/2020 to 01/01/2020',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: Divider(
                              height: BorderSide.strokeAlignCenter,
                              color: Colors.grey.shade300,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "FOR MEDICAL EMERGENCY FIRST AID. CONTACT",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "TICKET CHECKING STAFF | GUARD OR DIAL 139 ",
                                      style: TextStyle(
                                          fontSize: 13,
                                          color: Colors.red,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the radius as needed
                              child: SizedBox(
                                width: 200.0,
                                child: TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    primary: tDarkColor,
                                  ),
                                  child: Text("SHOW QR"),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10.0, right: 10.0, top: 5.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(
                                  20.0), // Adjust the radius as needed
                              child: SizedBox(
                                width: 200.0,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(welcome());
                                  },
                                  style: TextButton.styleFrom(
                                    backgroundColor: tPrimaryColor,
                                    primary: tDarkColor,
                                  ),
                                  child: Text("DONE"),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
