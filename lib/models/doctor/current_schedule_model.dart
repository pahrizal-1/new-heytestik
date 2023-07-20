class CurrentDoctorScheduleModel {
  bool? success;
  String? message;
  Data? data;

  CurrentDoctorScheduleModel({this.success, this.message, this.data});

  CurrentDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? firstSchedule;
  String? lastSchdule;
  String? date;

  Data({this.id, this.firstSchedule, this.lastSchdule, this.date});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstSchedule = json['first_schedule'];
    lastSchdule = json['last_schdule'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['first_schedule'] = firstSchedule;
    data['last_schdule'] = lastSchdule;
    data['date'] = date;
    return data;
  }
}
