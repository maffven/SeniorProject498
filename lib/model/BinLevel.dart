import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
final String tableBinLevel = 'BinLevel';
class BinLevelFields {

    static final List<String> values = [
    //add all fields
    binID, level, full, half_full,empty
  ];
  static final String binID = "_BinId";
  static final String level = "_level";
  static final String full = "_full";
  static final String half_full = "_half_full";
  static final String empty = "_empty";
}

class BinLevel {
  final int binID;
  final String level;
 final String full;
 final String half_full;
 final String empty;


  const BinLevel(
      {@required this.binID,
      @required this.level,
      @required this.full,
      @required this.half_full,
     @required this.empty,
      });

  //Convert BinLevel object to json object
  Map<String, dynamic> toJson() => {
        BinLevelFields.binID: binID,
        BinLevelFields.level: level,
        BinLevelFields.full: full,
        BinLevelFields.half_full: half_full,
        BinLevelFields.empty: empty,
      };

  BinLevel copy(
          {int binID,
          String full,
          String level,
          String half_full,
          String empty
      }) =>
      BinLevel(
          binID: binID ?? this.binID,
          level: level ?? this.level,
          half_full: half_full ?? this.half_full,
          empty: empty ?? this.empty,
          full: full ?? this.full
          );



  //convert from json to MunicipalityAdmin
  static BinLevel fromJson(Map<String, Object> json) =>
      BinLevel(
          binID: json[BinLevelFields.binID] as int,
          level: json[BinLevelFields.level] as String,
          half_full: json[BinLevelFields.half_full] as String,
          full: json[BinLevelFields.full] as String,
          empty: json[BinLevelFields.empty] as String
          );

  Future<BinLevel> read(int id, dynamic instance) async {
    final db = await instance.database;
    final maps = await db.query(
      tableBinLevel,
      columns: BinLevelFields.values,
      where: '${BinLevelFields.binID} = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return BinLevel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not founs');
    }
  }


  Future<List<dynamic>> readAll(dynamic instance) async {
    final db = await instance.database;
    final result = await db.query(tableBinLevel);
    return result.map((json) => BinLevel.fromJson(json)).toList();
  }

  Future<int> update(
      int id, dynamic instance, BinLevel municipalityAdmin) async {
    final db = await instance.database;
    //we have to convert from object to json
    return db.update(tableBinLevel, municipalityAdmin.toJson(),
        where: '${BinLevelFields.binID} = ?', whereArgs: [id]);
  }

  //delete a row
  Future<int> delete(int id, dynamic instance) async {
    final db = await instance.database;
    return db.delete(tableBinLevel,
        where: '${BinLevelFields.binID} = ?', whereArgs: [id]);
  }}