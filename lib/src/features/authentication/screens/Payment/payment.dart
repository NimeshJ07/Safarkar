import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:safar_kar/src/constants/image_string.dart';
import 'package:safar_kar/src/features/authentication/screens/profile/profile.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List ticketTypes = [
    {"title": "Journey", "value": "J"},
    {"title": "Return", "value": "R"},
  ];

  String defaultTitleTT = "J";

  List tClass = [
    {"title": "First (I)", "value": "F"},
    {"title": "Second (II)", "value": "S"},
  ];

  String defaultTitleTC = "S";

  List tPayment = [
    {"title": "Wallet", "value": "W"},
    {"title": "Others", "value": "O"},
  ];

  String defaultTitleTP = "W";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 246, 246),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: [
              // Normal Ticket Text
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.folder_copy_sharp),
                      SizedBox(width: 10.0),
                      Text(
                        "Normal Ticket",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              // Dropdown 1
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Train Type',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          DropdownButton(
                            value: defaultTitleTT,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              width: 10,
                              color: Colors.yellow,
                            ),
                            items: [
                              ...ticketTypes.map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem(
                                  child: Text(e['title']),
                                  value: e['value'],
                                );
                              }).toList(),
                            ],
                            onChanged: (value) {
                              setState(() {
                                defaultTitleTT = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Class',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          DropdownButton(
                            value: defaultTitleTC,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              width: 10,
                              color: Colors.yellow,
                            ),
                            items: [
                              ...tClass.map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem(
                                  child: Text(e['title']),
                                  value: e['value'],
                                );
                              }).toList(),
                            ],
                            onChanged: (value) {
                              setState(() {
                                defaultTitleTC = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'No. of Tickets',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Container(
                            child: const TextField(
                              keyboardType: TextInputType.number,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 2.0),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.yellow, width: 2.0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5.0),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Payment',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          DropdownButton(
                            value: defaultTitleTP,
                            isExpanded: true,
                            underline: Container(
                              height: 2,
                              width: 10,
                              color: Colors.yellow,
                            ),
                            items: [
                              ...tPayment.map<DropdownMenuItem<String>>((e) {
                                return DropdownMenuItem(
                                  child: Text(e['title']),
                                  value: e['value'],
                                );
                              }).toList(),
                            ],
                            onChanged: (value) {
                              setState(() {
                                defaultTitleTP = value!;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: EdgeInsets.all(10.0),
                child: Container(
                  color: Color.fromARGB(255, 222, 219, 219),
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                    horizontal: 10.0,
                  ),
                  child: const Row(
                    children: [
                      Text(
                        "Ticket Summary",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Source Station',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 96, 86, 2))),
                    Text('Destination Station',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 96, 86, 2))),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'SION',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                    ),
                    Text('PAREL',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
                child: Divider(
                  height: BorderSide.strokeAlignCenter,
                  color: Colors.grey.shade300,
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('Via : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 96, 86, 2))),
                    Text('DADAR',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 5.0,
                ),
                child: Divider(
                  height: BorderSide.strokeAlignCenter,
                  color: Colors.grey.shade300,
                ),
              ),

              // Generated code for this Row Widget...
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Adult : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 86, 2)),
                    ),
                    const Text('1',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    const Text(
                      'Child : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 86, 2)),
                    ),
                    const Text('0',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                    ),
                    const Text(
                      'Class Type : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 86, 2)),
                    ),
                    const Text('SECOND',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                  ],
                ),
              ),

              Padding(
                padding: EdgeInsets.only(
                  left: 15.0,
                  right: 15.0,
                  top: 5.0,
                ),
                child: Divider(
                  height: BorderSide.strokeAlignCenter,
                  color: Colors.grey.shade300,
                ),
              ),

              // Generated code for this Row Widget...
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'Ticket Type : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 96, 86, 2)),
                    ),
                    const Text('Journey',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                    VerticalDivider(
                      color: Colors.grey.shade300,
                    ),
                    const Text('Train Type : ',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 96, 86, 2))),
                    const Text('Ordinary',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15.0)),
                  ],
                ),
              ),

              // Generated code for this Column Widget...
              Padding(
                padding: EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Container(
                  color: Color.fromARGB(255, 222, 219, 219),
                  width: 320,
                  height: 60,
                  child: const Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          'Total fare : ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        '\$10/-',
                        style: TextStyle(
                          fontFamily: 'Plus Jakarta Sans',
                          color: Color(0xFFDD0F0F),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Generated code for this Text Widget...
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text(
                  'JOURNEY SHOULD COMMENCE WITHIN 1 HOUR',
                  style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Color(0xFFF40C31),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Generated code for this Button Widget...
              Padding(
                padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  onPressed: () {
                    print('Button pressed ...');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow,
                    elevation: 3,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'BOOK TICKET',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
