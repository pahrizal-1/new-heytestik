// class FindDoctorScheduleModel {
//   bool? success;
//   String? message;
//   Data? data;

//   FindDoctorScheduleModel({this.success, this.message, this.data});

//   FindDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
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
//   List<Data2>? data;
//   Meta? meta;

//   Data({this.data, this.meta});

//   Data.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data2>[];
//       json['data'].forEach((v) {
//         data!.add(Data2.fromJson(v));
//       });
//     }
//     meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (meta != null) {
//       data['meta'] = meta!.toJson();
//     }
//     return data;
//   }
// }

// class Data2 {
//   int? id;
//   int? doctorId;
//   int? customerId;
//   int? doctorScheduleId;
//   String? transactionConsultationId;
//   String? status;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   TransactionConsultation? transactionConsultation;
//   Customer? customer;

//   Data2(
//       {this.id,
//       this.doctorId,
//       this.customerId,
//       this.doctorScheduleId,
//       this.transactionConsultationId,
//       this.status,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.transactionConsultation,
//       this.customer});

//   Data2.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     doctorId = json['doctor_id'];
//     customerId = json['customer_id'];
//     doctorScheduleId = json['doctor_schedule_id'];
//     transactionConsultationId = json['transaction_consultation_id'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     transactionConsultation = json['transaction_consultation'] != null
//         ? TransactionConsultation.fromJson(json['transaction_consultation'])
//         : null;
//     customer =
//         json['customer'] != null ? Customer.fromJson(json['customer']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['doctor_id'] = doctorId;
//     data['customer_id'] = customerId;
//     data['doctor_schedule_id'] = doctorScheduleId;
//     data['transaction_consultation_id'] = transactionConsultationId;
//     data['status'] = status;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (transactionConsultation != null) {
//       data['transaction_consultation'] = transactionConsultation!.toJson();
//     }
//     if (customer != null) {
//       data['customer'] = customer!.toJson();
//     }
//     return data;
//   }
// }

// class TransactionConsultation {
//   String? id;
//   int? customerId;
//   int? medicalHistoryId;
//   int? duration;
//   int? totalFee;
//   int? totalDiscount;
//   int? totalPaid;
//   int? paymentMethodId;
//   String? orderId;
//   String? paymentStatus;
//   String? status;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   MedicalHistory? medicalHistory;

//   TransactionConsultation(
//       {this.id,
//       this.customerId,
//       this.medicalHistoryId,
//       this.duration,
//       this.totalFee,
//       this.totalDiscount,
//       this.totalPaid,
//       this.paymentMethodId,
//       this.orderId,
//       this.paymentStatus,
//       this.status,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.medicalHistory});

//   TransactionConsultation.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     customerId = json['customer_id'];
//     medicalHistoryId = json['medical_history_id'];
//     duration = json['duration'];
//     totalFee = json['total_fee'];
//     totalDiscount = json['total_discount'];
//     totalPaid = json['total_paid'];
//     paymentMethodId = json['payment_method_id'];
//     orderId = json['order_id'];
//     paymentStatus = json['payment_status'];
//     status = json['status'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     medicalHistory = json['medical_history'] != null
//         ? MedicalHistory.fromJson(json['medical_history'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['customer_id'] = customerId;
//     data['medical_history_id'] = medicalHistoryId;
//     data['duration'] = duration;
//     data['total_fee'] = totalFee;
//     data['total_discount'] = totalDiscount;
//     data['total_paid'] = totalPaid;
//     data['payment_method_id'] = paymentMethodId;
//     data['order_id'] = orderId;
//     data['payment_status'] = paymentStatus;
//     data['status'] = status;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (medicalHistory != null) {
//       data['medical_history'] = medicalHistory!.toJson();
//     }
//     return data;
//   }
// }

// class MedicalHistory {
//   int? id;
//   int? customerId;
//   int? interestConditionId;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   InterestCondition? interestCondition;

//   MedicalHistory(
//       {this.id,
//       this.customerId,
//       this.interestConditionId,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.interestCondition});

//   MedicalHistory.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     customerId = json['customer_id'];
//     interestConditionId = json['interest_condition_id'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     interestCondition = json['interest_condition'] != null
//         ? InterestCondition.fromJson(json['interest_condition'])
//         : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['customer_id'] = customerId;
//     data['interest_condition_id'] = interestConditionId;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (interestCondition != null) {
//       data['interest_condition'] = interestCondition!.toJson();
//     }
//     return data;
//   }
// }

// class InterestCondition {
//   int? id;
//   int? interestConditionsCategoryId;
//   String? name;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   Category? category;
//   // Concern? concern;

//   InterestCondition({
//     this.id,
//     this.interestConditionsCategoryId,
//     this.name,
//     this.createdBy,
//     this.updatedBy,
//     this.createdAt,
//     this.updatedAt,
//     this.deletedAt,
//     this.category,
//     // this.concern,
//   });

