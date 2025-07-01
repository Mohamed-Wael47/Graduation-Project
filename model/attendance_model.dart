class Attendance {
  int? id;
  String? time;
  String? studentName;
  String? studentCode;

  Attendance({this.id, this.time, this.studentName, this.studentCode});

  Attendance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    time = json['scanTime'];
    studentName = json['studentName'];
    studentCode = json['studentCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scanTime'] = this.time;
    data['studentName'] = this.studentName;
    data['studentCode'] = this.studentCode;
    return data;
  }
}
