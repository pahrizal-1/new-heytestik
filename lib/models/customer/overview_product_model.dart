class OverviewUlasanProductModel {
  bool? success;
  String? message;
  Data? data;

  OverviewUlasanProductModel({this.success, this.message, this.data});

  OverviewUlasanProductModel.fromJson(Map<String, dynamic> json) {
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
  int? satisfiedPercentage;
  String? avgEffectivenessRating;
  String? countEffectivenessRating;
  String? avgTextureRating;
  String? countTextureRating;
  String? avgPackagingRating;
  String? countPackagingRating;
  int? totalRating;
  int? totalReview;
  String? avgRating;

  Data(
      {this.satisfiedPercentage,
      this.avgEffectivenessRating,
      this.countEffectivenessRating,
      this.avgTextureRating,
      this.countTextureRating,
      this.avgPackagingRating,
      this.countPackagingRating,
      this.totalRating,
      this.totalReview,
      this.avgRating});

  Data.fromJson(Map<String, dynamic> json) {
    satisfiedPercentage = json['satisfied_percentage'];
    avgEffectivenessRating = json['avg_effectiveness_rating'];
    countEffectivenessRating = json['count_effectiveness_rating'];
    avgTextureRating = json['avg_texture_rating'];
    countTextureRating = json['count_texture_rating'];
    avgPackagingRating = json['avg_packaging_rating'];
    countPackagingRating = json['count_packaging_rating'];
    totalRating = json['total_rating'];
    totalReview = json['total_review'];
    avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['satisfied_percentage'] = satisfiedPercentage;
    data['avg_effectiveness_rating'] = avgEffectivenessRating;
    data['count_effectiveness_rating'] = countEffectivenessRating;
    data['avg_texture_rating'] = avgTextureRating;
    data['count_texture_rating'] = countTextureRating;
    data['avg_packaging_rating'] = avgPackagingRating;
    data['count_packaging_rating'] = countPackagingRating;
    data['total_rating'] = totalRating;
    data['total_review'] = totalReview;
    data['avg_rating'] = avgRating;
    return data;
  }
}
