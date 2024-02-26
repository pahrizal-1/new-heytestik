class TreatmentModel {
  bool? success;
  String? message;
  Data? data;

  TreatmentModel({this.success, this.message, this.data});

  TreatmentModel.fromJson(Map<String, dynamic> json) {
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
  dynamic distance;
  Clinic? clinic;
  List<TreatmentConcerns>? treatmentConcerns;
  List<MediaTreatments>? mediaTreatments;
  bool? wishlist;

  Data2({
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
    this.distance,
    this.clinic,
    this.treatmentConcerns,
    this.mediaTreatments,
    this.wishlist,
  });

  Data2.fromJson(Map<String, dynamic> json) {
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
    distance = json['distance'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
    if (json['treatment_concerns'] != null) {
      treatmentConcerns = <TreatmentConcerns>[];
      json['treatment_concerns'].forEach((v) {
        treatmentConcerns!.add(TreatmentConcerns.fromJson(v));
      });
    }
    if (json['media_treatments'] != null) {
      mediaTreatments = <MediaTreatments>[];
      json['media_treatments'].forEach((v) {
        mediaTreatments!.add(MediaTreatments.fromJson(v));
      });
    }
    wishlist = json['wishlist'] ?? false;
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
    data['distance'] = distance;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (treatmentConcerns != null) {
      data['treatment_concerns'] =
          treatmentConcerns!.map((v) => v.toJson()).toList();
    }
    if (mediaTreatments != null) {
      data['media_treatments'] =
          mediaTreatments!.map((v) => v.toJson()).toList();
    }
    data['wishlist'] = wishlist;
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
  dynamic status;
  double? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<ClinicOperationHours>? clinicOperationHours;
  Province? province;
  City? city;

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
      this.deletedAt,
      this.clinicOperationHours,
      this.province,
      this.city});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    pinpointLatitude = double.parse(json['pinpoint_latitude'].toString());
    pinpointLongitude = double.parse(json['pinpoint_longitude'].toString());
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
    rating = double.parse(json['rating'].toString());
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['clinic_operation_hours'] != null) {
      clinicOperationHours = <ClinicOperationHours>[];
      json['clinic_operation_hours'].forEach((v) {
        clinicOperationHours!.add(ClinicOperationHours.fromJson(v));
      });
    }
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
    city = json['city'] != null ? City.fromJson(json['city']) : null;
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
    if (clinicOperationHours != null) {
      data['clinic_operation_hours'] =
          clinicOperationHours!.map((v) => v.toJson()).toList();
    }
    if (province != null) {
      data['province'] = province!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
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

class TreatmentConcerns {
  int? id;
  int? treatmentId;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Concern? concern;

  TreatmentConcerns(
      {this.id,
      this.treatmentId,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.concern});

  TreatmentConcerns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    treatmentId = json['treatment_id'];
    concernId = json['concern_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    concern =
        json['concern'] != null ? Concern.fromJson(json['concern']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['treatment_id'] = treatmentId;
    data['concern_id'] = concernId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (concern != null) {
      data['concern'] = concern!.toJson();
    }
    return data;
  }
}

class Concern {
  int? id;
  String? name;
  String? segment;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Concern(
      {this.id,
      this.name,
      this.segment,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Concern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    segment = json['segment'];
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
    data['name'] = name;
    data['segment'] = segment;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaTreatments {
  int? id;
  int? mediaId;
  int? treatmentId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaTreatments(
      {this.id,
      this.mediaId,
      this.treatmentId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaTreatments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    treatmentId = json['treatment_id'];
    createdBy = json['created_by'] ?? "-";
    updatedBy = json['updated_by'] ?? "-";
    createdAt = json['created_at'];
    updatedAt = json['updated_at'] ?? DateTime.now().toString();
    deletedAt = json['deleted_at'] ?? DateTime.now().toString();
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['treatment_id'] = treatmentId;
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
