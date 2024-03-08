import 'package:flutter/material.dart';

class PenaltyItem {
  final String title;
  final String description;
  final String body;
  final String section;

  PenaltyItem({
    required this.title,
    required this.description,
    required this.body,
    required this.section,
  });
}

class Penalties extends StatelessWidget {
  final List<PenaltyItem> penaltiesList = [
    PenaltyItem(
      title: "Travelling Fraudulently",
      description: "6 months jail, Fine Rs 1,000/- or both",
      body: "",
      section: "Sec. 137 Railway Act",
    ),
    PenaltyItem(
      title: "Travelling without proper pass/ticket",
      description:
          "Ticket fate + excess charge i.e 250/- or equivalent to the fare whichever is more",
      body:
          "Oridnary single fare for the distance which he has travelled or from the station from which the train started and the excess charge i.e 250/- or equivalent to the fare whichever is more",
      section: "Sec. 138 Railway Act",
    ),
    PenaltyItem(
        title: "Alarm Chain Pulling",
        description: "12 months jail, fine Rs 1,000/- or both",
        body: "",
        section: "Sec. 141 Railway Act"),
    PenaltyItem(
        title: "Touting",
        description: "3 years jail, fine Rs 10,000/- or both",
        body: "",
        section: "Sec. 143 Railway Act"),
    PenaltyItem(
        title: "Unauthorized Hawking",
        description: "1 years jail, Rs 1,000/- to Rs. 2,000/- or both",
        body: "",
        section: "Sec. 144 Railway Act"),
    PenaltyItem(
        title: "Nuisance and Littering",
        description:
            "1st offence fine Rs 100/- anf 2nd & subsequent Rs. 250/-, one month imprisonment",
        body: "",
        section: "Sec. 145 (b) Railway Act"),
    PenaltyItem(
        title: "Trespassing",
        description: "6 months jail, fine Rs 1,000/- or both",
        body: "",
        section: "Sec. 147 Railway Act"),
    PenaltyItem(
        title: "Travelling in Coach Reserved for Handicapped Passenger",
        description: "3 months jail, fine Rs 500/- or both",
        body: "",
        section: "Sec. 155 (a) Railway Act"),
    PenaltyItem(
        title: "Travelling on Roof Top",
        description: "3 months jail, fine Rs 500/- or both",
        body: "",
        section: "Sec. 156 Railway Act"),
    PenaltyItem(
        title: "Travelling in Coach Reserved for Ladies Passengers",
        description:
            "Fine upto Rs. 500/- ticket will be forfeited and passenger removed from the compartment",
        body:
            "If any male passengers is detected travelling, in coach reserved exclusively for ladies",
        section: "Section 162"),
    PenaltyItem(
        title: "Dangerous Explosive Goods",
        description:
            "Imprisonment upto 3 years or fine fine upto Rs 1,000/- or both ",
        body:
            "If any person takes with him dangerous or explosive goods into rail premises without prior permission",
        section: "Section 164"),
    PenaltyItem(
        title: "Bill Pasting",
        description: "6 months jail, fine Rs 500/- or both",
        body: "",
        section: "Sec. 166 (b) Railway Act")
    // Add more PenaltyItem objects for each penalty...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RAILWAY PENALTIES'),
        backgroundColor: Colors.yellow,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: penaltiesList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                PenaltyCard(penalty: penaltiesList[index]),
                const SizedBox(height: 16.0), // Add space between cards
              ],
            );
          },
        ),
      ),
    );
  }
}

class PenaltyCard extends StatelessWidget {
  final PenaltyItem penalty;

  PenaltyCard({required this.penalty});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              penalty.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.only(top: 5.0),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 241, 240),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 239, 91, 80),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              bottomLeft: Radius.circular(10.0),
                            ),
                          ),
                          child: const Text(
                            "Penalty",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Text(
                              penalty.description,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 10.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (penalty.body.isNotEmpty) // Check if body is not empty
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  penalty.body,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            const SizedBox(height: 10.0),
            Text(
              penalty.section,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
