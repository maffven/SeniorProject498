import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableMunicipalityAdmin = 'Municipality_Admin';

class MunicipalityAdminFields {
  static final List<String> values = [
    //add all fields
    id, firatName, lastName, password, email, phone
  ];

  //col names
  static final String id = "_Municipality_ID";
  static final String firatName = "First_name";
  static final String lastName = "Last_name";
  static final String password = "Password";
  static final String email = "Email";
  static final String phone = "Phone";
}

class MunicipalityAdmin {
  final int municpalityID;
  final String firatName;
  final String lastName;
  final String password;
  final String email;
  final int phone;

  const MunicipalityAdmin(
      {@required this.municpalityID,
      @required this.firatName,
      @required this.lastName,
      @required this.email,
      @required this.password,
      this.phone});

  //Convert MunicipalityAdmin object to json object
  Map<String, dynamic> toJson() => {
        MunicipalityAdminFields.email: email,
        MunicipalityAdminFields.id: municpalityID,
        MunicipalityAdminFields.firatName: firatName,
        MunicipalityAdminFields.lastName: lastName,
        MunicipalityAdminFields.password: password,
        MunicipalityAdminFields.phone: phone
      };

  MunicipalityAdmin copy(
          {int id,
          String firatName,
          String lastName,
          String password,
          String email,
          int phone}) =>
      MunicipalityAdmin(
          municpalityID: id ?? this.municpalityID,
          firatName: firatName ?? this.firatName,
          lastName: lastName ?? this.lastName,
          password: password ?? this.password,
          email: email ?? this.email,
          phone: phone ?? this.phone);

  //convert from json to MunicipalityAdmin
  static MunicipalityAdmin fromJson(Map<String, Object> json) =>
      MunicipalityAdmin(
          municpalityID: json[MunicipalityAdminFields.id] as int,
          firatName: json[MunicipalityAdminFields.firatName] as String,
          lastName: json[MunicipalityAdminFields.lastName] as String,
          password: json[MunicipalityAdminFields.password] as String,
          email: json[MunicipalityAdminFields.email] as String,
          phone: json[MunicipalityAdminFields.phone] as int);
}
