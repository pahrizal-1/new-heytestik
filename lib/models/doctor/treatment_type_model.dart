class TreatmentTypeModel {
  bool? success;
  String? message;
  Data? data;

  TreatmentTypeModel({this.success, this.message, this.data});

  TreatmentTypeModel.fromJson(Map<String, dynamic> json) {
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
  List<DataObject>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataObject>[];
      json['data'].forEach((v) {
        data!.add(DataObject.fromJson(v));
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

class DataObject {
  String? treatmentType;
  String? cost;
  int? minCost;
  int? maxCost;
  String? recoveryTime;
  String? method;
  List<Clinics>? clinics;

  DataObject({this.treatmentType, this.cost, this.minCost, this.maxCost, this.recoveryTime, this.method, this.clinics});

  DataObject.fromJson(Map<String, dynamic> json) {
    treatmentType = json['treatment_type'];
    cost = json['cost'];
    minCost = json['min_cost'];
    maxCost = json['max_cost'];
    recoveryTime = json['recovery_time'];
    method = json['method'];
    if (json['clinics'] != null) {
      clinics = <Clinics>[];
      json['clinics'].forEach((v) {
        clinics!.add(new Clinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['treatment_type'] = this.treatmentType;
    data['cost'] = this.cost;
    data['min_cost'] = this.minCost;
    data['max_cost'] = this.maxCost;
    data['recovery_time'] = this.recoveryTime;
    data['method'] = this.method;
    if (this.clinics != null) {
      data['clinics'] = this.clinics!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Clinics {
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
  dynamic distance;

  Clinics({this.id, this.name, this.address, this.pinpointLatitude, this.pinpointLongitude, this.pinpointAddress, this.provinceId, this.cityId, this.postalCode, this.registrationNumber, this.phone, this.email, this.description, this.companyName, this.companyAddress, this.companyCityId, this.companyProvinceId, this.companyPostalCode, this.npwp, this.picName, this.picPhone, this.contractExpiredDate, this.status, this.rating, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt, this.city, this.province, this.clinicOperationHours, this.cityCompany, this.provinceCompany, this.mediaClinicLogo, this.mediaClinics, this.distance});

  Clinics.fromJson(Map<String, dynamic> json) {
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
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    province = json['province'] != null ? new Province.fromJson(json['province']) : null;
    if (json['clinic_operation_hours'] != null) {
      clinicOperationHours = <ClinicOperationHours>[];
      json['clinic_operation_hours'].forEach((v) {
        clinicOperationHours!.add(new ClinicOperationHours.fromJson(v));
      });
    }
    cityCompany = json['city_company'] != null ? new City.fromJson(json['city_company']) : null;
    provinceCompany = json['province_company'] != null ? new Province.fromJson(json['province_company']) : null;
    mediaClinicLogo = json['media_clinic_logo'] != null ? new MediaClinicLogo.fromJson(json['media_clinic_logo']) : null;
    if (json['media_clinics'] != null) {
      mediaClinics = <MediaClinics>[];
      json['media_clinics'].forEach((v) {
        mediaClinics!.add(new MediaClinics.fromJson(v));
      });
    }
    distance = json['distance'];
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
    if (this.city != null) {
      data['city'] = this.city!.toJson();
    }
    if (this.province != null) {
      data['province'] = this.province!.toJson();
    }
    if (this.clinicOperationHours != null) {
      data['clinic_operation_hours'] = this.clinicOperationHours!.map((v) => v.toJson()).toList();
    }
    if (this.cityCompany != null) {
      data['city_company'] = this.cityCompany!.toJson();
    }
    if (this.provinceCompany != null) {
      data['province_company'] = this.provinceCompany!.toJson();
    }
    if (this.mediaClinicLogo != null) {
      data['media_clinic_logo'] = this.mediaClinicLogo!.toJson();
    }
    if (this.mediaClinics != null) {
      data['media_clinics'] = this.mediaClinics!.map((v) => v.toJson()).toList();
    }
    data['distance'] = this.distance;
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

  City({this.id, this.name, this.provincesId, this.createdAt, this.updatedAt, this.deletedAt});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provincesId = json['provinces_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['provinces_id'] = this.provincesId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}

class Province {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Province({this.id, this.name, this.createdAt, this.updatedAt, this.deletedAt});

  Province.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  ClinicOperationHours({this.id, this.clinicId, this.day, this.startTime, this.endTime, this.isActive, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['clinic_id'] = this.clinicId;
    data['day'] = this.day;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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

  MediaClinicLogo({this.id, this.mediaId, this.clinicId, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt, this.media});

  MediaClinicLogo.fromJson(Map<String, dynamic> json) {
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
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  Media({this.id, this.filename, this.ext, this.size, this.mime, this.path, this.destination, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['destination'] = this.destination;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
  MediaForClinics? media;

  MediaClinics({this.id, this.mediaId, this.clinicId, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt, this.media});

  MediaClinics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? MediaForClinics.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
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

class MediaForClinics {
  int? id;
  String? filename;
  String? ext;
  int? size;
  String? mime;
  String? path;
  String? destination;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

  MediaForClinics({this.id, this.filename, this.ext, this.size, this.mime, this.path, this.destination, this.createdBy, this.updatedBy, this.createdAt, this.updatedAt, this.deletedAt});

  MediaForClinics.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['filename'] = this.filename;
    data['ext'] = this.ext;
    data['size'] = this.size;
    data['mime'] = this.mime;
    data['path'] = this.path;
    data['destination'] = this.destination;
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

  Meta({this.page, this.take, this.itemCount, this.pageCount, this.hasPreviousPage, this.hasNextPage});

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
