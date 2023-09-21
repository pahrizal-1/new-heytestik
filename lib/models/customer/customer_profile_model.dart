class CustomerProfileModel {
  bool? success;
  String? message;
  Data? data;

  CustomerProfileModel({this.success, this.message, this.data});

  CustomerProfileModel.fromJson(Map<String, dynamic> json) {
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
  String? fullname;
  String? username;
  String? bio;
  int? id;
  String? email;
  String? noPhone;
  String? gender;
  String? dob;
  MediaUserProfilePicture? mediaUserProfilePicture;

  Data(
      {this.fullname,
      this.username,
      this.bio,
      this.id,
      this.email,
      this.noPhone,
      this.gender,
      this.dob,
      this.mediaUserProfilePicture});

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    username = json['username'];
    bio = json['bio'];
    id = json['id'];
    email = json['email'];
    noPhone = json['no_phone'];
    gender = json['gender'];
    dob = json['dob'];
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(json['media_user_profile_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = fullname;
    data['username'] = username;
    data['bio'] = bio;
    data['id'] = id;
    data['email'] = email;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['dob'] = dob;
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
