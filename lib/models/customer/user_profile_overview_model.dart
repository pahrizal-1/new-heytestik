class UserProfileOverviewModel {
  bool? success;
  String? message;
  Data? data;

  UserProfileOverviewModel({this.success, this.message, this.data});

  UserProfileOverviewModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? fullname;
  String? username;
  String? dob;
  int? age;
  dynamic city;
  dynamic province;
  String? level;
  int? totalFollower;
  int? totalFollowing;
  int? totalPost;
  int? totalReview;
  UserLocation? userLocation;
  MediaUserProfilePicture? mediaUserProfilePicture;
  bool? follow;

  Data(
      {this.fullname,
      this.username,
      this.dob,
      this.age,
      this.city,
      this.province,
      this.level,
      this.totalFollower,
      this.totalFollowing,
      this.totalPost,
      this.totalReview,
      this.userLocation,
      this.mediaUserProfilePicture,
      this.follow});

  Data.fromJson(Map<String, dynamic> json) {
    fullname = json['fullname'];
    username = json['username'];
    dob = json['dob'];
    age = json['age'];
    city = json['city'];
    province = json['province'];
    level = json['level'];
    totalFollower = json['total_follower'];
    totalFollowing = json['total_following'];
    totalPost = json['total_post'];
    totalReview = json['total_review'];
    userLocation = json['user_location'] != null
        ? UserLocation.fromJson(json['user_location'])
        : null;
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(
            json['media_user_profile_picture'])
        : null;
    follow = json['follow'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['dob'] = this.dob;
    data['age'] = this.age;
    data['city'] = this.city;
    data['province'] = this.province;
    data['level'] = this.level;
    data['total_follower'] = this.totalFollower;
    data['total_following'] = this.totalFollowing;
    data['total_post'] = this.totalPost;
    data['total_review'] = this.totalReview;
    if (this.userLocation != null) {
      data['user_location'] = this.userLocation!.toJson();
    }
    if (this.mediaUserProfilePicture != null) {
      data['media_user_profile_picture'] =
          this.mediaUserProfilePicture!.toJson();
    }
    data['follow'] = this.follow;
    return data;
  }
}

class UserLocation {
  int? id;
  int? userId;
  double? latitude;
  double? longitude;
  String? address;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  UserLocation(
      {this.id,
      this.userId,
      this.latitude,
      this.longitude,
      this.address,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  UserLocation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    address = json['address'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['address'] = this.address;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['user_id'] = this.userId;
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
