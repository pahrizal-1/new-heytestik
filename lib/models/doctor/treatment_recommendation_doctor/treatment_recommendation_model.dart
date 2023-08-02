class TreatmentReccommendationModel {
  bool? success;
  String? message;
  Data? data;

  TreatmentReccommendationModel({this.success, this.message, this.data});

  TreatmentReccommendationModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
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
        data!.add(new Data2.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    return data;
  }
}

class Data2 {
  int? id;
  int? doctorId;
  String? title;
  String? subtitle;
  bool? isActive;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<RecipeRecomendationTreatmentItems>? recipeRecomendationTreatmentItems;

  Data2(
      {this.id,
      this.doctorId,
      this.title,
      this.subtitle,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.recipeRecomendationTreatmentItems});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['recipe_recomendation_treatment_items'] != null) {
      recipeRecomendationTreatmentItems = <RecipeRecomendationTreatmentItems>[];
      json['recipe_recomendation_treatment_items'].forEach((v) {
        recipeRecomendationTreatmentItems!
            .add(new RecipeRecomendationTreatmentItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.recipeRecomendationTreatmentItems != null) {
      data['recipe_recomendation_treatment_items'] = this
          .recipeRecomendationTreatmentItems!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class RecipeRecomendationTreatmentItems {
  int? id;
  int? recipeRecomendationTreatmentId;
  String? name;
  String? cost;
  String? recoveryTime;
  String? type;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Clinics>? clinics;

  RecipeRecomendationTreatmentItems(
      {this.id,
      this.recipeRecomendationTreatmentId,
      this.name,
      this.cost,
      this.recoveryTime,
      this.type,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.clinics});

  RecipeRecomendationTreatmentItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeRecomendationTreatmentId = json['recipe_recomendation_treatment_id'];
    name = json['name'];
    cost = json['cost'];
    recoveryTime = json['recovery_time'];
    type = json['type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(new Clinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipe_recomendation_treatment_id'] =
        this.recipeRecomendationTreatmentId;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['recovery_time'] = this.recoveryTime;
    data['type'] = this.type;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.clinics != null) {
      data['clinics'] = this.clinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinics {
  int? id;
  int? recipeRecomendationTreatmentItemId;
  int? clinicId;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Clinic? clinic;

  Clinics(
      {this.id,
      this.recipeRecomendationTreatmentItemId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.clinic});

  Clinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeRecomendationTreatmentItemId =
        json['recipe_recomendation_treatment_item_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    clinic =
        json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipe_recomendation_treatment_item_id'] =
        this.recipeRecomendationTreatmentItemId;
    data['clinic_id'] = this.clinicId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    return data;
  }
}

class Clinic {
  int? id;
  String? name;
  String? address;
  double? pinpointLatitude;
  double? pinpointLongitude;
  String? pinpointAddress;
  int? provinceId;
  int? cityId;
  int? postalCode;
  int? registrationNumber;
  String? phone;
  String? email;
  String? description;
  String? companyName;
  String? companyAddress;
  int? companyCityId;
  int? companyProvinceId;
  String? companyPostalCode;
  String? npwp;
  String? picName;
  String? picPhone;
  String? contractExpiredDate;
  Null? status;
  int? rating;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Clinic(
      {this.id,
      this.name,
      this.address,
      this.pinpointLatitude,
      this.pinpointLongitude,
      this.pinpointAddress,
      this.provinceId,
      this.cityId,
      this.postalCode,
      this.registrationNumber,
      this.phone,
      this.email,
      this.description,
      this.companyName,
      this.companyAddress,
      this.companyCityId,
      this.companyProvinceId,
      this.companyPostalCode,
      this.npwp,
      this.picName,
      this.picPhone,
      this.contractExpiredDate,
      this.status,
      this.rating,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    pinpointLatitude = json['pinpoint_latitude'];
    pinpointLongitude = json['pinpoint_longitude'];
    pinpointAddress = json['pinpoint_address'];
    provinceId = json['province_id'];
    cityId = json['city_id'];
    postalCode = json['postal_code'];
    registrationNumber = json['registration_number'];
    phone = json['phone'];
    email = json['email'];
    description = json['description'];
    companyName = json['company_name'];
    companyAddress = json['company_address'];
    companyCityId = json['company_city_id'];
    companyProvinceId = json['company_province_id'];
    companyPostalCode = json['company_postal_code'];
    npwp = json['npwp'];
    picName = json['pic_name'];
    picPhone = json['pic_phone'];
    contractExpiredDate = json['contract_expired_date'];
    status = json['status'];
    rating = json['rating'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['pinpoint_latitude'] = this.pinpointLatitude;
    data['pinpoint_longitude'] = this.pinpointLongitude;
    data['pinpoint_address'] = this.pinpointAddress;
    data['province_id'] = this.provinceId;
    data['city_id'] = this.cityId;
    data['postal_code'] = this.postalCode;
    data['registration_number'] = this.registrationNumber;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['description'] = this.description;
    data['company_name'] = this.companyName;
    data['company_address'] = this.companyAddress;
    data['company_city_id'] = this.companyCityId;
    data['company_province_id'] = this.companyProvinceId;
    data['company_postal_code'] = this.companyPostalCode;
    data['npwp'] = this.npwp;
    data['pic_name'] = this.picName;
    data['pic_phone'] = this.picPhone;
    data['contract_expired_date'] = this.contractExpiredDate;
    data['status'] = this.status;
    data['rating'] = this.rating;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    data['take'] = this.take;
    data['itemCount'] = this.itemCount;
    data['pageCount'] = this.pageCount;
    data['hasPreviousPage'] = this.hasPreviousPage;
    data['hasNextPage'] = this.hasNextPage;
    return data;
  }
}