import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableDriverStatus = 'Driver_Status';

class DriverStatusFields {
  //col names
  static final String id = "Driver_ID";
  static final String statusID = "_Status";
  static final String completed = "Completed";
  static final String incomplete = "Incomplete";
  static final String late = "Late";
}

class DriverStatus {
  final int driverID;
  final int statusID;
  final bool completed;
  final bool incomplete;
  final bool late;

  const DriverStatus({
    @required this.driverID,
    @required this.statusID,
    @required this.completed,
    @required this.incomplete,
    @required this.late,
  });

  Map<String, dynamic> toJson() => {
        DriverStatusFields.id: driverID,
        DriverStatusFields.statusID: statusID,
        DriverStatusFields.completed: completed ? 1 : 0,
        DriverStatusFields.incomplete: incomplete ? 1 : 0,
        DriverStatusFields.late: late ? 1 : 0
      };

  static DriverStatus fromJson(Map<String, Object> json) => DriverStatus(
      driverID: json[DriverStatusFields.id] as int,
      statusID: json[DriverStatusFields.statusID] as int,
      completed: json[DriverStatusFields.completed] == 1,
      incomplete: json[DriverStatusFields.incomplete] == 1,
      late: json[DriverStatusFields.late] == 1);
}
