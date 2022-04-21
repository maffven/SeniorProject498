import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';

class LoginField {
 

  static Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
  }

//validate login info
 static Future<bool> validatePhone(int phone) async {
    bool phoneCheck;
     List<Driver> dd=[];
//check login info from the database driver's list
    List<dynamic> drListd = await readAll(tableDriver);
    dd = drListd.cast();
    for (int i = 0; i < dd.length; i++) {
      if (dd[i].phone == phone) {
      return Future<bool>.value(true);
      }
         return Future<bool>.value(false);
    }
      return Future<bool>.value(false);
  }

  static Future<bool> validatePassword(int password) async {
    bool passwordCheck;
     List<Driver> dd=[];
    List<dynamic> drListd = await readAll(tableDriver);
    dd = drListd.cast();
    for (int i = 0; i < dd.length; i++) {
      if (dd[i].password == password) {
           return Future<bool>.value(true);
      }

    return Future<bool>.value(false);
    }
       return Future<bool>.value(false);
  }
}
