class FindClinicModel {
  bool? success;
  String? message;
  Data? data;

  FindClinicModel({this.success, this.message, this.data});

  FindClinicModel.fromJson(Map<String, dynamic> json) {
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
  dynamic status;
  int? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  City? city;
  Province? province;
  List<ClinicOperationHours>? clinicOperationHours;
  City? cityCompany;
  Province? provinceCompany;
  MediaClinicLogo? mediaClinicLogo;
  List<MediaClinics>? mediaClinics;

  Data(
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
      this.deletedAt,
      this.city,
      this.province,
      this.clinicOperationHours,
      this.cityCompany,
      this.provinceCompany,
      this.mediaClinicLogo,
      this.mediaClinics});

  Data.fromJson(Map<String, dynamic> json) {
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
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    if (json['clinic_operation_hours'] != null) {
      clinicOperationHours = <ClinicOperationHours>[];
      json['clinic_operation_hours'].forEach((v) {
        clinicOperationHours!.add(ClinicOperationHours.fromJson(v));
      });
    }
    cityCompany = json['city_company'] != null
        ? City.fromJson(json['city_company'])
        : null;
    provinceCompany = json['province_company'] != null
        ? Province.fromJson(json['province_company'])
        : null;
    mediaClinicLogo = json['media_clinic_logo'] != null
        ? MediaClinicLogo.fromJson(json['media_clinic_logo'])
        : null;
    if (json['media_clinics'] != null) {
      mediaClinics = <MediaClinics>[];
      json['media_clinics'].forEach((v) {
        mediaClinics!.add(MediaClinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['address'] = address;
    data['pinpoint_latitude'] = pinpointLatitude;
    data['pinpoint_longitude'] = pinpointLongitude;
    data['pinpoint_address'] = pinpointAddress;
    data['province_id'] = provinceId;
    data['city_id'] = cityId;
    data['postal_code'] = postalCode;
    data['registration_number'] = registrationNumber;
    data['phone'] = phone;
    data['email'] = email;
    data['description'] = description;
    data['company_name'] = companyName;
    data['company_address'] = companyAddress;
    data['company_city_id'] = companyCityId;
    data['company_province_id'] = companyProvinceId;
    data['company_postal_code'] = companyPostalCode;
    data['npwp'] = npwp;
    data['pic_name'] = picName;
    data['pic_phone'] = picPhone;
    data['contract_expired_date'] = contractExpiredDate;
    data['status'] = status;
    data['rating'] = rating;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (city != null) {
      data['city'] = city!.toJson();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (clinicOperationHours != null) {
      data['clinic_operation_hours'] =
          clinicOperationHours!.map((v) => v.toJson()).toList();
    }
    if (cityCompany != null) {
      data['city_company'] = cityCompany!.toJson();
    }
    if (provinceCompany != null) {
      data['province_company'] = provinceCompany!.toJson();
    }
    if (mediaClinicLogo != null) {
      data['media_clinic_logo'] = mediaClinicLogo!.toJson();
    }
    if (mediaClinics != null) {
      data['media_clinics'] = mediaClinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class City {
  int? id;
  String? name;
  int? provincesId;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  City(
      {this.id,
      this.name,
      this.provincesId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provincesId = json['provinces_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['provinces_id'] = provincesId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Province {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Province(
      {this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ClinicOperationHours {
  int? id;
  int? clinicId;
  String? day;
  String? startTime;
  String? endTime;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ClinicOperationHours(
      {this.id,
      this.clinicId,
      this.day,
      this.startTime,
      this.endTime,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ClinicOperationHours.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clinicId = json['clinic_id'];
    day = json['day'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    isActive = json['is_active'];
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
    data['day'] = day;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaClinicLogo {
  int? id;
  int? mediaId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaClinicLogo(
      {this.id,
      this.mediaId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaClinicLogo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    clinicId = json['clinic_id'];
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
    data['clinic_id'] = clinicId;
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

class MediaClinics {
  int? id;
  int? mediaId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaClinics(
      {this.id,
      this.mediaId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaClinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['clinic_id'] = this.clinicId;
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
