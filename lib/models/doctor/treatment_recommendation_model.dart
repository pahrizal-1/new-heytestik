class TreatmentRecommendationModel {
  final String treatmentType;

  const TreatmentRecommendationModel({
    required this.treatmentType,
  });

  factory TreatmentRecommendationModel.fromJson(Map<String, dynamic> json) {
    return TreatmentRecommendationModel(
      treatmentType: json['treatment_type'],
    );
  }
}
