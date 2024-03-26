// class CurrentDoctorScheduleModel {
//   bool? success;
//   String? message;
//   Data? data;

//   CurrentDoctorScheduleModel({this.success, this.message, this.data});

//   CurrentDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
//     success = json['success'];
//     message = json['message'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['success'] = success;
//     data['message'] = message;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int? id;
//   String? firstSchedule;
//   String? lastSchdule;
//   String? date;

//   Data({this.id, this.firstSchedule, this.lastSchdule, this.date});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     firstSchedule = json['first_schedule'];
//     lastSchdule = json['last_schdule'];
//     date = json['date'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['first_schedule'] = firstSchedule;
//     data['last_schdule'] = lastSchdule;
//     data['date'] = date;
//     return data;
//   }
// }
class CurrentDoctorScheduleModel {
  bool? success;
  String? message;
  Data? data;

  CurrentDoctorScheduleModel({this.success, this.message, this.data});

  CurrentDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  CurrentSchedule? currentSchedule;
  CurrentSchedule? nextSchedule;
  List<CurrentSchedule>? scheduleTimes;

  Data({this.currentSchedule, this.nextSchedule, this.scheduleTimes});

  Data.fromJson(Map<String, dynamic> json) {
    currentSchedule = json['current_schedule'] != null ? new CurrentSchedule.fromJson(json['current_schedule']) : null;
    nextSchedule = json['next_schedule'] != null ? new CurrentSchedule.fromJson(json['next_schedule']) : null;
    if (json['schedule_times'] != null) {
      scheduleTimes = <CurrentSchedule>[];
      json['schedule_times'].forEach((v) {
        scheduleTimes!.add(new CurrentSchedule.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.currentSchedule != null) {
      data['current_schedule'] = this.currentSchedule!.toJson();
    }
    if (this.nextSchedule != null) {
      data['next_schedule'] = this.nextSchedule!.toJson();
    }
    if (this.scheduleTimes != null) {
      data['schedule_times'] = this.scheduleTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CurrentSchedule {
  int? id;
  int? doctorScheduleId;
  String? startTime;
  String? endTime;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  CurrentSchedule({this.id, this.doctorScheduleId, this.startTime, this.endTime, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt});

  CurrentSchedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorScheduleId = json['doctor_schedule_id'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_schedule_id'] = this.doctorScheduleId;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
