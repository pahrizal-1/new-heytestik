class FindDoctorScheduleModel {
  bool? success;
  String? message;
  Data? data;

  FindDoctorScheduleModel({this.success, this.message, this.data});

  FindDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
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
  List<Data2>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(Data2.fromJson(v));
      });
    }
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    return data;
  }
}

class Data2 {
  int? id;
  int? doctorId;
  int? customerId;
  int? doctorScheduleId;
  String? transactionConsultationId;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  TransactionConsultation? transactionConsultation;

  Data2(
      {this.id,
      this.doctorId,
      this.customerId,
      this.doctorScheduleId,
      this.transactionConsultationId,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.transactionConsultation});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    doctorScheduleId = json['doctor_schedule_id'];
    transactionConsultationId = json['transaction_consultation_id'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    transactionConsultation = json['transaction_consultation'] != null
        ? TransactionConsultation.fromJson(json['transaction_consultation'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['customer_id'] = customerId;
    data['doctor_schedule_id'] = doctorScheduleId;
    data['transaction_consultation_id'] = transactionConsultationId;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (transactionConsultation != null) {
      data['transaction_consultation'] = transactionConsultation!.toJson();
    }
    return data;
  }
}

class TransactionConsultation {
  String? id;
  int? customerId;
  int? medicalHistoryId;
  int? duration;
  int? totalFee;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? paymentStatus;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  MedicalHistory? medicalHistory;

  TransactionConsultation(
      {this.id,
      this.customerId,
      this.medicalHistoryId,
      this.duration,
      this.totalFee,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.paymentStatus,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.medicalHistory});

  TransactionConsultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    medicalHistoryId = json['medical_history_id'];
    duration = json['duration'];
    totalFee = json['total_fee'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    paymentStatus = json['payment_status'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['medical_history_id'] = medicalHistoryId;
    data['duration'] = duration;
    data['total_fee'] = totalFee;
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['payment_method_id'] = paymentMethodId;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (medicalHistory != null) {
      data['medical_history'] = medicalHistory!.toJson();
    }
    return data;
  }
}

class MedicalHistory {
  int? id;
  int? customerId;
  int? interestConditionId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  InterestCondition? interestCondition;

  MedicalHistory(
      {this.id,
      this.customerId,
      this.interestConditionId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestCondition});

  MedicalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    interestConditionId = json['interest_condition_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    interestCondition = json['interest_condition'] != null
        ? InterestCondition.fromJson(json['interest_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['interest_condition_id'] = interestConditionId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (interestCondition != null) {
      data['interest_condition'] = interestCondition!.toJson();
    }
    return data;
  }
}

class InterestCondition {
  int? id;
  int? interestConditionsCategoryId;
  String? name;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  InterestCondition(
      {this.id,
      this.interestConditionsCategoryId,
      this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  InterestCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestConditionsCategoryId = json['interest_conditions_category_id'];
    name = json['name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['interest_conditions_category_id'] = interestConditionsCategoryId;
    data['name'] = name;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Meta {
  int? page;
  int? take;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  Meta(
      {this.page,
      this.take,
      this.itemCount,
      this.pageCount,
      this.hasPreviousPage,
      this.hasNextPage});

  Meta.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    take = json['take'];
    itemCount = json['itemCount'];
    pageCount = json['pageCount'];
    hasPreviousPage = json['hasPreviousPage'];
    hasNextPage = json['hasNextPage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    data['take'] = take;
    data['itemCount'] = itemCount;
    data['pageCount'] = pageCount;
    data['hasPreviousPage'] = hasPreviousPage;
    data['hasNextPage'] = hasNextPage;
    return data;
  }
}
