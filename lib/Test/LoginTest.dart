import 'package:flutter_application_1/model/LoginField.dart';
import 'package:validators/validators.dart';
import 'package:test/test.dart';
import 'package:flutter_application_1/Screens/Login.dart';
import 'package:flutter_application_1/model/LoginField.dart';
void main() {
  /*test('Empty Email Test', () {
    var result = LoginDemo.('');
    expect(result, 'Enter Email!');
  });*/


  test('Valid password check', () {
    var result = LoginField.validatePassword('1233');
    expect(result, 'Enter a valid password');
  });

test('match two passwords', () {
    var result = LoginField.matchTwoPasswords('1233','1233');
    expect(result, true);
  });

  

}

