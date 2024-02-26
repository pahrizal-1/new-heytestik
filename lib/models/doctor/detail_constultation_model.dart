class ConsultationDetailModel {
  bool? success;
  String? message;
  Data? data;

  ConsultationDetailModel({this.success, this.message, this.data});

  ConsultationDetailModel.fromJson(Map<String, dynamic> json) {
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
  dynamic startDate;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Customer? customer;
  Doctor? doctor;
  ChatRoom? chatRoom;
  MedicalHistory? medicalHistory;

  Data(
      {this.id,
      this.doctorId,
      this.customerId,
      this.transactionConsultationId,
      this.consultationDoctorScheduleId,
      this.medicalHistoryId,
      this.code,
      this.duration,
      this.startDate,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.customer,
      this.doctor,
      this.chatRoom,
      this.medicalHistory});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    transactionConsultationId = json['transaction_consultation_id'];
    consultationDoctorScheduleId = json['consultation_doctor_schedule_id'];
    medicalHistoryId = json['medical_history_id'];
    code = json['code'];
    duration = json['duration'];
    startDate = json['start_date'];
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
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
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
    data['start_date'] = startDate;
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
    if (medicalHistory != null) {
      data['medical_history'] = medicalHistory!.toJson();
    }
    return data;
  }
}

class Customer {
  int? id;
  String? fullname;
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
  dynamic dob;
  int? rating;
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
      this.dob,
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
    dob = json['dob'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
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
    data['dob'] = dob;
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
  dynamic dob;
  int? rating;
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
      this.dob,
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
    dob = json['dob'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
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
    data['dob'] = dob;
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
  int? interestConditionsCategoryId;
  String? name;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Category? category;

  InterestCondition(
      {this.id,
      this.interestConditionsCategoryId,
      this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.category});

  InterestCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestConditionsCategoryId = json['interest_conditions_category_id'];
    name = json['name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
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
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Category(
      {this.id,
      this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['name'] = name;
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
