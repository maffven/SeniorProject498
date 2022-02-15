//import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableComplaints = 'complaints';

class ComplaintsFields {
  static final List<String> values = [
    //add all fields
    id, complaintMessage, status, subject, date, binID, driverID
  ];
  static final String id = '_complaintID';
  static final String complaintMessage = 'complaintMessage';
  static final String status = 'status';
  static final String subject = 'subject';
  static final String date = 'date';
  static final String binID = '_binID';
  static final String driverID = '_driverID';
}

class Complaints {
  final int complaintID;
  final String complaintMessage;
  final String status;
  final String subject;
  final DateTime date;
  final int binID;
  final int driverID;

  const Complaints({
    @required this.complaintID,
    @required this.complaintMessage,
    @required this.status,
    @required this.subject,
    @required this.date,
    @required this.binID,
    @required this.driverID,
  });

  Map<String, dynamic> toJson() => {
        ComplaintsFields.id: complaintID,
        ComplaintsFields.complaintMessage: complaintMessage,
        ComplaintsFields.status: status,
        ComplaintsFields.subject: subject,
        ComplaintsFields.date: date.toIso8601String(),
        ComplaintsFields.binID: binID,
        ComplaintsFields.driverID: driverID,
      };

  Complaints copy(
          {int id,
          String complaintMessage,
          String status,
          String subject,
          DateTime date,
          int binID,
          int driverID}) =>
      Complaints(
          complaintID: id ?? this.complaintID,
          complaintMessage: complaintMessage ?? this.complaintMessage,
          status: status ?? this.status,
          subject: subject ?? this.subject,
          date: date ?? this.date,
          binID: binID ?? this.binID,
          driverID: driverID ?? this.driverID);

  static Complaints fromJson(Map<String, Object> json) => Complaints(
      complaintID: json[ComplaintsFields.id] as int,
      binID: json[ComplaintsFields.binID] as int,
      complaintMessage: json[ComplaintsFields.complaintMessage] as String,
      status: json[ComplaintsFields.status] as String,
      subject: json[ComplaintsFields.subject] as String,
      date: DateTime.parse(json[ComplaintsFields.date] as String),
      driverID: json[ComplaintsFields.driverID] as int);

  Future<Complaints> read(int id, dynamic instance) async {
    final db = await instance.database;
    final maps = await db.query(
      Complaints,
      columns: ComplaintsFields.values,
      where: '${ComplaintsFields.id} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Complaints.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<dynamic>> readAll(dynamic instance) async {
    final db = await instance.database;
    final result = await db.query(tableComplaints);
    return result.map((json) => Complaints.fromJson(json)).toList();
  }

  Future<int> update(int id, dynamic instance, Complaints complaints) async {
    final db = await instance.database;
    //we have to convert from object to json
    return db.update(tableComplaints, complaints.toJson(),
        where: '${ComplaintsFields.id} = ?', whereArgs: [id]);
  }

  //delete a row
  Future<int> delete(int id, dynamic instance) async {
    final db = await instance.database;
    return db.delete(tableComplaints,
        where: '${ComplaintsFields.id} = ?', whereArgs: [id]);
  }
}
