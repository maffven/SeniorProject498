import 'package:flutter_application_1/Screens/DriverDashboard.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:test/test.dart';

Future<void> clearUserSave() async {
  List<Driver> _drivers = [];
  BarAndPieChartDashboard barAndPieChartDashboard = BarAndPieChartDashboard();
  barAndPieChartDashboard.getLists();
  expect(_drivers.length != 0, true);
}

void main() {
  test('Lists is filled from the database', clearUserSave());
}
