final String tableDriver = 'Driver';

class DriverFields {
  //col names
  static final String driverID = "_Driver_ID";
  static final String municpalityID = "_Municipality_ID";
  static final String firatName = "First_name";
  static final String lastName = "Last_name";
  static final String password = "Password";
  static final String email = "Email";
  static final String phone = "Phone";
  static final String workTime = "Work_time";
}

class Driver {
  int driverID;
  int municpalityID;
  String firatName;
  String lastName;
  String password;
  String email;
  int phone;
  String workTime;

  Map<String, dynamic> toJson() => {
        DriverFields.driverID: driverID,
        DriverFields.municpalityID: municpalityID,
        DriverFields.firatName: firatName,
        DriverFields.lastName: lastName,
        DriverFields.password: password,
        DriverFields.email: email,
        DriverFields.phone: phone,
        DriverFields.workTime: workTime,
      };
}
