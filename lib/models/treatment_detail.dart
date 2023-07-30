import 'customer/treatmet_model.dart';

class TreatmentDetailModel {
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
  int? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Clinic? clinic;
  List<MediaTreatments>? mediaTreatments;
  String? distance;
  bool? wishlist;

  TreatmentDetailModel({
    this.id,
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
    this.deletedAt,
    this.clinic,
    this.mediaTreatments,
    this.distance,
    this.wishlist,
  });

  TreatmentDetailModel.fromJson(Map<String, dynamic> json) {
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
    rating = json['rating'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
    if (json['media_treatments'] != null) {
      mediaTreatments = <MediaTreatments>[];
      json['media_treatments'].forEach((v) {
        mediaTreatments!.add(MediaTreatments.fromJson(v));
      });
    }
    distance = json['distance'] ?? "0 km";
    wishlist = json['wishlist'] ?? false;
  }
}
