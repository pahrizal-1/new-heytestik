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
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
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
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Doctor? doctor;
  Doctor? customer;
  Consultation? consultation;
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
      this.consultation,
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
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    customer =
        json['customer'] != null ? Doctor.fromJson(json['customer']) : null;
    consultation = json['consultation'] != null
        ? Consultation.fromJson(json['consultation'])
        : null;
    lastChat =
        json['last_chat'] != null ? LastChat.fromJson(json['last_chat']) : null;
    unseenCount = json['unseen_count'];
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
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (consultation != null) {
      data['consultation'] = consultation!.toJson();
    }
    if (lastChat != null) {
      data['last_chat'] = lastChat!.toJson();
    }
    data['unseen_count'] = unseenCount;
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
  MediaUserProfilePicture? mediaUserProfilePicture;

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
      this.refreshToken,
      this.mediaUserProfilePicture});

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
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(json['media_user_profile_picture'])
        : null;
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
    if (mediaUserProfilePicture != null) {
      data['media_user_profile_picture'] = mediaUserProfilePicture!.toJson();
    }
    return data;
  }
}

class MediaUserProfilePicture {
  int? id;
  int? mediaId;
  int? userId;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  MediaUserProfile? media;

  MediaUserProfilePicture(
      {this.id,
      this.mediaId,
      this.userId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaUserProfilePicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    userId = json['user_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media =
        json['media'] != null ? MediaUserProfile.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['user_id'] = userId;
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

class MediaUserProfile {
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

  MediaUserProfile(
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

  MediaUserProfile.fromJson(Map<String, dynamic> json) {
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

class Consultation {
  int? id;

  Consultation({this.id});

  Consultation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
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
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<MediaChatMessages>? mediaChatMessages;

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
      mediaChatMessages = <MediaChatMessages>[];
      json['media_chat_messages'].forEach((v) {
        mediaChatMessages!.add(MediaChatMessages.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['chat_room_id'] = chatRoomId;
    data['sender_id'] = senderId;
    data['receiver_id'] = receiverId;
    data['message'] = message;
    data['seen'] = seen;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (mediaChatMessages != null) {
      data['media_chat_messages'] =
          mediaChatMessages!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MediaChatMessages {
  int? id;
  int? mediaId;
  int? chatMessageId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaChatMessages(
      {this.id,
      this.mediaId,
      this.chatMessageId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaChatMessages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    chatMessageId = json['chat_message_id'];
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
    data['chat_message_id'] = chatMessageId;
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
