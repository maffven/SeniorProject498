import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableComplaints = 'complaints';

class ComplaintsFields {
  static final String complaintID = '_complaintID';
  static final String complaintMessage = 'complaintMessage';
  static final String status = 'status';
  static final String subject = 'subject';
  static final String date = 'date';
  static final String binID = '_binID';
  static final String driverID = '_driverID';
}

class Complaints {
  int complaintID;
  String complaintMessage;
  String status;
  String subject;
  DateTime date;
  int binID;
  int driverID;

  Complaints(
      complaintID, complaintMessage, status, subject, date, binID, driverID);
  Complaints.fromMap(Map<String, dynamic> map) {
    complaintID = map['complaintID'];
    complaintMessage = map['complaintMessage'];
    status = map['status'];
    subject = map['subject'];
    date = map['date'];
    binID = map['binID'];
    driverID = map['driverID'];
  }
  Map<String, dynamic> toMap() => {
        ComplaintsFields.complaintID: complaintID,
        ComplaintsFields.complaintMessage: complaintMessage,
        ComplaintsFields.status: status,
        ComplaintsFields.subject: subject,
        ComplaintsFields.date: date.toIso8601String(),
        ComplaintsFields.binID: binID,
        ComplaintsFields.driverID: driverID,
      };
}
