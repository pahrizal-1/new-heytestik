class RecentChatModel {
  bool? success;
  String? message;
  List<Data>? data;

  RecentChatModel({this.success, this.message, this.data});

  RecentChatModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorId;
  int? customerId;
  String? code;
  bool? ended;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  Doctor? doctor;
  Doctor? customer;
  LastChat? lastChat;
  int? unseenCount;

  Data(
      {this.id,
      this.doctorId,
      this.customerId,
      this.code,
      this.ended,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.doctor,
      this.customer,
      this.lastChat,
      this.unseenCount});

  Data.fromJson(Map<String, dynamic> json) {
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
    doctor =
        json['doctor'] != null ? new Doctor.fromJson(json['doctor']) : null;
    customer =
        json['customer'] != null ? new Doctor.fromJson(json['customer']) : null;
    lastChat = json['last_chat'] != null
        ? new LastChat.fromJson(json['last_chat'])
        : null;
    unseenCount = json['unseen_count'];
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
    if (this.doctor != null) {
      data['doctor'] = this.doctor!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.lastChat != null) {
      data['last_chat'] = this.lastChat!.toJson();
    }
    data['unseen_count'] = this.unseenCount;
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

class LastChat {
  int? id;
  int? chatRoomId;
  int? senderId;
  int? receiverId;
  String? message;
  bool? seen;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  List<String>? mediaChatMessages;

  LastChat(
      {this.id,
      this.chatRoomId,
      this.senderId,
      this.receiverId,
      this.message,
      this.seen,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaChatMessages});

  LastChat.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    chatRoomId = json['chat_room_id'];
    senderId = json['sender_id'];
    receiverId = json['receiver_id'];
    message = json['message'];
    seen = json['seen'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media_chat_messages'] != null) {
      mediaChatMessages = <String>[];
      json['media_chat_messages'].forEach((v) {
        // mediaChatMessages!.add(new Null.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['chat_room_id'] = this.chatRoomId;
    data['sender_id'] = this.senderId;
    data['receiver_id'] = this.receiverId;
    data['message'] = this.message;
    data['seen'] = this.seen;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.mediaChatMessages != null) {
      // data['media_chat_messages'] =
          // this.mediaChatMessages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
