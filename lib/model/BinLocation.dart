import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

final String tableBinLocation = 'BinLocation';
class BinLocationFields {

    static final List<String> values = [
    //add all fields
    binID, location, coordinateX, coordinateY
  ];
  static final String binID = "_BinId";
  static final String location = "_Location";
  static final String coordinateX = "_CoordinateX";
  static final String coordinateY = "_CoordinateY";
}

class BinLocation {
  final int binID;
  final String location;
  final String coordinateX;
  final String coordinateY;

  const BinLocation(
      {@required this.binID,
      @required this.coordinateX,
      @required this.coordinateY,
      @required this.location});

  //Convert BinLevel object to json object
  Map<String, dynamic> toJson() => {
        BinLocationFields.binID: binID,
        BinLocationFields.coordinateX: coordinateX,
        BinLocationFields.coordinateY: coordinateY,
        BinLocationFields.location: location,
  
      };

  BinLocation copy(
          {int binID,
          String coordinateX,
          String coordinateY,
          String location,
      }) =>
      BinLocation(
          binID: binID ?? this.binID,
          coordinateX: coordinateX ?? this.coordinateX,
          coordinateY: coordinateY ?? this.coordinateY,
          location: location ?? this.location);



  //convert from json to MunicipalityAdmin
  static BinLocation fromJson(Map<String, Object> json) =>
      BinLocation(
          binID: json[BinLocationFields.binID] as int,
          coordinateX: json[BinLocationFields.coordinateX] as String,
          coordinateY: json[BinLocationFields.coordinateY] as String,
          location: json[BinLocationFields.location] as String);

  Future<BinLocation> read(int id, dynamic instance) async {
    final db = await instance.database;
    final maps = await db.query(
      tableBinLocation,
      columns: BinLocationFields.values,
      where: '${BinLocationFields.binID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return BinLocation.fromJson(maps.first);
    } else {
      throw Exception('ID $id not founs');
    }
  }


  Future<List<dynamic>> readAll(dynamic instance) async {
    final db = await instance.database;
    final result = await db.query(tableBinLocation);
    return result.map((json) => BinLocation.fromJson(json)).toList();
  }

  Future<int> update(
      int id, dynamic instance, BinLocation municipalityAdmin) async {
    final db = await instance.database;
    //we have to convert from object to json
    return db.update(tableBinLocation, municipalityAdmin.toJson(),
        where: '${BinLocationFields.binID} = ?', whereArgs: [id]);
  }

  //delete a row
  Future<int> delete(int id, dynamic instance) async {
    final db = await instance.database;
    return db.delete(tableBinLocation,
        where: '${BinLocationFields.binID} = ?', whereArgs: [id]);
  }
}
