import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/MunicipalityAdmin.dart';

class LoginField {
  static Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
  }

//validate login info
  static Future<bool> checkPhone(int phone) async {
    bool phoneCheck;
    List<Driver> dd = [];
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

  static Future<bool> checkPassword(int password) async {
    bool passwordCheck;
    List<Driver> dd = [];
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

  static String validatePassword(String pass) {
/*
  (?=.*[A-Z])       // should contain at least one upper case
  (?=.*[a-z])       // should contain at least one lower case
  (?=.*?[0-9])      // should contain at least one digit
  (?=.*?[!@#\$&*~]) // should contain at least one Special character
  .{8,}             // Must be at least 8 characters in length  
  */

    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(pass)) {
      return 'Enter a valid password';
    } else {
      return null;
    }
  }

  static bool matchTwoPasswords(String password, String confiPassword) {
    if (password == confiPassword) {
      return true;
    }
    return false;
  }
}
