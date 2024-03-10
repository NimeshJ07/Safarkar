import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:safar_kar/src/constants/colors.dart';
import 'package:safar_kar/src/features/authentication/screens/Payment/payment.dart';
import 'package:safar_kar/src/features/authentication/screens/SeasonalTickets/SeasonalSummary.dart';
import 'package:safar_kar/src/features/authentication/screens/SeasonalTickets/SeasonalTicket.dart';

class StudentScreen extends StatefulWidget {
  const StudentScreen({Key? key}) : super(key: key);

  @override
  _StudentScreenState createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  bool? isStudent = false;
  String defaultTitleTG = "M";
  String defaultTitleTC = "S";
  String defaultTitleTD = "M";
  String defaultTitleTCd = "A";
  DateTime? selectedDate;

  List tGender = [
    {"title": "Male", "value": "M"},
    {"title": "Female", "value": "F"},
    {"title": "Trans", "value": "T"},
  ];

  List tClass = [
    {"title": "First (I)", "value": "F"},
    {"title": "Second (II)", "value": "S"},
  ];

  List tDuration = [
    {"title": "Monthly", "value": "M"},
    {"title": "Quarterly", "value": "Q"},
    {"title": "Yearly", "value": "Y"},
  ];

  List tCard = [
    {"title": "Aadhar Card", "value": "A"},
    {"title": "Pan Card", "value": "P"},
  ];

  TextEditingController ticketNumberController = TextEditingController();
  @override
  void initState() {
    super.initState();
    retrieveTicketNumber();
  }

  void retrieveTicketNumber() {
    final Map? args = Get.arguments;
    if (args != null) {
      final String? ticketNumber = args['ticketNumber'] as String?;
      if (ticketNumber != null && ticketNumber.isNotEmpty) {
        // If ticket number is present, remove radio selection
        setState(() {
          isStudent = null;
          ticketNumberController.text = ticketNumber;
        });
      } else {
        // If no ticket number, automatically select "Yes" radio button
        setState(() {
          isStudent = false;
        });
      }
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            colorScheme: ColorScheme.light(primary: Colors.blue),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = DateTime(picked.year, picked.month, picked.day);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                    "Student Concession Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.only(left: 10.0, right: 10.0),
              children: [
                _buildStudentSelection(),
                _buildTextField("Enter your Name", Icons.person_2_rounded),
                _buildDateField("Select DOB", Icons.calendar_today),
                if (isStudent == true)
                  _buildTextField("Enter your College Name",
                      Icons.vertical_shades_closed_rounded),
                if (isStudent == true)
                  _buildNumericTextField(
                      "Enter Concession Number", Icons.numbers_rounded),
                _buildTextField(
                    "Enter your Source Station", Icons.train_rounded),
                _buildTextField(
                    "Enter your Destination Station", Icons.train_rounded),
                _buildDropdown("Gender :", tGender, defaultTitleTG),
                _buildDropdown("Class :", tClass, defaultTitleTC),
                _buildDropdown("Duration :", tDuration, defaultTitleTD),
                _buildCardDropdown(),
                if (defaultTitleTCd == 'A')
                  _buildTextField(
                      "Enter Aadhar Card Number", Icons.credit_card),
                if (defaultTitleTCd == 'P')
                  _buildTextField("Enter PAN Card Number", Icons.credit_card),
                _buildButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentSelection() {
    if (isStudent == null) {
      return SizedBox(); // Return an empty widget if ticket number is present
    }

    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Are You a Student ?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _buildRadioButton(true, "Yes"),
              _buildRadioButton(false, "No"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String hintText, IconData prefixIcon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: 50.0,
        child: TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String hintText, IconData prefixIcon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: 50,
        child: TextField(
          readOnly: true,
          controller: TextEditingController(
            text: selectedDate != null
                ? DateFormat('yyyy-MM-dd').format(selectedDate!)
                : "",
          ),
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: Icon(prefixIcon),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0),
          ),
          onTap: () => _selectDate(context),
        ),
      ),
    );
  }

  Widget _buildNumericTextField(String hintText, IconData prefixIcon) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
      child: Container(
        height: 50.0,
        child: TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixIcon: Icon(prefixIcon),
            hintText: hintText,
            border: OutlineInputBorder(),
            contentPadding: EdgeInsets.symmetric(vertical: 12.0),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdown(String label, List items, String value) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 22.0),
              ],
            ),
            Expanded(
              child: DropdownButton(
                value: value,
                isExpanded: true,
                underline: Container(
                  height: 2,
                  width: 10,
                  color: Colors.yellow,
                ),
                items: items.map<DropdownMenuItem<String>>((e) {
                  return DropdownMenuItem(
                    child: Text(e['title']!),
                    value: e['value'],
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    value = newValue.toString();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardDropdown() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: Container(
        height: 50.0,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Select Card :',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    SizedBox(width: 10.0),
                  ],
                ),
                Expanded(
                  child: DropdownButton(
                    value: defaultTitleTCd,
                    isExpanded: true,
                    underline: Container(
                      height: 2,
                      width: 10,
                      color: Colors.yellow,
                    ),
                    items: tCard.map<DropdownMenuItem<String>>((e) {
                      return DropdownMenuItem(
                        child: Text(e['title']),
                        value: e['value'],
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        defaultTitleTCd = newValue.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioButton(bool value, String label) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: isStudent,
          onChanged: (newValue) {
            setState(() {
              isStudent = newValue as bool?;
            });
          },
        ),
        Text(label),
      ],
    );
  }

  Widget _buildButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(20.0), // Adjust the radius as needed
        child: SizedBox(
          width: 200.0,
          child: TextButton(
            onPressed: () {
              Get.to(SeasonalSummary());
            },
            style: TextButton.styleFrom(
              backgroundColor: tPrimaryColor,
              primary: tDarkColor,
            ),
            child: Text("Book Ticket"),
          ),
        ),
      ),
    );
  }
}
