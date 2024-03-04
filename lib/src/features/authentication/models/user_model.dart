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

  factory UserModel.fromJson(Map<String, dynamic> json, String id) {
    return UserModel(
      id: id,
      fullname: json["Full-Name"] ?? '',
      email: json["E-Mail"] ?? '',
      phoneno: json["Phone-no"] ?? '',
      address: json["Address"] ?? '',
      dob: json["D.O.B"] ?? '',
      pass: json["Password"] ?? '',
    );
  }

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel.fromJson(data, document.id);
  }
}
