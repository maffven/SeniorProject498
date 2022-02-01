import 'package:flutter_application_1/db/DatabaseHelper.dart';

final String tableDistrict ='district';
class DistrictFields{
static final String districtID='_districtID';
static final String name = 'name';
static final String numberOfBins='numberOfBins';
static final String driverID='_driverID';

}

class District{

 int districtID;
 String name ;
 int numberOfBins;
 int driverID;

District(districtID, name,numberOfBins, driverID);
District.fromMap(Map<String, dynamic> map) {
    districtID = map['districtID'];
    name = map['name'];
    numberOfBins = map['numberOfBins'];
    driverID = map['driverID'];
  }
Map<String, dynamic> toMap() {
    return {
      DistrictFields.districtID: districtID,
      DistrictFields.name: name,
      DistrictFields.numberOfBins: numberOfBins,
      DistrictFields.driverID: driverID,
    };
}

}