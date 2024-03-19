class TreatmentReviewModel {
  bool? success;
  String? message;
  Data? data;

  TreatmentReviewModel({this.success, this.message, this.data});

  TreatmentReviewModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionTreatmentId;
  int? transactionTreatmentItemId;
  int? treatmentId;
  int? userId;
  int? careRating;
  int? serviceRating;
  int? managementRating;
  double? avgRating;
  String? review;
  dynamic replyReview;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  User? user;
  TransactionTreatmentItem? transactionTreatmentItem;
  List<MediaTreatmentReviews>? mediaTreatmentReviews;
  Count? cCount;
  bool? helped;

  Data2(
      {this.id,
      this.transactionTreatmentId,
      this.transactionTreatmentItemId,
      this.treatmentId,
      this.userId,
      this.careRating,
      this.serviceRating,
      this.managementRating,
      this.avgRating,
      this.review,
      this.replyReview,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.user,
      this.transactionTreatmentItem,
      this.mediaTreatmentReviews,
      this.cCount,
      this.helped});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionTreatmentId = json['transaction_treatment_id'];
    transactionTreatmentItemId = json['transaction_treatment_item_id'];
    treatmentId = json['treatment_id'];
    userId = json['user_id'];
    careRating = json['care_rating'];
    serviceRating = json['service_rating'];
    managementRating = json['management_rating'];
    avgRating = double.parse(json['avg_rating'].toString());
    review = json['review'];
    replyReview = json['reply_review'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    transactionTreatmentItem = json['transaction_treatment_item'] != null
        ? TransactionTreatmentItem.fromJson(json['transaction_treatment_item'])
        : null;
    if (json['media_treatment_reviews'] != null) {
      mediaTreatmentReviews = <MediaTreatmentReviews>[];
      json['media_treatment_reviews'].forEach((v) {
        mediaTreatmentReviews!.add(MediaTreatmentReviews.fromJson(v));
      });
    }
    cCount = json['_count'] != null ? Count.fromJson(json['_count']) : null;
    helped = json['helped'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_treatment_id'] = transactionTreatmentId;
    data['transaction_treatment_item_id'] = transactionTreatmentItemId;
    data['treatment_id'] = treatmentId;
    data['user_id'] = userId;
    data['care_rating'] = careRating;
    data['service_rating'] = serviceRating;
    data['management_rating'] = managementRating;
    data['avg_rating'] = avgRating;
    data['review'] = review;
    data['reply_review'] = replyReview;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (transactionTreatmentItem != null) {
      data['transaction_treatment_item'] = transactionTreatmentItem!.toJson();
    }
    if (mediaTreatmentReviews != null) {
      data['media_treatment_reviews'] =
          mediaTreatmentReviews!.map((v) => v.toJson()).toList();
    }
    if (cCount != null) {
      data['_count'] = cCount!.toJson();
    }
    data['helped'] = helped;
    return data;
  }
}

class User {
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
  MediaUserProfilePicture? mediaUserProfilePicture;

  User(
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
      this.refreshToken,
      this.mediaUserProfilePicture});

  User.fromJson(Map<String, dynamic> json) {
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
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(json['media_user_profile_picture'])
        : null;
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

class TransactionTreatmentItem {
  int? id;
  String? transactionTreatmentId;
  int? treatmentId;
  int? pax;
  int? price;
  int? discount;
  int? subtotal;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Treatment? treatment;

  TransactionTreatmentItem(
      {this.id,
      this.transactionTreatmentId,
      this.treatmentId,
      this.pax,
      this.price,
      this.discount,
      this.subtotal,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.treatment});

  TransactionTreatmentItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionTreatmentId = json['transaction_treatment_id'];
    treatmentId = json['treatment_id'];
    pax = json['pax'];
    price = json['price'];
    discount = json['discount'];
    subtotal = json['subtotal'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_treatment_id'] = transactionTreatmentId;
    data['treatment_id'] = treatmentId;
    data['pax'] = pax;
    data['price'] = price;
    data['discount'] = discount;
    data['subtotal'] = subtotal;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (treatment != null) {
      data['treatment'] = treatment!.toJson();
    }
    return data;
  }
}

class Treatment {
  int? id;
  int? clinicId;
  String? name;
  String? category;
  String? description;
  String? duration;
  String? downtime;
  String? treatmentType;
  String? treatmentStep;
  int? price;
  bool? isActive;
  double? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Treatment(
      {this.id,
      this.clinicId,
      this.name,
      this.category,
      this.description,
      this.duration,
      this.downtime,
      this.treatmentType,
      this.treatmentStep,
      this.price,
      this.isActive,
      this.rating,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Treatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    name = json['name'];
    category = json['category'];
    description = json['description'];
    duration = json['duration'];
    downtime = json['downtime'];
    treatmentType = json['treatment_type'];
    treatmentStep = json['treatment_step'];
    price = json['price'];
    isActive = json['is_active'];
    rating = double.parse(json['rating'].toString());
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['clinic_id'] = clinicId;
    data['name'] = name;
    data['category'] = category;
    data['description'] = description;
    data['duration'] = duration;
    data['downtime'] = downtime;
    data['treatment_type'] = treatmentType;
    data['treatment_step'] = treatmentStep;
    data['price'] = price;
    data['is_active'] = isActive;
    data['rating'] = rating;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaTreatmentReviews {
  int? id;
  int? mediaId;
  int? treatmentReviewId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaTreatmentReviews(
      {this.id,
      this.mediaId,
      this.treatmentReviewId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaTreatmentReviews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    treatmentReviewId = json['treatment_review_id'];
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
    data['treatment_review_id'] = treatmentReviewId;
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

class Count {
  int? treatmentReviewHelpfuls;

  Count({this.treatmentReviewHelpfuls});

  Count.fromJson(Map<String, dynamic> json) {
    treatmentReviewHelpfuls = json['treatment_review_helpfuls'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['treatment_review_helpfuls'] = treatmentReviewHelpfuls;
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
