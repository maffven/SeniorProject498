import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableBin ='bin';
class BinFields{
static final String binID='_binID';
static final String capacity = '_capacity';
static final String district = '_districtID';
}
class Bin{

 int binID=0;
 double capacity = 0.0;
 int district = 0;

Bin(binID, capacity, districtID);
Bin.fromMap(Map<String, dynamic> map) {
    binID = map['binID'];
    capacity = map['capacity'];
    district = map['district'];
  }
Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: binID,
      DatabaseHelper.columnCapacity: capacity,
      DatabaseHelper.columnDistrict: district,
    };
}
}