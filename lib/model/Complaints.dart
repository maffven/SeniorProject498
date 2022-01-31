import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableComplaints ='complaints';
class ComplaintsFields{
static final int complaintID='_complaintID';
static final String complaintMessage = 'complaintMessage';
static final String status = 'status';
static final String subject = 'subject';
static final String date = 'date';
static final int binID='binID';
static final int driverID='driverID';

}

class Complaints{

final int complaintID=0;
final String complaintMessage = "";
final String status = "";
final String subject = "";
final String date = "";
final int binID=0;
final int driverID=0;

Complaints(complaintID, complaintMessage,status, subject,date,binID,driverID);
Complaints.fromMap(Map<String, dynamic> map) {
    complaintID = map['complaintID'];
    complaintMessage = map['complaintMessage'];
    status = map['status'];
    subject = map['subject'];
    date = map['date'];
    binID = map['binID'];
    driverID = map['driverID'];
  }
Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columncomplaintId: complaintID,
      DatabaseHelper.columncomplaintMessage: complaintMessage,
      DatabaseHelper.columnstatus: status,
      DatabaseHelper.columnsubject: subject,
      DatabaseHelper.columndate: date,
      DatabaseHelper.columnbinID: binID,
      DatabaseHelper.columndriverID: driverID,
    };
}


}