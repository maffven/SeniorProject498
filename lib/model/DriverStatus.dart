final String tableDriverStatus = 'Driver_Status';

class DriverStatusFields {
  //col names
  static final String driverID = "Driver_ID";
  static final String status = "_Status";
  static final String completed = "Completed";
  static final String incomplete = "Incomplete";
  static final String late = "Late";
}

class DriverStatus {
  int driverID;
  int status;
  bool completed;
  bool incomplete;
  bool late;
}
