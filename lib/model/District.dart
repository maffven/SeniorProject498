import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableDistrict ='district';
class DistrictFields{
static final int districtID='_districtID';
static final String name = 'name';
static final int numberOfBins='numberOfBins';
static final int driverID='driverID';

}

class District{

final int districtID=0;
final String name = "";
final int numberOfBins=0;
final int driverID=0;

District(districtID, name,numberOfBins, driverID);
District.fromMap(Map<String, dynamic> map) {
    districtID = map['districtID'];
    name = map['name'];
    numberOfBins = map['numberOfBins'];
    driverID = map['driverID'];
  }
Map<String, dynamic> toMap() {
    return {
      DatabaseHelper.columndistrictID: districtID,
      DatabaseHelper.columnname: name,
      DatabaseHelper.columnnumberOfBins: numberOfBins,
      DatabaseHelper.columndriverID: driverID,
    };
}

}