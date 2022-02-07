import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableBin = 'Bin';
class BinFields {

    static final List<String> values = [
    //add all fields
    binID, capacity, districtId
  ];
  static final String binID = "_BinId";
  static final String capacity = "_capacity";
  static final String districtId = "_districtId";

}

class Bin {
 final int binID;
 final String capacity;
 final int districtId;

  const Bin(
      {@required this.binID,
      @required this.capacity,
      @required this.districtId,
      });

  //Convert BinLevel object to json object
  Map<String, dynamic> toJson() => {
        BinFields.binID: binID,
        BinFields.capacity: capacity,
        BinFields.districtId: districtId,
  
      };

  Bin copy(
          {int binID,
          String capacity,
          int districtId,
     
      }) =>
      Bin(
          binID: binID ?? this.binID,
          capacity: capacity ?? this.capacity,
          districtId: districtId ?? this.districtId
          );



  //convert from json to MunicipalityAdmin
  static Bin fromJson(Map<String, Object> json) =>
      Bin(
          binID: json[BinFields.binID] as int,
          capacity: json[BinFields.capacity] as String,
          districtId: json[BinFields.districtId] as int,
        
          );

  Future<Bin> read(int id, dynamic instance) async {
    final db = await instance.database;
    final maps = await db.query(
      tableBin,
      columns: BinFields.values,
      where: '${BinFields.binID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return Bin.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }


  Future<List<dynamic>> readAll(dynamic instance) async {
    final db = await instance.database;
    final result = await db.query(tableBin);
    return result.map((json) => Bin.fromJson(json)).toList();
  }

  Future<int> update(
      int id, dynamic instance, Bin municipalityAdmin) async {
    final db = await instance.database;
    //we have to convert from object to json
    return db.update(tableBin, municipalityAdmin.toJson(),
        where: '${BinFields.binID} = ?', whereArgs: [id]);
  }

  //delete a row
  Future<int> delete(int id, dynamic instance) async {
    final db = await instance.database;
    return db.delete(tableBin,
        where: '${BinFields.binID} = ?', whereArgs: [id]);
  }
}