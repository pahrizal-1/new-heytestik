class ConsultationDetailModel {
  bool? success;
  String? message;
  Data? data;

  ConsultationDetailModel({this.success, this.message, this.data});

  ConsultationDetailModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  int? doctorId;
  int? customerId;
  String? transactionConsultationId;
  int? consultationDoctorScheduleId;
  int? medicalHistoryId;
  String? code;
  int? duration;
  Null? startDate;
  String? status;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    chatRoom = json['chat_room'] != null
        ? new ChatRoom.fromJson(json['chat_room'])
        : null;
    medicalHistory = json['medical_history'] != null
        ? new MedicalHistory.fromJson(json['medical_history'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['customer_id'] = this.customerId;
    data['transaction_consultation_id'] = this.transactionConsultationId;
    data['consultation_doctor_schedule_id'] = this.consultationDoctorScheduleId;
    data['medical_history_id'] = this.medicalHistoryId;
    data['code'] = this.code;
    data['duration'] = this.duration;
    data['start_date'] = this.startDate;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.chatRoom != null) {
      data['chat_room'] = this.chatRoom!.toJson();
    }
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory!.toJson();
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
  Null? userCode;
  int? roleId;
  Null? verificationCodePhone;
  Null? verificationCodeEmail;
  Null? provinceId;
  Null? cityId;
  Null? education;
  Null? practiceLocation;
  Null? joinDate;
  Null? title;
  Null? sip;
  Null? str;
  Null? ktpNo;
  Null? ktpImage;
  Null? npwpNo;
  Null? npwpImage;
  Null? specialist;
  Null? dob;
  int? rating;
  Null? statusSchedule;
  Null? since;
  Null? start;
  Null? until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? refreshToken;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
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
    data['dob'] = this.dob;
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
  Null? userCode;
  int? roleId;
  Null? verificationCodePhone;
  Null? verificationCodeEmail;
  Null? provinceId;
  Null? cityId;
  String? education;
  String? practiceLocation;
  Null? joinDate;
  Null? title;
  String? sip;
  String? str;
  Null? ktpNo;
  Null? ktpImage;
  Null? npwpNo;
  Null? npwpImage;
  String? specialist;
  Null? dob;
  int? rating;
  Null? statusSchedule;
  Null? since;
  Null? start;
  Null? until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Null? refreshToken;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['fullname'] = this.fullname;
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
    data['dob'] = this.dob;
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

class ChatRoom {
  int? id;
  int? doctorId;
  int? customerId;
  String? code;
  bool? ended;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['customer_id'] = this.customerId;
    data['code'] = this.code;
    data['ended'] = this.ended;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class MedicalHistory {
  int? id;
  int? customerId;
  int? interestConditionId;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
        mediaMedicalHistories!.add(new MediaMedicalHistories.fromJson(v));
      });
    }
    interestCondition = json['interest_condition'] != null
        ? new InterestCondition.fromJson(json['interest_condition'])
        : null;
    if (json['medical_history_items'] != null) {
      medicalHistoryItems = <MedicalHistoryItems>[];
      json['medical_history_items'].forEach((v) {
        medicalHistoryItems!.add(new MedicalHistoryItems.fromJson(v));
      });
    }
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
    if (this.mediaMedicalHistories != null) {
      data['media_medical_histories'] =
          this.mediaMedicalHistories!.map((v) => v.toJson()).toList();
    }
    if (this.interestCondition != null) {
      data['interest_condition'] = this.interestCondition!.toJson();
    }
    if (this.medicalHistoryItems != null) {
      data['medical_history_items'] =
          this.medicalHistoryItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaMedicalHistories {
  int? id;
  int? mediaId;
  int? medicalHistoryId;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['medical_history_id'] = this.medicalHistoryId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.media != null) {
      data['media'] = this.media!.toJson();
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
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['destination'] = this.destination;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class InterestCondition {
  int? id;
  int? interestConditionsCategoryId;
  String? name;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['interest_conditions_category_id'] = this.interestConditionsCategoryId;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class MedicalHistoryItems {
  int? id;
  int? medicalHistoryId;
  int? interestConditionQuestionId;
  int? interestConditionAnswerId;
  Null? answerDescription;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
        ? new InterestConditionsAnswer.fromJson(
            json['interest_conditions_answer'])
        : null;
    interestConditionsQuestion = json['interest_conditions_question'] != null
        ? new InterestConditionsQuestion.fromJson(
            json['interest_conditions_question'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['medical_history_id'] = this.medicalHistoryId;
    data['interest_condition_question_id'] = this.interestConditionQuestionId;
    data['interest_condition_answer_id'] = this.interestConditionAnswerId;
    data['answer_description'] = this.answerDescription;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.interestConditionsAnswer != null) {
      data['interest_conditions_answer'] =
          this.interestConditionsAnswer!.toJson();
    }
    if (this.interestConditionsQuestion != null) {
      data['interest_conditions_question'] =
          this.interestConditionsQuestion!.toJson();
    }
    return data;
  }
}

class InterestConditionsAnswer {
  int? id;
  String? name;
  int? position;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['interest_conditions_question_id'] = this.interestConditionsQuestionId;
    return data;
  }
}

class InterestConditionsQuestion {
  int? id;
  String? name;
  String? type;
  String? typeAnswer;
  int? interestConditionsId;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['type_answer'] = this.typeAnswer;
    data['interest_conditions_id'] = this.interestConditionsId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}