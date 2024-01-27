import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String phoneno;
  final String address;
  final String dob;
  final String pass;

  const UserModel({
    this.id,
    required this.fullname,
    required this.email,
    required this.phoneno,
    required this.address,
    required this.dob,
    required this.pass,
  });

  Map<String, dynamic> toJson() {
    return {
      "Full-Name": fullname,
      "E-Mail": email,
      "Phone-no": phoneno,
      "Address": address,
      "D.O.B": dob,
      "Password": pass,
    };
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
        id: document.id,
        fullname: data["Full-Name"],
        email: data["E-Mail"],
        phoneno: data["Phone-no"],
        address: data["Address"],
        dob: data["D.O.B"],
        pass: data["Password"]);
  }
}
