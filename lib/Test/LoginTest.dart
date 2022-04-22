import 'package:flutter_application_1/model/LoginField.dart';
import 'package:validators/validators.dart';
import 'package:test/test.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/model/LoginField.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {

//TestWidgetsFlutterBinding.ensureInitialized();
 WidgetsFlutterBinding.ensureInitialized(); 

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
  }
  //-------------------------------------------------------------
    test('Valid password check', () {
      var result = LoginField.validatePassword('Rania!2345');
      expect(result, 'Enter a valid password');
    });
  //-------------------------------------------------------------
    test('match two passwords', () {
      var result = LoginField.matchTwoPasswords('1233', '1233');
      expect(result, false);
    });
  //-------------------------------------------------------------
    test('phone in database check', () async {
     // List<dynamic> drListd = await readAll(tableDriver);
     // driver = drListd.cast();
      bool result = await LoginField.checkPhone(06795437890);
      expect(result, true);
    });
  //-------------------------------------------------------------
    test('password in database check', () async {
    // List<dynamic> drListd = await readAll(tableDriver);
      // driver = drListd.cast();
      bool result = await LoginField.checkPassword("7890");
      expect(result, true);
    });
  //-------------------------------------------------------------
  }

