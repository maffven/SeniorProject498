import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableDriver = 'Driver';

class DriverFields {
  //col names
  static final String driverID = "_Driver_ID";
  static final String municpalityID = "_Municipality_ID";
  static final String firatName = "First_name";
  static final String lastName = "Last_name";
  static final String password = "Password";
  static final String email = "Email";
  static final String phone = "Phone";
  static final String workTime = "Work_time";
}

class Driver {
  final int driverID;
  final int municpalityID;
  final String firatName;
  final String lastName;
  final String password;
  final String email;
  final int phone;
  final String workTime;

  const Driver({
    @required this.driverID,
    @required this.municpalityID,
    @required this.firatName,
    @required this.lastName,
    @required this.password,
    @required this.email,
    @required this.phone,
    @required this.workTime,
  });

  Map<String, dynamic> toJson() => {
        DriverFields.driverID: driverID,
        DriverFields.municpalityID: municpalityID,
        DriverFields.firatName: firatName,
        DriverFields.lastName: lastName,
        DriverFields.password: password,
        DriverFields.email: email,
        DriverFields.phone: phone,
        DriverFields.workTime: workTime,
      };
}
