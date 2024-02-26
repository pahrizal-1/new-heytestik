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
  List<Data>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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
  int? careRating;
  int? serviceRating;
  int? managementRating;
  double? avgRating;
  String? review;
  dynamic replyReview;
  int? helpfulCount;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<MediaTreatmentReviews>? mediaTreatmentReviews;

  Data2(
      {this.id,
      this.transactionTreatmentId,
      this.transactionTreatmentItemId,
      this.treatmentId,
      this.careRating,
      this.serviceRating,
      this.managementRating,
      this.avgRating,
      this.review,
      this.replyReview,
      this.helpfulCount,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaTreatmentReviews});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionTreatmentId = json['transaction_treatment_id'];
    transactionTreatmentItemId = json['transaction_treatment_item_id'];
    treatmentId = json['treatment_id'];
    careRating = json['care_rating'];
    serviceRating = json['service_rating'];
    managementRating = json['management_rating'];
    avgRating = json['avg_rating'];
    review = json['review'];
    replyReview = json['reply_review'];
    helpfulCount = json['helpful_count'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media_treatment_reviews'] != null) {
      mediaTreatmentReviews = <MediaTreatmentReviews>[];
      json['media_treatment_reviews'].forEach((v) {
        mediaTreatmentReviews!.add(MediaTreatmentReviews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_treatment_id'] = transactionTreatmentId;
    data['transaction_treatment_item_id'] = transactionTreatmentItemId;
    data['treatment_id'] = treatmentId;
    data['care_rating'] = careRating;
    data['service_rating'] = serviceRating;
    data['management_rating'] = managementRating;
    data['avg_rating'] = avgRating;
    data['review'] = review;
    data['reply_review'] = replyReview;
    data['helpful_count'] = helpfulCount;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (mediaTreatmentReviews != null) {
      data['media_treatment_reviews'] =
          mediaTreatmentReviews!.map((v) => v.toJson()).toList();
    }
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
