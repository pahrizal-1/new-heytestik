class ProfileModel {
  bool? success;
  String? message;
  Data? data;

  ProfileModel({this.success, this.message, this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
<<<<<<< HEAD
    data = json['data'] != null ? DataProfile.fromJson(json['data']) : null;
=======
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
>>>>>>> 6dc075f7d7be190179435517a39e368582f31dbb
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
  String? fullname;
  String? specialist;
  String? email;
  String? noPhone;
  String? gender;
<<<<<<< HEAD
  dynamic dob;
  dynamic sip;
  dynamic str;
  dynamic practiceLocation;
=======
  Null? dob;
  String? sip;
  String? str;
  String? education;
  String? practiceLocation;
>>>>>>> 6dc075f7d7be190179435517a39e368582f31dbb
  MediaUserProfilePicture? mediaUserProfilePicture;

  Data(
      {this.fullname,
      this.specialist,
      this.email,
      this.noPhone,
      this.gender,
      this.dob,
      this.sip,
      this.str,
      this.education,
      this.practiceLocation,
      this.mediaUserProfilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    specialist = json['specialist'];
    email = json['email'];
    noPhone = json['no_phone'];
    gender = json['gender'];
    dob = json['dob'];
    sip = json['sip'];
    str = json['str'];
    education = json['education'];
    practiceLocation = json['practice_location'];
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(json['media_user_profile_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
<<<<<<< HEAD
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['specialist'] = specialist;
    data['email'] = email;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['dob'] = dob;
    data['sip'] = sip;
    data['str'] = str;
    data['practice_location'] = practiceLocation;
    if (mediaUserProfilePicture != null) {
      data['media_user_profile_picture'] = mediaUserProfilePicture!.toJson();
=======
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fullname'] = this.fullname;
    data['specialist'] = this.specialist;
    data['email'] = this.email;
    data['no_phone'] = this.noPhone;
    data['gender'] = this.gender;
    data['dob'] = this.dob;
    data['sip'] = this.sip;
    data['str'] = this.str;
    data['education'] = this.education;
    data['practice_location'] = this.practiceLocation;
    if (this.mediaUserProfilePicture != null) {
      data['media_user_profile_picture'] =
          this.mediaUserProfilePicture!.toJson();
>>>>>>> 6dc075f7d7be190179435517a39e368582f31dbb
    }
    return data;
  }
}

class MediaUserProfilePicture {
  int? id;
  int? mediaId;
  int? userId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

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
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
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
