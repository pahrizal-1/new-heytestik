class MyJourneyHistoryConsultationDoctorNoteModel {
  bool? success;
  String? message;
  Data? data;

  MyJourneyHistoryConsultationDoctorNoteModel(
      {this.success, this.message, this.data});

  MyJourneyHistoryConsultationDoctorNoteModel.fromJson(
      Map<String, dynamic> json) {
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
  int? consultationId;
  String? indication;
  String? diagnosisPossibilty;
  String? diagnosisSecondary;
  String? suggestion;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data(
      {this.id,
      this.consultationId,
      this.indication,
      this.diagnosisPossibilty,
      this.diagnosisSecondary,
      this.suggestion,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    indication = json['indication'];
    diagnosisPossibilty = json['diagnosis_possibilty'];
    diagnosisSecondary = json['diagnosis_secondary'];
    suggestion = json['suggestion'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['indication'] = indication;
    data['diagnosis_possibilty'] = diagnosisPossibilty;
    data['diagnosis_secondary'] = diagnosisSecondary;
    data['suggestion'] = suggestion;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
