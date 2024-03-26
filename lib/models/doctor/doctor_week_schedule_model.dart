class DoctorWeekSchedulerModel {
  bool? success;
  String? message;
  List<Data>? data;

  DoctorWeekSchedulerModel({this.success, this.message, this.data});

  DoctorWeekSchedulerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? startEndTime;
  String? day;
  int? dayNumber;
  int? userId;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<DoctorScheduleTimes>? doctorScheduleTimes;

  Data({
    this.id,
    this.startEndTime,
    this.day,
    this.dayNumber,
    this.userId,
    this.isActive,
    this.createdBy,
    this.updatedBy,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.doctorScheduleTimes,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startEndTime = json['start_end_time'];
    day = json['day'];
    dayNumber = json['day_number'];
    userId = json['userId'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['doctor_schedule_times'] != null) {
      doctorScheduleTimes = <DoctorScheduleTimes>[];
      json['doctor_schedule_times'].forEach((v) {
        doctorScheduleTimes!.add(new DoctorScheduleTimes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_end_time'] = this.startEndTime;
    data['day'] = this.day;
    data['day_number'] = this.dayNumber;
    data['userId'] = this.userId;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.doctorScheduleTimes != null) {
      data['doctor_schedule_times'] = this.doctorScheduleTimes!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DoctorScheduleTimes {
  int? id;
  int? doctorScheduleId;
  String? startTime;
  String? endTime;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  DoctorScheduleTimes({this.id, this.doctorScheduleId, this.startTime, this.endTime, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt});

  DoctorScheduleTimes.fromJson(Map<String, dynamic> json) {
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
