class MyJourneyScheduleTreatmentModel {
  bool? success;
  String? message;
  Data? data;

  MyJourneyScheduleTreatmentModel({this.success, this.message, this.data});

  MyJourneyScheduleTreatmentModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionTreatmentId;
  int? treatmentId;
  int? pax;
  int? price;
  int? discount;
  int? subtotal;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  TransactionTreatment? transactionTreatment;
  Treatment? treatment;

  Data2(
      {this.id,
      this.transactionTreatmentId,
      this.treatmentId,
      this.pax,
      this.price,
      this.discount,
      this.subtotal,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.transactionTreatment,
      this.treatment});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionTreatmentId = json['transaction_treatment_id'];
    treatmentId = json['treatment_id'];
    pax = json['pax'];
    price = json['price'];
    discount = json['discount'];
    subtotal = json['subtotal'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    transactionTreatment = json['transaction_treatment'] != null
        ? TransactionTreatment.fromJson(json['transaction_treatment'])
        : null;
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_treatment_id'] = transactionTreatmentId;
    data['treatment_id'] = treatmentId;
    data['pax'] = pax;
    data['price'] = price;
    data['discount'] = discount;
    data['subtotal'] = subtotal;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (transactionTreatment != null) {
      data['transaction_treatment'] = transactionTreatment!.toJson();
    }
    if (treatment != null) {
      data['treatment'] = treatment!.toJson();
    }
    return data;
  }
}

class TransactionTreatment {
  String? id;
  int? userId;
  int? totalPrice;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? orderId;
  String? paymentStatus;
  String? paymentExpiryTime;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  PaymentMethod? paymentMethod;

  TransactionTreatment(
      {this.id,
      this.userId,
      this.totalPrice,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.orderId,
      this.paymentStatus,
      this.paymentExpiryTime,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.paymentMethod});

  TransactionTreatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    orderId = json['order_id'];
    paymentStatus = json['payment_status'];
    paymentExpiryTime = json['payment_expiry_time'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total_price'] = totalPrice;
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['payment_method_id'] = paymentMethodId;
    data['order_id'] = orderId;
    data['payment_status'] = paymentStatus;
    data['payment_expiry_time'] = paymentExpiryTime;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (paymentMethod != null) {
      data['payment_method'] = paymentMethod!.toJson();
    }
    return data;
  }
}

class PaymentMethod {
  int? id;
  String? name;
  String? method;
  String? type;
  dynamic accountNumber;
  String? segment;
  String? description;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  PaymentMethod(
      {this.id,
      this.name,
      this.method,
      this.type,
      this.accountNumber,
      this.segment,
      this.description,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    method = json['method'];
    type = json['type'];
    accountNumber = json['account_number'];
    segment = json['segment'];
    description = json['description'];
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
    data['method'] = method;
    data['type'] = type;
    data['account_number'] = accountNumber;
    data['segment'] = segment;
    data['description'] = description;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Treatment {
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
  Clinic? clinic;
  List<MediaTreatments>? mediaTreatments;

  Treatment(
      {this.id,
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
      this.mediaTreatments});

  Treatment.fromJson(Map<String, dynamic> json) {
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
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
    if (json['media_treatments'] != null) {
      mediaTreatments = <MediaTreatments>[];
      json['media_treatments'].forEach((v) {
        mediaTreatments!.add(MediaTreatments.fromJson(v));
      });
    }
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
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    if (mediaTreatments != null) {
      data['media_treatments'] =
          mediaTreatments!.map((v) => v.toJson()).toList();
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
  dynamic status;
  double? rating;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  City? city;
  Province? province;
  MediaClinicLogo? mediaClinicLogo;
  List<MediaClinics>? mediaClinics;

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
      this.city,
      this.province,
      this.mediaClinicLogo,
      this.mediaClinics});

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
    rating = double.parse(json['rating'].toString());
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    city = json['city'] != null ? City.fromJson(json['city']) : null;
    province =
        json['province'] != null ? Province.fromJson(json['province']) : null;
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
