class LookupTreatmentModel {
  final int id;
  final String name;

  const LookupTreatmentModel({
    required this.id,
    required this.name,
  });

  factory LookupTreatmentModel.fromJson(Map<String, dynamic> json) {
    return LookupTreatmentModel(
      id: json['id'],
      name: json['value'],
    );
  }
}
