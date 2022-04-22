import 'package:flutter_application_1/model/Complaints.dart';
import 'package:validators/validators.dart';
import 'package:test/test.dart';
import 'package:flutter_application_1/model/ComplaintFields.dart';


void main(){
   test('Empty Complaint fields Test', () {
    var result =  ComplaintFields.validateFields("", "", "", "");
    expect(result, true);
  });
}