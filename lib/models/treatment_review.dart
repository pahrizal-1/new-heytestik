class TreatmentReviewModel {
  final int id;
  final String transactionTreatmentID;
  final int transactionTreatmentItemID;
  final int treatmentID;
  final int careRating;
  final int serviceRating;
  final int managementRating;
  final double averageRating;
  final String review;
  final String createdAt;
  final int helpfulCount;
  final List<MediaTreatmentReviewModel> media;

  const TreatmentReviewModel({
    required this.id,
    required this.transactionTreatmentID,
    required this.transactionTreatmentItemID,
    required this.treatmentID,
    required this.careRating,
    required this.serviceRating,
    required this.managementRating,
    required this.averageRating,
    required this.review,
    required this.createdAt,
    required this.helpfulCount,
    required this.media,
  });

  factory TreatmentReviewModel.fromJson(Map<String, dynamic> json) {
    return TreatmentReviewModel(
      id: json['id'],
      transactionTreatmentID: json['transaction_treatment_id'],
      transactionTreatmentItemID: json['transaction_treatment_item_id'],
      treatmentID: json['treatment_id'],
      careRating: json['care_rating'],
      serviceRating: json['service_rating'],
      managementRating: json['management_rating'],
      averageRating: double.parse(json['avg_rating'].toString()),
      review: json['review'],
      createdAt: json['created_at'],
      helpfulCount: json['helpful_count'],
      media: (json['media_treatment_reviews'] as List)
          .map((document) => MediaTreatmentReviewModel.fromJson(document))
          .toList(),
    );
  }
}

class MediaTreatmentReviewModel {
  final int id;
  final int mediaID;
  final int treatmentReviewID;
  final String path;

  const MediaTreatmentReviewModel({
    required this.id,
    required this.mediaID,
    required this.treatmentReviewID,
    required this.path,
  });

  factory MediaTreatmentReviewModel.fromJson(Map<String, dynamic> json) {
    return MediaTreatmentReviewModel(
      id: json['id'],
      mediaID: json['media_id'],
      treatmentReviewID: json['treatment_review_id'],
      path: json['media']['path'],
    );
  }
}
