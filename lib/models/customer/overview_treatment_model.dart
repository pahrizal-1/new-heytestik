class OverviewUlasanTreatmentModel {
  bool? success;
  String? message;
  Data? data;

  OverviewUlasanTreatmentModel({this.success, this.message, this.data});

  OverviewUlasanTreatmentModel.fromJson(Map<String, dynamic> json) {
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
  int? satisfiedPercentage;
  String? avgCareRating;
  String? countCareRating;
  String? avgServiceRating;
  String? countServiceRating;
  String? avgManagementRating;
  String? countManagementRating;
  int? totalRating;
  int? totalReview;
  String? avgRating;

  Data(
      {this.satisfiedPercentage,
      this.avgCareRating,
      this.countCareRating,
      this.avgServiceRating,
      this.countServiceRating,
      this.avgManagementRating,
      this.countManagementRating,
      this.totalRating,
      this.totalReview,
      this.avgRating});

  Data.fromJson(Map<String, dynamic> json) {
    satisfiedPercentage = json['satisfied_percentage'];
    avgCareRating = json['avg_care_rating'];
    countCareRating = json['count_care_rating'];
    avgServiceRating = json['avg_service_rating'];
    countServiceRating = json['count_service_rating'];
    avgManagementRating = json['avg_management_rating'];
    countManagementRating = json['count_management_rating'];
    totalRating = json['total_rating'];
    totalReview = json['total_review'];
    avgRating = json['avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['satisfied_percentage'] = this.satisfiedPercentage;
    data['avg_care_rating'] = this.avgCareRating;
    data['count_care_rating'] = this.countCareRating;
    data['avg_service_rating'] = this.avgServiceRating;
    data['count_service_rating'] = this.countServiceRating;
    data['avg_management_rating'] = this.avgManagementRating;
    data['count_management_rating'] = this.countManagementRating;
    data['total_rating'] = this.totalRating;
    data['total_review'] = this.totalReview;
    data['avg_rating'] = this.avgRating;
    return data;
  }
}
