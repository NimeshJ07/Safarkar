import 'package:flutter/material.dart';

class GetStart extends StatelessWidget {
  const GetStart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                        Icon(Icons.assignment),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          "Getting Started",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Numbered text
                  buildNumberedText(
                      "1. The 'utsonmobile' application is developed in-house by Centre for Railway Information Systems (CRIS)."),
                  buildNumberedText(
                      "2. The 'utsonmobile' application is available for Android, Windows, and iOS-based smartphones. Users can download this application from Google Play Store, Windows App Store, and Apple Store respectively, free of cost."),
                  buildNumberedText(
                      "3. The passenger first will get registered by providing his/her mobile number, name, password, gender, and date of birth."),
                  buildNumberedText(
                      "4. Upon successful registration, Railway Wallet (R-WALLET) will be created automatically with zero balance to the passenger. There will be no extra cost for creating R-WALLET."),
                  buildNumberedText(
                      "5. R-WALLET can be recharged either at any of the UTS counters or through the recharge option available on the 'https://www.utsonmobile.indianrail.gov.in' website."),
                  buildNumberedText(
                      "6. Currently, Paperless Ticket can be booked for Journey Ticket, Season Ticket, and Platform Ticket. Platform Ticket booking is allowed for some selected stations only."),
                  buildNumberedText(
                      "7. In case the internet connection of the mobile is not up, then ticket booking is not allowed."),
                  buildNumberedText(
                      "8. No advance ticket booking is allowed, i.e., the journey date will always be the current date."),
                  buildNumberedText("9. Paperless Ticket:"),
                  buildNumberedText(
                      "  a. The passenger can book a paperless Journey Ticket, Season Ticket, and Platform Ticket through the mobile application, and the ticket will be delivered in the mobile application itself."),
                  buildNumberedText(
                      "  b. The passenger can travel without taking a hardcopy of the ticket."),
                  buildNumberedText(
                      "  c. Whenever Ticket Checking Staff asks for a ticket, the passenger will use the 'Show Ticket' option in the application."),
                  buildNumberedText(
                      "  d. The smartphone should be GPS enabled to book a paperless ticket."),
                  buildNumberedText(
                      "  e. Paperless tickets are not allowed for cancellation."),
                  buildNumberedText(
                      "  f. The journey should commence within one hour after booking a paperless ticket."),
                  buildNumberedText(
                      "  g. Season Ticket can be issued/renewed from the mobile application, and it will be valid from the next day of booking the ticket. No need for GPS for issue/renewal of Season Ticket."),
                  buildNumberedText(
                      "  h. Platform Ticket can also be booked from the mobile application."),
                  buildNumberedText(
                      "  i. In case the passenger is not able to show the ticket on mobile, then it is considered as ticketless travel."),
                  buildNumberedText("10. Paper Ticket:"),
                  buildNumberedText(
                      "  a. The passenger can book a ticket through the mobile application."),
                  buildNumberedText(
                      "  b. On booking a ticket, he/she will get Booking ID along with other ticket details."),
                  buildNumberedText(
                      "  c. The booking details will also be available in booking history."),
                  buildNumberedText(
                      "  d. The booking ID will also be conveyed through an SMS."),
                  buildNumberedText(
                      "  e. After booking a Paper ticket, the passenger can go to the journey originating (source) station to take a ticket printout from any of the ATVM/Co-TVM there, by entering his/her registered mobile number and booking ID."),
                  buildNumberedText(
                      "  f. The journey is valid only with a printed ticket."),
                  buildNumberedText(
                      "  g. The cancellation of Paper Ticket is allowed either at the counter after printing the ticket or through the application before printing the ticket. However, in both cases, cancellation fee is applicable."),
                  buildNumberedText(
                      "  h. The journey should commence within one hour after printing a paper ticket from ATVM/Co-TVM."),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNumberedText(String text) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(text),
          ),
        ],
      ),
    );
  }
}
