import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableBin ='bin';
class BinFields{
static final String binID='_binID';
static final String capacity = '_capacity';
static final String districtID = '_districtID';
}
class Bin{

 int binID=0;
 double capacity = 0.0;
 int districtID = 0;

Bin(binID, capacity, districtID);
Bin.fromMap(Map<String, dynamic> map) {
    binID = map['binID'];
    capacity = map['capacity'];
    districtID = map['districtID'];
  }
Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columnId: binID,
      DatabaseHelper.columnCapacity: capacity,
      DatabaseHelper.columnDistrict: districtID,
    };
}
}