//   InterestCondition.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     interestConditionsCategoryId = json['interest_conditions_category_id'];
//     name = json['name'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     category =
//         json['category'] != null ? Category.fromJson(json['category']) : null;
//     // concern =
//     //     json['concern'] != null ? Concern.fromJson(json['concern']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['interest_conditions_category_id'] = interestConditionsCategoryId;
//     data['name'] = name;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     if (category != null) {
//       data['category'] = category!.toJson();
//     }
//     // if (concern != null) {
//     //   data['concern'] = concern!.toJson();
//     // }
//     return data;
//   }
// }

// class Concern {
//   int? id;
//   String? name;
//   String? segment;
//   String? isActive;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;

//   Concern(
//       {this.id,
//       this.name,
//       this.segment,
//       this.isActive,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   Concern.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     segment = json['segment'];
//     isActive = json['is_active'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['segment'] = segment;
//     data['is_active'] = isActive;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class Category {
//   int? id;
//   String? name;
//   dynamic createdBy;
//   dynamic updatedBy;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;

//   Category(
//       {this.id,
//       this.name,
//       this.createdBy,
//       this.updatedBy,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     createdBy = json['created_by'];
//     updatedBy = json['updated_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['name'] = name;
//     data['created_by'] = createdBy;
//     data['updated_by'] = updatedBy;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     return data;
//   }
// }

// class Customer {
//   int? id;
//   String? fullname;
//   String? email;
//   String? password;
//   String? noPhone;
//   String? gender;
//   String? address;
//   String? photoProfile;
//   String? referralCode;
//   dynamic userCode;
//   int? roleId;
//   dynamic verificationCodePhone;
//   dynamic verificationCodeEmail;
//   dynamic provinceId;
//   dynamic cityId;
//   dynamic education;
//   dynamic practiceLocation;
//   dynamic joinDate;
//   dynamic title;
//   dynamic sip;
//   dynamic str;
//   dynamic ktpNo;
//   dynamic ktpImage;
//   dynamic npwpNo;
//   dynamic npwpImage;
//   dynamic specialist;
//   dynamic dob;
//   int? rating;
//   dynamic statusSchedule;
//   dynamic since;
//   dynamic start;
//   dynamic until;
//   bool? isActive;
//   String? createdAt;
//   String? updatedAt;
//   dynamic deletedAt;
//   dynamic refreshToken;

//   Customer(
//       {this.id,
//       this.fullname,
//       this.email,
//       this.password,
//       this.noPhone,
//       this.gender,
//       this.address,
//       this.photoProfile,
//       this.referralCode,
//       this.userCode,
//       this.roleId,
//       this.verificationCodePhone,
//       this.verificationCodeEmail,
//       this.provinceId,
//       this.cityId,
//       this.education,
//       this.practiceLocation,
//       this.joinDate,
//       this.title,
//       this.sip,
//       this.str,
//       this.ktpNo,
//       this.ktpImage,
//       this.npwpNo,
//       this.npwpImage,
//       this.specialist,
//       this.dob,
//       this.rating,
//       this.statusSchedule,
//       this.since,
//       this.start,
//       this.until,
//       this.isActive,
//       this.createdAt,
//       this.updatedAt,
//       this.deletedAt,
//       this.refreshToken});

//   Customer.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullname = json['fullname'];
//     email = json['email'];
//     password = json['password'];
//     noPhone = json['no_phone'];
//     gender = json['gender'];
//     address = json['address'];
//     photoProfile = json['photo_profile'];
//     referralCode = json['referral_code'];
//     userCode = json['user_code'];
//     roleId = json['roleId'];
//     verificationCodePhone = json['verification_code_phone'];
//     verificationCodeEmail = json['verification_code_email'];
//     provinceId = json['provinceId'];
//     cityId = json['cityId'];
//     education = json['education'];
//     practiceLocation = json['practice_location'];
//     joinDate = json['join_date'];
//     title = json['title'];
//     sip = json['sip'];
//     str = json['str'];
//     ktpNo = json['ktp_no'];
//     ktpImage = json['ktp_image'];
//     npwpNo = json['npwp_no'];
//     npwpImage = json['npwp_image'];
//     specialist = json['specialist'];
//     dob = json['dob'];
//     rating = json['rating'];
//     statusSchedule = json['status_schedule'];
//     since = json['since'];
//     start = json['start'];
//     until = json['until'];
//     isActive = json['is_active'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     deletedAt = json['deleted_at'];
//     refreshToken = json['refresh_token'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['fullname'] = fullname;
//     data['email'] = email;
//     data['password'] = password;
//     data['no_phone'] = noPhone;
//     data['gender'] = gender;
//     data['address'] = address;
//     data['photo_profile'] = photoProfile;
//     data['referral_code'] = referralCode;
//     data['user_code'] = userCode;
//     data['roleId'] = roleId;
//     data['verification_code_phone'] = verificationCodePhone;
//     data['verification_code_email'] = verificationCodeEmail;
//     data['provinceId'] = provinceId;
//     data['cityId'] = cityId;
//     data['education'] = education;
//     data['practice_location'] = practiceLocation;
//     data['join_date'] = joinDate;
//     data['title'] = title;
//     data['sip'] = sip;
//     data['str'] = str;
//     data['ktp_no'] = ktpNo;
//     data['ktp_image'] = ktpImage;
//     data['npwp_no'] = npwpNo;
//     data['npwp_image'] = npwpImage;
//     data['specialist'] = specialist;
//     data['dob'] = dob;
//     data['rating'] = rating;
//     data['status_schedule'] = statusSchedule;
//     data['since'] = since;
//     data['start'] = start;
//     data['until'] = until;
//     data['is_active'] = isActive;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     data['deleted_at'] = deletedAt;
//     data['refresh_token'] = refreshToken;
//     return data;
//   }
// }

