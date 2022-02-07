import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/model/Complaints.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter_application_1/model/DriverStatus.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _databaseName = "Wastedb.db";
  static final _databaseVersion = 1;
  static final table = 'bin_table';
  static final columnId = 'binID';
  static final columnCapacity = 'capacity';
  static final columnDistrict = 'district';

  //Rawan work
  static final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
  static final boolType = 'BOOLEAN NOT NULL';
  static final number = 'INTEGER NOT NULL';
  static final textType = 'TEXT NOT NULL';

  DatabaseHelper() {}
  // make this a singleton class
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  static Database _database;
  Future<Database> get database async {
    //if DB exist
    if (_database != null) return _database;
    // lazily instantiate the db the first time it is accessed
    _database = await initDatabase();
    return _database;
  }

  // this opens the database (and creates it if it doesn't exist)
  initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: createDB);
  }

  // SQL code to create the database table
  Future createDB(Database db, int version) async {
    //Bin table
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnCapacity TEXT NOT NULL,
            $columnDistrict INTEGER NOT NULL
          )
          ''');
    print('bin table created');

    //Rawan work
    //Municipality Admin table
    await db.execute('''
          CREATE TABLE $tableMunicipalityAdmin(
            ${MunicipalityAdminFields.id} $idType,
            ${MunicipalityAdminFields.firatName} $textType,
            ${MunicipalityAdminFields.lastName} $textType,
            ${MunicipalityAdminFields.password} $textType,
            ${MunicipalityAdminFields.email} $textType,
            ${MunicipalityAdminFields.phone} $number
          )
          ''');
    print('Municipality Admin table created');

    //Driver table
    await db.execute('''
          CREATE TABLE $tableDriver (
            ${DriverFields.id} $idType,
            ${DriverFields.municpalityID} $number,
            ${DriverFields.firatName} $textType,
            ${DriverFields.lastName} $textType,
            ${DriverFields.password} $textType,
            ${DriverFields.email} $textType,
            ${DriverFields.phone} $number,
            ${DriverFields.workTime} $textType,
            FOREIGN KEY (${DriverFields.municpalityID}) REFERENCES $tableMunicipalityAdmin(${MunicipalityAdminFields.id})
          )
          ''');
    print('Driver table created');

    //Driver Status table
    await db.execute('''
          CREATE TABLE $tableDriverStatus(
            ${DriverStatusFields.id} $idType,
            ${DriverStatusFields.driverID} $number,
            ${DriverStatusFields.completed} $boolType,
            ${DriverStatusFields.incomplete} $boolType,
            ${DriverStatusFields.lateStatus} $boolType,
            FOREIGN KEY (${DriverStatusFields.id}) REFERENCES $tableDriver(${DriverFields.id})
          )
          ''');
    print('Driver status table created');

    //Lina work
    //Complaints table
    await db.execute('''
          CREATE TABLE $tableComplaints (
            ${ComplaintsFields.complaintID} $idType,
            ${ComplaintsFields.complaintMessage} $textType,
            ${ComplaintsFields.status} $textType,
            ${ComplaintsFields.subject} $textType,
            ${ComplaintsFields.date} $textType,
            ${ComplaintsFields.driverID} $number,
            ${ComplaintsFields.binID} $number,
            FOREIGN KEY (${ComplaintsFields.driverID}) REFERENCES $tableDriver(${DriverFields.id}),
            FOREIGN KEY (${ComplaintsFields.binID}) REFERENCES $table($columnId)
          )
          ''');
    print('Complaints table created');

    //District table
    await db.execute('''
          CREATE TABLE $tableDistrict (
            ${DistrictFields.districtID} $idType,
            ${DistrictFields.name} $textType,
            ${DistrictFields.numberOfBins} $number,
            ${DistrictFields.driverID} $number,
            FOREIGN KEY (${DistrictFields.driverID}) REFERENCES $tableDriver(${DriverFields.id})
          )
          ''');
    print('District table created');
  }

  // create a row
  Future<dynamic> generalCreate(
    dynamic table,
    String tableName,
  ) async {
    final db = await instance.database;
    //inset to database
    final id = await db.insert(tableName, table.toJson());
    return table.copy(id: id);
  }

  // read a row

  Future<dynamic> generalRead(String tableName, int id) async {
    switch (tableName) {
      case "Municipality_Admin":
        return await MunicipalityAdmin().read(id, instance);
        break;
      default:
        "cannot access data";
    }
  }

//Read all rows
  Future<List<dynamic>> generalReadAll(String tableName) async {
    switch (tableName) {
      case "Municipality_Admin":
        return await MunicipalityAdmin().readAll(instance);
        break;
      default:
        "cannot access data";
    }
  }

  /*Future<List<dynamic>> generalReadAll(
      String tableName, dynamic className) async {
    final db = await instance.database;
    final result = await db.query(tableName);
    return result.map((json) => className.fromJson(json)).toList();
  }*/

  //update row

  Future<int> generalUpdate(String tablename, int id, dynamic obj) async {
    switch (tablename) {
      case "Municipality_Admin":
        return await MunicipalityAdmin().update(id, instance, obj);
        break;
      default:
        "cannot access data";
    }
  }

  //delete a row
  Future<int> gneralDelete(int id, String tablename) async {
    switch (tablename) {
      case "Municipality_Admin":
        return await MunicipalityAdmin().delete(id, instance);
        break;
      default:
        "cannot access data";
    }
  }
}

/* Future<int> generalUpdate(String tablename) async {
    final db = await instance.database;
    //we have to convert from object to json
    return db.update(tablename, classInstance.toJson(),
        where: '${classfields.id} = ?', whereArgs: [classInstance.id]);
  }*

  //delete row
  Future<int> gneralDelete(
      int id, String tablename, dynamic classfields) async {
    final db = await instance.database;
    return db
        .delete(tablename, where: '${classfields.id} = ?', whereArgs: [id]);
  }

  //Close database  Method
  Future close() async {
    final db = await instance.database;
    db.close();
  }
  // Helper methods

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  /*Future<int> insert(Bin bin) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'binID': bin.binID,
      'capacity': bin.capacity,
      'district': bin.district
    });
  }*/

  //Rawan Work

  Future<int> generalInsert(String tableName, dynamic table) async {
    final db = await instance.database;
    return await db.insert(tableName, table.toJson());
  }




   /* Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }*/

  /*Future<List<Map<String, dynamic>>> generalQueryAllRows(
      String tableName) async {
    Database db = await instance.database;
    return await db.query(tableName);
  }*/

  /*Future<int> generalQueryRowCount(String tableName) async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }*/

 

  /* Future<int> insert(Complaints complaints) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'complaintID': complaints.complaintID,
      'complaintMessage': complaints.complaintMessage,
      'status': complaints.status,
      'subject': complaints.subject,
      'date': complaints.date,
      'binID': complaints.binID,
      'driverID': complaints.driverID
    });
  }

  Future<int> insert(District district) async {
    Database db = await instance.database;
    return await db.insert(table, {
      'districtID': district.districtID,
      'name': district.name,
      'numberOfBins': district.numberOfBins,
      'driverID': district.driverID
    });
  }*/

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  /*Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }*/

  // Queries rows based on the argument received
  /*Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnCapacity LIKE '%$name%'");
  }*/

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  /*Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }*/

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  /*Future<int> update(Bin bin) async {
    Database db = await instance.database;
    int id = bin.toMap()['id'];
    return await db
        .update(table, bin.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }*/

  /*Future<int> update(Complaints complaints) async {
    Database db = await instance.database;
    int id = complaints.toMap()['id'];
    return await db.update(table, complaints.toMap(),
        where: '$columncomplaintId = ?', whereArgs: [id]);
  }

  Future<int> update(District district) async {
    Database db = await instance.database;
    int id = district.toMap()['id'];
    return await db.update(table, district.toMap(),
        where: '$columndistrictId = ?', whereArgs: [id]);
  }*/

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.*/
