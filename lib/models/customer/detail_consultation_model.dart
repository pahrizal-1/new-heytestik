class DetailConsultationModel {
  bool? success;
  String? message;
  Data? data;

  DetailConsultationModel({this.success, this.message, this.data});

  DetailConsultationModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorId;
  int? customerId;
  String? transactionConsultationId;
  int? consultationDoctorScheduleId;
  int? medicalHistoryId;
  String? code;
  int? duration;
  dynamic endDate;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Customer? customer;
  Doctor? doctor;
  ChatRoom? chatRoom;
  TransactionConsultation? transactionConsultation;
  MedicalHistory? medicalHistory;
  ConsultationDoctorNote? consultationDoctorNote;
  List<ConsultationRecomendationSkincare>? consultationRecomendationSkincare;
  List<ConsultationRecomendationTreatment>? consultationRecomendationTreatment;
  List<ConsultationRecipeDrug>? consultationRecipeDrug;

  Data(
      {this.id,
      this.doctorId,
      this.customerId,
      this.transactionConsultationId,
      this.consultationDoctorScheduleId,
      this.medicalHistoryId,
      this.code,
      this.duration,
      this.endDate,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.customer,
      this.doctor,
      this.chatRoom,
      this.transactionConsultation,
      this.medicalHistory,
      this.consultationDoctorNote,
      this.consultationRecomendationSkincare,
      this.consultationRecomendationTreatment,
      this.consultationRecipeDrug});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    transactionConsultationId = json['transaction_consultation_id'];
    consultationDoctorScheduleId = json['consultation_doctor_schedule_id'];
    medicalHistoryId = json['medical_history_id'];
    code = json['code'];
    duration = json['duration'];
    endDate = json['end_date'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    chatRoom =
        json['chat_room'] != null ? ChatRoom.fromJson(json['chat_room']) : null;
    transactionConsultation = json['transaction_consultation'] != null
        ? TransactionConsultation.fromJson(json['transaction_consultation'])
        : null;
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
    consultationDoctorNote = json['consultation_doctor_note'] != null
        ? ConsultationDoctorNote.fromJson(json['consultation_doctor_note'])
        : null;
    if (json['consultation_recomendation_skincare'] != null) {
      consultationRecomendationSkincare = <ConsultationRecomendationSkincare>[];
      json['consultation_recomendation_skincare'].forEach((v) {
        consultationRecomendationSkincare!
            .add(ConsultationRecomendationSkincare.fromJson(v));
      });
    }
    if (json['consultation_recomendation_treatment'] != null) {
      consultationRecomendationTreatment =
          <ConsultationRecomendationTreatment>[];
      json['consultation_recomendation_treatment'].forEach((v) {
        consultationRecomendationTreatment!
            .add(ConsultationRecomendationTreatment.fromJson(v));
      });
    }
    if (json['consultation_recipe_drug'] != null) {
      consultationRecipeDrug = <ConsultationRecipeDrug>[];
      json['consultation_recipe_drug'].forEach((v) {
        consultationRecipeDrug!.add(ConsultationRecipeDrug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['customer_id'] = customerId;
    data['transaction_consultation_id'] = transactionConsultationId;
    data['consultation_doctor_schedule_id'] = consultationDoctorScheduleId;
    data['medical_history_id'] = medicalHistoryId;
    data['code'] = code;
    data['duration'] = duration;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (chatRoom != null) {
      data['chat_room'] = chatRoom!.toJson();
    }
    if (transactionConsultation != null) {
      data['transaction_consultation'] = transactionConsultation!.toJson();
    }
    if (medicalHistory != null) {
      data['medical_history'] = medicalHistory!.toJson();
    }
    if (consultationDoctorNote != null) {
      data['consultation_doctor_note'] = consultationDoctorNote!.toJson();
    }
    if (consultationRecomendationSkincare != null) {
      data['consultation_recomendation_skincare'] =
          consultationRecomendationSkincare!.map((v) => v.toJson()).toList();
    }
    if (consultationRecomendationTreatment != null) {
      data['consultation_recomendation_treatment'] =
          consultationRecomendationTreatment!.map((v) => v.toJson()).toList();
    }
    if (consultationRecipeDrug != null) {
      data['consultation_recipe_drug'] =
          consultationRecipeDrug!.map((v) => v.toJson()).toList();
    }
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
  dynamic userCode;
  int? roleId;
  dynamic verificationCodePhone;
  dynamic verificationCodeEmail;
  dynamic provinceId;
  dynamic cityId;
  dynamic dob;
  dynamic bio;
  bool? finishRegister;
  String? verifiedEmailAt;
  String? verifiedPhoneAt;
  dynamic verifiedAccountAt;
  dynamic education;
  dynamic practiceLocation;
  dynamic joinDate;
  dynamic title;
  dynamic sip;
  dynamic str;
  dynamic ktpNo;
  dynamic ktpImage;
  dynamic npwpNo;
  dynamic npwpImage;
  dynamic specialist;
  double? rating;
  dynamic statusSchedule;
  dynamic since;
  dynamic start;
  dynamic until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic refreshToken;

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
    rating = double.parse(json['rating'].toString());
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['address'] = address;
    data['photo_profile'] = photoProfile;
    data['referral_code'] = referralCode;
    data['user_code'] = userCode;
    data['roleId'] = roleId;
    data['verification_code_phone'] = verificationCodePhone;
    data['verification_code_email'] = verificationCodeEmail;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['dob'] = dob;
    data['bio'] = bio;
    data['finish_register'] = finishRegister;
    data['verified_email_at'] = verifiedEmailAt;
    data['verified_phone_at'] = verifiedPhoneAt;
    data['verified_account_at'] = verifiedAccountAt;
    data['education'] = education;
    data['practice_location'] = practiceLocation;
    data['join_date'] = joinDate;
    data['title'] = title;
    data['sip'] = sip;
    data['str'] = str;
    data['ktp_no'] = ktpNo;
    data['ktp_image'] = ktpImage;
    data['npwp_no'] = npwpNo;
    data['npwp_image'] = npwpImage;
    data['specialist'] = specialist;
    data['rating'] = rating;
    data['status_schedule'] = statusSchedule;
    data['since'] = since;
    data['start'] = start;
    data['until'] = until;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class Doctor {
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
  dynamic userCode;
  int? roleId;
  dynamic verificationCodePhone;
  dynamic verificationCodeEmail;
  dynamic provinceId;
  dynamic cityId;
  dynamic dob;
  dynamic bio;
  bool? finishRegister;
  dynamic verifiedEmailAt;
  dynamic verifiedPhoneAt;
  dynamic verifiedAccountAt;
  String? education;
  String? practiceLocation;
  dynamic joinDate;
  dynamic title;
  String? sip;
  String? str;
  dynamic ktpNo;
  dynamic ktpImage;
  dynamic npwpNo;
  dynamic npwpImage;
  String? specialist;
  double? rating;
  dynamic statusSchedule;
  dynamic since;
  dynamic start;
  dynamic until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic refreshToken;

  Doctor(
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

  Doctor.fromJson(Map<String, dynamic> json) {
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
    rating = double.parse(json['rating'].toString());
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['address'] = address;
    data['photo_profile'] = photoProfile;
    data['referral_code'] = referralCode;
    data['user_code'] = userCode;
    data['roleId'] = roleId;
    data['verification_code_phone'] = verificationCodePhone;
    data['verification_code_email'] = verificationCodeEmail;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['dob'] = dob;
    data['bio'] = bio;
    data['finish_register'] = finishRegister;
    data['verified_email_at'] = verifiedEmailAt;
    data['verified_phone_at'] = verifiedPhoneAt;
    data['verified_account_at'] = verifiedAccountAt;
    data['education'] = education;
    data['practice_location'] = practiceLocation;
    data['join_date'] = joinDate;
    data['title'] = title;
    data['sip'] = sip;
    data['str'] = str;
    data['ktp_no'] = ktpNo;
    data['ktp_image'] = ktpImage;
    data['npwp_no'] = npwpNo;
    data['npwp_image'] = npwpImage;
    data['specialist'] = specialist;
    data['rating'] = rating;
    data['status_schedule'] = statusSchedule;
    data['since'] = since;
    data['start'] = start;
    data['until'] = until;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class ChatRoom {
  int? id;
  int? doctorId;
  int? customerId;
  String? code;
  bool? ended;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ChatRoom(
      {this.id,
      this.doctorId,
      this.customerId,
      this.code,
      this.ended,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ChatRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    code = json['code'];
    ended = json['ended'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['customer_id'] = customerId;
    data['code'] = code;
    data['ended'] = ended;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
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
  dynamic paymentExpiryTime;
  dynamic vaNumber;
  dynamic billKey;
  dynamic billerCode;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  ConsultationInvoice? consultationInvoice;

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
      this.consultationInvoice});

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
    consultationInvoice = json['consultation_invoice'] != null
        ? ConsultationInvoice.fromJson(json['consultation_invoice'])
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
    data['order_id'] = orderId;
    data['payment_status'] = paymentStatus;
    data['payment_expiry_time'] = paymentExpiryTime;
    data['va_number'] = vaNumber;
    data['bill_key'] = billKey;
    data['biller_code'] = billerCode;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (consultationInvoice != null) {
      data['consultation_invoice'] = consultationInvoice!.toJson();
    }
    return data;
  }
}

class ConsultationInvoice {
  int? id;
  int? customerId;
  String? transactionConsultationId;
  String? invoiceNumber;
  String? consultationId;
  String? consultationDate;
  String? doctorName;
  String? doctorNpwp;
  String? doctorAddress;
  String? customerName;
  String? customerNpwp;
  String? transactionDetail;
  int? totalFee;
  int? totalDiscount;
  int? totalPaid;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ConsultationInvoice(
      {this.id,
      this.customerId,
      this.transactionConsultationId,
      this.invoiceNumber,
      this.consultationId,
      this.consultationDate,
      this.doctorName,
      this.doctorNpwp,
      this.doctorAddress,
      this.customerName,
      this.customerNpwp,
      this.transactionDetail,
      this.totalFee,
      this.totalDiscount,
      this.totalPaid,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ConsultationInvoice.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    transactionConsultationId = json['transaction_consultation_id'];
    invoiceNumber = json['invoice_number'];
    consultationId = json['consultation_id'];
    consultationDate = json['consultation_date'];
    doctorName = json['doctor_name'];
    doctorNpwp = json['doctor_npwp'];
    doctorAddress = json['doctor_address'];
    customerName = json['customer_name'];
    customerNpwp = json['customer_npwp'];
    transactionDetail = json['transaction_detail'];
    totalFee = json['total_fee'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['transaction_consultation_id'] = transactionConsultationId;
    data['invoice_number'] = invoiceNumber;
    data['consultation_id'] = consultationId;
    data['consultation_date'] = consultationDate;
    data['doctor_name'] = doctorName;
    data['doctor_npwp'] = doctorNpwp;
    data['doctor_address'] = doctorAddress;
    data['customer_name'] = customerName;
    data['customer_npwp'] = customerNpwp;
    data['transaction_detail'] = transactionDetail;
    data['total_fee'] = totalFee;
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
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
  List<MediaMedicalHistories>? mediaMedicalHistories;
  InterestCondition? interestCondition;
  List<MedicalHistoryItems>? medicalHistoryItems;

  MedicalHistory(
      {this.id,
      this.customerId,
      this.interestConditionId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaMedicalHistories,
      this.interestCondition,
      this.medicalHistoryItems});

  MedicalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    interestConditionId = json['interest_condition_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media_medical_histories'] != null) {
      mediaMedicalHistories = <MediaMedicalHistories>[];
      json['media_medical_histories'].forEach((v) {
        mediaMedicalHistories!.add(MediaMedicalHistories.fromJson(v));
      });
    }
    interestCondition = json['interest_condition'] != null
        ? InterestCondition.fromJson(json['interest_condition'])
        : null;
    if (json['medical_history_items'] != null) {
      medicalHistoryItems = <MedicalHistoryItems>[];
      json['medical_history_items'].forEach((v) {
        medicalHistoryItems!.add(MedicalHistoryItems.fromJson(v));
      });
    }
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
    if (mediaMedicalHistories != null) {
      data['media_medical_histories'] =
          mediaMedicalHistories!.map((v) => v.toJson()).toList();
    }
    if (interestCondition != null) {
      data['interest_condition'] = interestCondition!.toJson();
    }
    if (medicalHistoryItems != null) {
      data['medical_history_items'] =
          medicalHistoryItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMedicalHistories {
  int? id;
  int? mediaId;
  int? medicalHistoryId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaMedicalHistories(
      {this.id,
      this.mediaId,
      this.medicalHistoryId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaMedicalHistories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    medicalHistoryId = json['medical_history_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['medical_history_id'] = medicalHistoryId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Media {
  int? id;
  String? filename;
  String? ext;
  int? size;
  String? mime;
  String? path;
  String? destination;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Media(
      {this.id,
      this.filename,
      this.ext,
      this.size,
      this.mime,
      this.path,
      this.destination,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    ext = json['ext'];
    size = json['size'];
    mime = json['mime'];
    path = json['path'];
    destination = json['destination'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['ext'] = ext;
    data['size'] = size;
    data['mime'] = mime;
    data['path'] = path;
    data['destination'] = destination;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class InterestCondition {
  int? id;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
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
        json['concern'] != null ? Concern.fromJson(json['concern']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['concern_id'] = concernId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (concern != null) {
      data['concern'] = concern!.toJson();
    }
    return data;
  }
}

class Concern {
  int? id;
  String? name;
  String? segment;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['segment'] = segment;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MedicalHistoryItems {
  int? id;
  int? medicalHistoryId;
  int? interestConditionQuestionId;
  int? interestConditionAnswerId;
  dynamic answerDescription;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  InterestConditionsAnswer? interestConditionsAnswer;
  InterestConditionsQuestion? interestConditionsQuestion;

  MedicalHistoryItems(
      {this.id,
      this.medicalHistoryId,
      this.interestConditionQuestionId,
      this.interestConditionAnswerId,
      this.answerDescription,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestConditionsAnswer,
      this.interestConditionsQuestion});

  MedicalHistoryItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    medicalHistoryId = json['medical_history_id'];
    interestConditionQuestionId = json['interest_condition_question_id'];
    interestConditionAnswerId = json['interest_condition_answer_id'];
    answerDescription = json['answer_description'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    interestConditionsAnswer = json['interest_conditions_answer'] != null
        ? InterestConditionsAnswer.fromJson(json['interest_conditions_answer'])
        : null;
    interestConditionsQuestion = json['interest_conditions_question'] != null
        ? InterestConditionsQuestion.fromJson(
            json['interest_conditions_question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['medical_history_id'] = medicalHistoryId;
    data['interest_condition_question_id'] = interestConditionQuestionId;
    data['interest_condition_answer_id'] = interestConditionAnswerId;
    data['answer_description'] = answerDescription;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (interestConditionsAnswer != null) {
      data['interest_conditions_answer'] = interestConditionsAnswer!.toJson();
    }
    if (interestConditionsQuestion != null) {
      data['interest_conditions_question'] =
          interestConditionsQuestion!.toJson();
    }
    return data;
  }
}

class InterestConditionsAnswer {
  int? id;
  String? name;
  int? position;
  bool? withDescription;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? interestConditionsQuestionId;

  InterestConditionsAnswer(
      {this.id,
      this.name,
      this.position,
      this.withDescription,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestConditionsQuestionId});

  InterestConditionsAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    withDescription = json['with_description'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    interestConditionsQuestionId = json['interest_conditions_question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['with_description'] = withDescription;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['interest_conditions_question_id'] = interestConditionsQuestionId;
    return data;
  }
}

class InterestConditionsQuestion {
  int? id;
  String? name;
  String? type;
  String? typeAnswer;
  int? interestConditionsId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  InterestConditionsQuestion(
      {this.id,
      this.name,
      this.type,
      this.typeAnswer,
      this.interestConditionsId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  InterestConditionsQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeAnswer = json['type_answer'];
    interestConditionsId = json['interest_conditions_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['type_answer'] = typeAnswer;
    data['interest_conditions_id'] = interestConditionsId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ConsultationDoctorNote {
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

  ConsultationDoctorNote(
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

  ConsultationDoctorNote.fromJson(Map<String, dynamic> json) {
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

class ConsultationRecomendationSkincare {
  int? id;
  int? consultationId;
  int? productId;
  int? qty;
  String? notes;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;

  ConsultationRecomendationSkincare(
      {this.id,
      this.consultationId,
      this.productId,
      this.qty,
      this.notes,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product});

  ConsultationRecomendationSkincare.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    productId = json['product_id'];
    qty = json['qty'];
    notes = json['notes'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['notes'] = notes;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? type;
  String? category;
  String? display;
  bool? hasVariant;
  int? minOrder;
  int? price;
  bool? productIsActive;
  int? productStock;
  String? productTreshold;
  String? productSku;
  double? rating;
  int? shippingProductWeight;
  String? shippingProductWeightType;
  String? shippingProductSizeLengthType;
  String? shippingProductSizeWidthType;
  String? shippingProductSizeHeightType;
  int? shippingProductSizeLength;
  int? shippingProductSizeWidth;
  int? shippingProductSizeHeight;
  String? shipping;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  SkincareDetail? skincareDetail;
  DrugDetail? drugDetail;
  List<MediaProducts>? mediaProducts;

  Product(
      {this.id,
      this.name,
      this.type,
      this.category,
      this.display,
      this.hasVariant,
      this.minOrder,
      this.price,
      this.productIsActive,
      this.productStock,
      this.productTreshold,
      this.productSku,
      this.rating,
      this.shippingProductWeight,
      this.shippingProductWeightType,
      this.shippingProductSizeLengthType,
      this.shippingProductSizeWidthType,
      this.shippingProductSizeHeightType,
      this.shippingProductSizeLength,
      this.shippingProductSizeWidth,
      this.shippingProductSizeHeight,
      this.shipping,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.skincareDetail,
      this.drugDetail,
      this.mediaProducts});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    category = json['category'];
    display = json['display'];
    hasVariant = json['has_variant'];
    minOrder = json['min_order'];
    price = json['price'];
    productIsActive = json['product_is_active'];
    productStock = json['product_stock'];
    productTreshold = json['product_treshold'];
    productSku = json['product_sku'];
    rating = double.parse(json['rating'].toString());
    shippingProductWeight = json['shipping_product_weight'];
    shippingProductWeightType = json['shipping_product_weight_type'];
    shippingProductSizeLengthType = json['shipping_product_size_length_type'];
    shippingProductSizeWidthType = json['shipping_product_size_width_type'];
    shippingProductSizeHeightType = json['shipping_product_size_height_type'];
    shippingProductSizeLength = json['shipping_product_size_length'];
    shippingProductSizeWidth = json['shipping_product_size_width'];
    shippingProductSizeHeight = json['shipping_product_size_height'];
    shipping = json['shipping'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    skincareDetail = json['skincare_detail'] != null
        ? SkincareDetail.fromJson(json['skincare_detail'])
        : null;
    drugDetail = json['drug_detail'] != null
        ? DrugDetail.fromJson(json['drug_detail'])
        : null;
    if (json['media_products'] != null) {
      mediaProducts = <MediaProducts>[];
      json['media_products'].forEach((v) {
        mediaProducts!.add(MediaProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['category'] = category;
    data['display'] = display;
    data['has_variant'] = hasVariant;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['product_is_active'] = productIsActive;
    data['product_stock'] = productStock;
    data['product_treshold'] = productTreshold;
    data['product_sku'] = productSku;
    data['rating'] = rating;
    data['shipping_product_weight'] = shippingProductWeight;
    data['shipping_product_weight_type'] = shippingProductWeightType;
    data['shipping_product_size_length_type'] = shippingProductSizeLengthType;
    data['shipping_product_size_width_type'] = shippingProductSizeWidthType;
    data['shipping_product_size_height_type'] = shippingProductSizeHeightType;
    data['shipping_product_size_length'] = shippingProductSizeLength;
    data['shipping_product_size_width'] = shippingProductSizeWidth;
    data['shipping_product_size_height'] = shippingProductSizeHeight;
    data['shipping'] = shipping;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (skincareDetail != null) {
      data['skincare_detail'] = skincareDetail!.toJson();
    }
    if (drugDetail != null) {
      data['drug_detail'] = drugDetail!.toJson();
    }
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkincareDetail {
  int? id;
  int? productId;
  String? brand;
  String? description;
  String? specificationTexture;
  String? specificationBpom;
  int? specificationNetto;
  String? specificationNettoType;
  String? specificationExpired;
  String? specificationPackagingType;
  String? specificationIngredients;
  String? specificationHowToUse;
  String? specificationStorageAdvice;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkincareDetail(
      {this.id,
      this.productId,
      this.brand,
      this.description,
      this.specificationTexture,
      this.specificationBpom,
      this.specificationNetto,
      this.specificationNettoType,
      this.specificationExpired,
      this.specificationPackagingType,
      this.specificationIngredients,
      this.specificationHowToUse,
      this.specificationStorageAdvice,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkincareDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    brand = json['brand'];
    description = json['description'];
    specificationTexture = json['specification_texture'];
    specificationBpom = json['specification_bpom'];
    specificationNetto = json['specification_netto'];
    specificationNettoType = json['specification_netto_type'];
    specificationExpired = json['specification_expired'];
    specificationPackagingType = json['specification_packaging_type'];
    specificationIngredients = json['specification_ingredients'];
    specificationHowToUse = json['specification_how_to_use'];
    specificationStorageAdvice = json['specification_storage_advice'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['brand'] = brand;
    data['description'] = description;
    data['specification_texture'] = specificationTexture;
    data['specification_bpom'] = specificationBpom;
    data['specification_netto'] = specificationNetto;
    data['specification_netto_type'] = specificationNettoType;
    data['specification_expired'] = specificationExpired;
    data['specification_packaging_type'] = specificationPackagingType;
    data['specification_ingredients'] = specificationIngredients;
    data['specification_how_to_use'] = specificationHowToUse;
    data['specification_storage_advice'] = specificationStorageAdvice;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class DrugDetail {
  int? id;
  int? productId;
  String? manufacture;
  String? indication;
  String? contradiction;
  String? description;
  String? specificationForm;
  String? specificationClassification;
  String? specificationType;
  String? specificationPackaging;
  String? specificationCategory;
  String? specificationBpom;
  String? specificationIngredients;
  String? specificationDose;
  String? specificationSpecialAttention;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  DrugDetail(
      {this.id,
      this.productId,
      this.manufacture,
      this.indication,
      this.contradiction,
      this.description,
      this.specificationForm,
      this.specificationClassification,
      this.specificationType,
      this.specificationPackaging,
      this.specificationCategory,
      this.specificationBpom,
      this.specificationIngredients,
      this.specificationDose,
      this.specificationSpecialAttention,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DrugDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    manufacture = json['manufacture'];
    indication = json['indication'];
    contradiction = json['contradiction'];
    description = json['description'];
    specificationForm = json['specification_form'];
    specificationClassification = json['specification_classification'];
    specificationType = json['specification_type'];
    specificationPackaging = json['specification_packaging'];
    specificationCategory = json['specification_category'];
    specificationBpom = json['specification_bpom'];
    specificationIngredients = json['specification_ingredients'];
    specificationDose = json['specification_dose'];
    specificationSpecialAttention = json['specification_special_attention'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['manufacture'] = manufacture;
    data['indication'] = indication;
    data['contradiction'] = contradiction;
    data['description'] = description;
    data['specification_form'] = specificationForm;
    data['specification_classification'] = specificationClassification;
    data['specification_type'] = specificationType;
    data['specification_packaging'] = specificationPackaging;
    data['specification_category'] = specificationCategory;
    data['specification_bpom'] = specificationBpom;
    data['specification_ingredients'] = specificationIngredients;
    data['specification_dose'] = specificationDose;
    data['specification_special_attention'] = specificationSpecialAttention;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaProducts {
  int? id;
  int? mediaId;
  int? productId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaProducts(
      {this.id,
      this.mediaId,
      this.productId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    productId = json['product_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['product_id'] = productId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class ConsultationRecomendationTreatment {
  int? id;
  int? consultationId;
  String? name;
  String? cost;
  String? recoveryTime;
  String? type;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<ConsultationRecomendationTreatmentClinics>?
      consultationRecomendationTreatmentClinics;

  ConsultationRecomendationTreatment(
      {this.id,
      this.consultationId,
      this.name,
      this.cost,
      this.recoveryTime,
      this.type,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.consultationRecomendationTreatmentClinics});

  ConsultationRecomendationTreatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    name = json['name'];
    cost = json['cost'];
    recoveryTime = json['recovery_time'];
    type = json['type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['consultation_recomendation_treatment_clinics'] != null) {
      consultationRecomendationTreatmentClinics =
          <ConsultationRecomendationTreatmentClinics>[];
      json['consultation_recomendation_treatment_clinics'].forEach((v) {
        consultationRecomendationTreatmentClinics!
            .add(ConsultationRecomendationTreatmentClinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['name'] = name;
    data['cost'] = cost;
    data['recovery_time'] = recoveryTime;
    data['type'] = type;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (consultationRecomendationTreatmentClinics != null) {
      data['consultation_recomendation_treatment_clinics'] =
          consultationRecomendationTreatmentClinics!
              .map((v) => v.toJson())
              .toList();
    }
    return data;
  }
}

class ConsultationRecipeDrug {
  int? id;
  int? consultationId;
  int? productId;
  int? customerId;
  String? notes;
  int? redeemAmount;
  int? remainingRedeemAmount;
  String? dueDate;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;

  ConsultationRecipeDrug(
      {this.id,
      this.consultationId,
      this.productId,
      this.customerId,
      this.notes,
      this.redeemAmount,
      this.remainingRedeemAmount,
      this.dueDate,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product});

  ConsultationRecipeDrug.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    notes = json['notes'];
    redeemAmount = json['redeem_amount'];
    remainingRedeemAmount = json['remaining_redeem_amount'];
    dueDate = json['due_date'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['product_id'] = productId;
    data['customer_id'] = customerId;
    data['notes'] = notes;
    data['redeem_amount'] = redeemAmount;
    data['remaining_redeem_amount'] = remainingRedeemAmount;
    data['due_date'] = dueDate;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ConsultationRecomendationTreatmentClinics {
  int? id;
  int? consultationRecomendationTreatmentId;
  int? consultationId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Clinic? clinic;

  ConsultationRecomendationTreatmentClinics(
      {this.id,
      this.consultationRecomendationTreatmentId,
      this.consultationId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.clinic});

  ConsultationRecomendationTreatmentClinics.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    consultationRecomendationTreatmentId =
        json['consultation_recomendation_treatment_id'];
    consultationId = json['consultation_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_recomendation_treatment_id'] =
        consultationRecomendationTreatmentId;
    data['consultation_id'] = consultationId;
    data['clinic_id'] = clinicId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}

class Clinic {
  int? id;
  String? name;
  String? address;
  double? pinpointLatitude;
  double? pinpointLongitude;
  String? pinpointAddress;
  int? provinceId;
  int? cityId;
  int? postalCode;
  int? registrationNumber;
  String? phone;
  String? email;
  String? description;
  String? companyName;
  String? companyAddress;
  int? companyCityId;
  int? companyProvinceId;
  String? companyPostalCode;
  String? npwp;
  String? picName;
  String? picPhone;
  String? contractExpiredDate;
  dynamic status;
  double? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  City? city;
  Province? province;
  City? cityCompany;
  Province? provinceCompany;
  MediaClinicLogo? mediaClinicLogo;
  List<MediaClinics>? mediaClinics;

  Clinic(
      {this.id,
      this.name,
      this.address,
      this.pinpointLatitude,
      this.pinpointLongitude,
      this.pinpointAddress,
      this.provinceId,
      this.cityId,
      this.postalCode,
      this.registrationNumber,
      this.phone,
      this.email,
      this.description,
      this.companyName,
      this.companyAddress,
      this.companyCityId,
      this.companyProvinceId,
      this.companyPostalCode,
      this.npwp,
      this.picName,
      this.picPhone,
      this.contractExpiredDate,
      this.status,
      this.rating,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.city,
      this.province,
      this.cityCompany,
      this.provinceCompany,
      this.mediaClinicLogo,
      this.mediaClinics});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    pinpointLatitude = json['pinpoint_latitude'];
    pinpointLongitude = json['pinpoint_longitude'];
    pinpointAddress = json['pinpoint_address'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    postalCode = json['postal_code'];
    registrationNumber = json['registration_number'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyCityId = json['company_city_id'];
    companyProvinceId = json['company_province_id'];
    companyPostalCode = json['company_postal_code'];
    npwp = json['npwp'];
    picName = json['pic_name'];
    picPhone = json['pic_phone'];
    contractExpiredDate = json['contract_expired_date'];
    status = json['status'];
    rating = double.parse(json['rating'].toString());
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    cityCompany = json['city_company'] != null
        ? City.fromJson(json['city_company'])
        : null;
    provinceCompany = json['province_company'] != null
        ? Province.fromJson(json['province_company'])
        : null;
    mediaClinicLogo = json['media_clinic_logo'] != null
        ? MediaClinicLogo.fromJson(json['media_clinic_logo'])
        : null;
    if (json['media_clinics'] != null) {
      mediaClinics = <MediaClinics>[];
      json['media_clinics'].forEach((v) {
        mediaClinics!.add(MediaClinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['pinpoint_latitude'] = pinpointLatitude;
    data['pinpoint_longitude'] = pinpointLongitude;
    data['pinpoint_address'] = pinpointAddress;
    data['province_id'] = provinceId;
    data['city_id'] = cityId;
    data['postal_code'] = postalCode;
    data['registration_number'] = registrationNumber;
    data['phone'] = phone;
    data['email'] = email;
    data['description'] = description;
    data['company_name'] = companyName;
    data['company_address'] = companyAddress;
    data['company_city_id'] = companyCityId;
    data['company_province_id'] = companyProvinceId;
    data['company_postal_code'] = companyPostalCode;
    data['npwp'] = npwp;
    data['pic_name'] = picName;
    data['pic_phone'] = picPhone;
    data['contract_expired_date'] = contractExpiredDate;
    data['status'] = status;
    data['rating'] = rating;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (cityCompany != null) {
      data['city_company'] = cityCompany!.toJson();
    }
    if (provinceCompany != null) {
      data['province_company'] = provinceCompany!.toJson();
    }
    if (mediaClinicLogo != null) {
      data['media_clinic_logo'] = mediaClinicLogo!.toJson();
    }
    if (mediaClinics != null) {
      data['media_clinics'] = mediaClinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? provincesId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  City(
      {this.id,
      this.name,
      this.provincesId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provincesId = json['provinces_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['provinces_id'] = provincesId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Province {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Province(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaClinics {
  int? id;
  int? mediaId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaClinics(
      {this.id,
      this.mediaId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaClinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['clinic_id'] = clinicId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class MediaClinicLogo {
  int? id;
  int? mediaId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaClinicLogo(
      {this.id,
      this.mediaId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaClinicLogo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['clinic_id'] = clinicId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}