// class Meta {
//   int? page;
//   int? take;
//   int? itemCount;
//   int? pageCount;
//   bool? hasPreviousPage;
//   bool? hasNextPage;

//   Meta(
//       {this.page,
//       this.take,
//       this.itemCount,
//       this.pageCount,
//       this.hasPreviousPage,
//       this.hasNextPage});

//   Meta.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     take = json['take'];
//     itemCount = json['itemCount'];
//     pageCount = json['pageCount'];
//     hasPreviousPage = json['hasPreviousPage'];
//     hasNextPage = json['hasNextPage'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['page'] = page;
//     data['take'] = take;
//     data['itemCount'] = itemCount;
//     data['pageCount'] = pageCount;
//     data['hasPreviousPage'] = hasPreviousPage;
//     data['hasNextPage'] = hasNextPage;
//     return data;
//   }
// }


class FindDoctorScheduleModel {
  bool? success;
  String? message;
  Data? data;

  FindDoctorScheduleModel({this.success, this.message, this.data});

  FindDoctorScheduleModel.fromJson(Map<String, dynamic> json) {
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
  List<Data2>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
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
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  TransactionConsultation? transactionConsultation;
  Customer? customer;

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
      this.transactionConsultation,
      this.customer});

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
        ? new TransactionConsultation.fromJson(json['transaction_consultation'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['customer_id'] = this.customerId;
    data['doctor_schedule_id'] = this.doctorScheduleId;
    data['transaction_consultation_id'] = this.transactionConsultationId;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.transactionConsultation != null) {
      data['transaction_consultation'] = this.transactionConsultation!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
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
  String? orderId;
  String? paymentStatus;
  String? paymentExpiryTime;
  String? vaNumber;
  dynamic? billKey;
  dynamic? billerCode;
  String? status;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
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
      this.orderId,
      this.paymentStatus,
      this.paymentExpiryTime,
      this.vaNumber,
      this.billKey,
      this.billerCode,
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
    orderId = json['order_id'];
    paymentStatus = json['payment_status'];
    paymentExpiryTime = json['payment_expiry_time'];
    vaNumber = json['va_number'];
    billKey = json['bill_key'];
    billerCode = json['biller_code'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    medicalHistory = json['medical_history'] != null
        ? new MedicalHistory.fromJson(json['medical_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['medical_history_id'] = this.medicalHistoryId;
    data['duration'] = this.duration;
    data['total_fee'] = this.totalFee;
    data['total_discount'] = this.totalDiscount;
    data['total_paid'] = this.totalPaid;
    data['payment_method_id'] = this.paymentMethodId;
    data['order_id'] = this.orderId;
    data['payment_status'] = this.paymentStatus;
    data['payment_expiry_time'] = this.paymentExpiryTime;
    data['va_number'] = this.vaNumber;
    data['bill_key'] = this.billKey;
    data['biller_code'] = this.billerCode;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory!.toJson();
    }
    return data;
  }
}

class MedicalHistory {
  int? id;
  int? customerId;
  int? interestConditionId;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
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
        ? new InterestCondition.fromJson(json['interest_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['interest_condition_id'] = this.interestConditionId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.interestCondition != null) {
      data['interest_condition'] = this.interestCondition!.toJson();
    }
    return data;
  }
}

class InterestCondition {
  int? id;
  int? concernId;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  Concern? concern;

  InterestCondition(
      {this.id,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.concern});

  InterestCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    concernId = json['concern_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    concern =
        json['concern'] != null ? new Concern.fromJson(json['concern']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['concern_id'] = this.concernId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.concern != null) {
      data['concern'] = this.concern!.toJson();
    }
    return data;
  }
}

class Concern {
  int? id;
  String? name;
  String? segment;
  bool? isActive;
  dynamic? createdBy;
  dynamic? updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;

  Concern(
      {this.id,
      this.name,
      this.segment,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Concern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    segment = json['segment'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['segment'] = this.segment;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? fullname;
  String? username;
  String? email;
  String? password;
  String? noPhone;
  String? gender;
  String? address;
  String? photoProfile;
  String? referralCode;
  dynamic? userCode;
  int? roleId;
  dynamic? verificationCodePhone;
  dynamic? verificationCodeEmail;
  dynamic? provinceId;
  dynamic? cityId;
  dynamic? dob;
  dynamic? bio;
  bool? finishRegister;
  String? verifiedEmailAt;
  String? verifiedPhoneAt;
  dynamic? verifiedAccountAt;
  dynamic? education;
  dynamic? practiceLocation;
  dynamic? joinDate;
  dynamic? title;
  dynamic? sip;
  dynamic? str;
  dynamic? ktpNo;
  dynamic? ktpImage;
  dynamic? npwpNo;
  dynamic? npwpImage;
  dynamic? specialist;
  int? rating;
  dynamic? statusSchedule;
  dynamic? since;
  dynamic? start;
  dynamic? until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic? deletedAt;
  dynamic? refreshToken;

  Customer(
      {this.id,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.noPhone,
      this.gender,
      this.address,
      this.photoProfile,
      this.referralCode,
      this.userCode,
      this.roleId,
      this.verificationCodePhone,
      this.verificationCodeEmail,
      this.provinceId,
      this.cityId,
      this.dob,
      this.bio,
      this.finishRegister,
      this.verifiedEmailAt,
      this.verifiedPhoneAt,
      this.verifiedAccountAt,
      this.education,
      this.practiceLocation,
      this.joinDate,
      this.title,
      this.sip,
      this.str,
      this.ktpNo,
      this.ktpImage,
      this.npwpNo,
      this.npwpImage,
      this.specialist,
      this.rating,
      this.statusSchedule,
      this.since,
      this.start,
      this.until,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.refreshToken});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    noPhone = json['no_phone'];
    gender = json['gender'];
    address = json['address'];
    photoProfile = json['photo_profile'];
    referralCode = json['referral_code'];
    userCode = json['user_code'];
    roleId = json['roleId'];
    verificationCodePhone = json['verification_code_phone'];
    verificationCodeEmail = json['verification_code_email'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    dob = json['dob'];
    bio = json['bio'];
    finishRegister = json['finish_register'];
    verifiedEmailAt = json['verified_email_at'];
    verifiedPhoneAt = json['verified_phone_at'];
    verifiedAccountAt = json['verified_account_at'];
    education = json['education'];
    practiceLocation = json['practice_location'];
    joinDate = json['join_date'];
    title = json['title'];
    sip = json['sip'];
    str = json['str'];
    ktpNo = json['ktp_no'];
    ktpImage = json['ktp_image'];
    npwpNo = json['npwp_no'];
    npwpImage = json['npwp_image'];
    specialist = json['specialist'];
    rating = json['rating'];
    statusSchedule = json['status_schedule'];
    since = json['since'];
    start = json['start'];
    until = json['until'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['no_phone'] = this.noPhone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['photo_profile'] = this.photoProfile;
    data['referral_code'] = this.referralCode;
    data['user_code'] = this.userCode;
    data['roleId'] = this.roleId;
    data['verification_code_phone'] = this.verificationCodePhone;
    data['verification_code_email'] = this.verificationCodeEmail;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['dob'] = this.dob;
    data['bio'] = this.bio;
    data['finish_register'] = this.finishRegister;
    data['verified_email_at'] = this.verifiedEmailAt;
    data['verified_phone_at'] = this.verifiedPhoneAt;
    data['verified_account_at'] = this.verifiedAccountAt;
    data['education'] = this.education;
    data['practice_location'] = this.practiceLocation;
    data['join_date'] = this.joinDate;
    data['title'] = this.title;
    data['sip'] = this.sip;
    data['str'] = this.str;
    data['ktp_no'] = this.ktpNo;
    data['ktp_image'] = this.ktpImage;
    data['npwp_no'] = this.npwpNo;
    data['npwp_image'] = this.npwpImage;
    data['specialist'] = this.specialist;
    data['rating'] = this.rating;
    data['status_schedule'] = this.statusSchedule;
    data['since'] = this.since;
    data['start'] = this.start;
    data['until'] = this.until;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['refresh_token'] = this.refreshToken;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['take'] = this.take;
    data['itemCount'] = this.itemCount;
    data['pageCount'] = this.pageCount;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}