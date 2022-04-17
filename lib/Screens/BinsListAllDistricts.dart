import 'package:flutter/material.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Driver.dart';

class BinsListAllDistricts extends StatefulWidget {
  final String BinsStatus;
  final Driver driver;
  @override
  BinsListAllDistricts({Key key, this.BinsStatus, this.driver})
      : super(key: key);
  _BinsListAllDistricts createState() =>
      _BinsListAllDistricts(BinsStatus: BinsStatus, driver: driver);
}

class _BinsListAllDistricts extends State<BinsListAllDistricts> {
  final String BinsStatus;
  final Driver driver;
  List<District> Assigneddistricts = [];
  _BinsListAllDistricts({this.BinsStatus, this.driver});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> getLists() async {
    List<District> district;
    List<dynamic> districtDB = await readAll(tableDistrict);
    List<BinLevel> binsLevel = [];
    district = districtDB.cast();
    print("in get distric method");
    print("district length ${districtDB.length}");

    setState(() {
      for (int i = 0; i < district.length; i++) {
        if (district[i].driverID == driver.driverID) {
          Assigneddistricts.add(district[i]);
        }
      }
    });

    print(Assigneddistricts);

    List<BinLevel> bin;
    List<Bin> bins;
    List<dynamic> binStatus = await readAll(tableBinLevel);
    bin = binStatus.cast();
    print("in get binsLevel method");
    print("binsLevel length ${binStatus.length}");
    binsLevel = bin;
    print("here inside getBins");
    List<Bin> binsInfo;
    List<dynamic> binDB = await readAll("bin_table");
    binsInfo = binDB.cast();
    print("in get bins method");
    print("bins length ${binDB.length}");
    setState(() {
      bins = binsInfo;
    });
    print(bins);
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
    // print("mun object: ${munList[0].firatName}");
  }
}
