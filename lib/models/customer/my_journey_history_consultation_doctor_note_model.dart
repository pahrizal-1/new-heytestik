class MyJourneyHistoryConsultationDoctorNoteModel {
  bool? success;
  String? message;
  Data? data;

  MyJourneyHistoryConsultationDoctorNoteModel(
      {this.success, this.message, this.data});

  MyJourneyHistoryConsultationDoctorNoteModel.fromJson(
      Map<String, dynamic> json) {
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
  int? doctorId;
  int? customerId;
  String? transactionConsultationId;
  int? consultationDoctorScheduleId;
  int? medicalHistoryId;
  String? code;
  int? duration;
  String? endDate;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  ConsultationDoctorNote? consultationDoctorNote;
  List<ConsultationRecomendationSkincare>? consultationRecomendationSkincare;
  List<ConsultationRecomendationTreatment>? consultationRecomendationTreatment;
  List<ConsultationRecipeDrug>? consultationRecipeDrug;

  Data(
      {this.id,
      this.doctorId,
      this.customerId,
      this.transactionConsultationId,
      this.consultationDoctorScheduleId,
      this.medicalHistoryId,
      this.code,
      this.duration,
      this.endDate,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.consultationDoctorNote,
      this.consultationRecomendationSkincare,
      this.consultationRecomendationTreatment,
      this.consultationRecipeDrug});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    transactionConsultationId = json['transaction_consultation_id'];
    consultationDoctorScheduleId = json['consultation_doctor_schedule_id'];
    medicalHistoryId = json['medical_history_id'];
    code = json['code'];
    duration = json['duration'];
    endDate = json['end_date'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    consultationDoctorNote = json['consultation_doctor_note'] != null
        ? ConsultationDoctorNote.fromJson(json['consultation_doctor_note'])
        : null;
    if (json['consultation_recomendation_skincare'] != null) {
      consultationRecomendationSkincare = <ConsultationRecomendationSkincare>[];
      json['consultation_recomendation_skincare'].forEach((v) {
        consultationRecomendationSkincare!
            .add(ConsultationRecomendationSkincare.fromJson(v));
      });
    }
    if (json['consultation_recomendation_treatment'] != null) {
      consultationRecomendationTreatment =
          <ConsultationRecomendationTreatment>[];
      json['consultation_recomendation_treatment'].forEach((v) {
        consultationRecomendationTreatment!
            .add(ConsultationRecomendationTreatment.fromJson(v));
      });
    }
    if (json['consultation_recipe_drug'] != null) {
      consultationRecipeDrug = <ConsultationRecipeDrug>[];
      json['consultation_recipe_drug'].forEach((v) {
        consultationRecipeDrug!.add(ConsultationRecipeDrug.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['customer_id'] = customerId;
    data['transaction_consultation_id'] = transactionConsultationId;
    data['consultation_doctor_schedule_id'] = consultationDoctorScheduleId;
    data['medical_history_id'] = medicalHistoryId;
    data['code'] = code;
    data['duration'] = duration;
    data['end_date'] = endDate;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (consultationDoctorNote != null) {
      data['consultation_doctor_note'] = consultationDoctorNote!.toJson();
    }
    if (consultationRecomendationSkincare != null) {
      data['consultation_recomendation_skincare'] =
          consultationRecomendationSkincare!.map((v) => v.toJson()).toList();
    }
    if (consultationRecomendationTreatment != null) {
      data['consultation_recomendation_treatment'] =
          consultationRecomendationTreatment!.map((v) => v.toJson()).toList();
    }
    if (consultationRecipeDrug != null) {
      data['consultation_recipe_drug'] =
          consultationRecipeDrug!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ConsultationDoctorNote {
  int? id;
  int? consultationId;
  String? indication;
  String? diagnosisPossibilty;
  String? diagnosisSecondary;
  String? suggestion;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ConsultationDoctorNote(
      {this.id,
      this.consultationId,
      this.indication,
      this.diagnosisPossibilty,
      this.diagnosisSecondary,
      this.suggestion,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ConsultationDoctorNote.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    indication = json['indication'];
    diagnosisPossibilty = json['diagnosis_possibilty'];
    diagnosisSecondary = json['diagnosis_secondary'];
    suggestion = json['suggestion'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['indication'] = indication;
    data['diagnosis_possibilty'] = diagnosisPossibilty;
    data['diagnosis_secondary'] = diagnosisSecondary;
    data['suggestion'] = suggestion;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ConsultationRecomendationSkincare {
  int? id;
  int? consultationId;
  int? productId;
  int? qty;
  String? notes;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;

  ConsultationRecomendationSkincare(
      {this.id,
      this.consultationId,
      this.productId,
      this.qty,
      this.notes,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product});

  ConsultationRecomendationSkincare.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    productId = json['product_id'];
    qty = json['qty'];
    notes = json['notes'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['notes'] = notes;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? type;
  String? category;
  String? display;
  bool? hasVariant;
  int? minOrder;
  int? price;
  bool? productIsActive;
  int? productStock;
  String? productTreshold;
  String? productSku;
  double? rating;
  int? shippingProductWeight;
  String? shippingProductWeightType;
  int? shippingProductSizeLength;
  int? shippingProductSizeWidth;
  int? shippingProductSizeHeight;
  String? shipping;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  SkincareDetail? skincareDetail;
  dynamic drugDetail;
  List<MediaProducts>? mediaProducts;

  Product(
      {this.id,
      this.name,
      this.type,
      this.category,
      this.display,
      this.hasVariant,
      this.minOrder,
      this.price,
      this.productIsActive,
      this.productStock,
      this.productTreshold,
      this.productSku,
      this.rating,
      this.shippingProductWeight,
      this.shippingProductWeightType,
      this.shippingProductSizeLength,
      this.shippingProductSizeWidth,
      this.shippingProductSizeHeight,
      this.shipping,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.skincareDetail,
      this.drugDetail,
      this.mediaProducts});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    category = json['category'];
    display = json['display'];
    hasVariant = json['has_variant'];
    minOrder = json['min_order'];
    price = json['price'];
    productIsActive = json['product_is_active'];
    productStock = json['product_stock'];
    productTreshold = json['product_treshold'];
    productSku = json['product_sku'];
    rating = double.parse(json['rating'].toString());
    shippingProductWeight = json['shipping_product_weight'];
    shippingProductWeightType = json['shipping_product_weight_type'];
    shippingProductSizeLength = json['shipping_product_size_length'];
    shippingProductSizeWidth = json['shipping_product_size_width'];
    shippingProductSizeHeight = json['shipping_product_size_height'];
    shipping = json['shipping'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    skincareDetail = json['skincare_detail'] != null
        ? SkincareDetail.fromJson(json['skincare_detail'])
        : null;
    drugDetail = json['drug_detail'];
    if (json['media_products'] != null) {
      mediaProducts = <MediaProducts>[];
      json['media_products'].forEach((v) {
        mediaProducts!.add(MediaProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['category'] = category;
    data['display'] = display;
    data['has_variant'] = hasVariant;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['product_is_active'] = productIsActive;
    data['product_stock'] = productStock;
    data['product_treshold'] = productTreshold;
    data['product_sku'] = productSku;
    data['rating'] = rating;
    data['shipping_product_weight'] = shippingProductWeight;
    data['shipping_product_weight_type'] = shippingProductWeightType;
    data['shipping_product_size_length'] = shippingProductSizeLength;
    data['shipping_product_size_width'] = shippingProductSizeWidth;
    data['shipping_product_size_height'] = shippingProductSizeHeight;
    data['shipping'] = shipping;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (skincareDetail != null) {
      data['skincare_detail'] = skincareDetail!.toJson();
    }
    data['drug_detail'] = drugDetail;
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SkincareDetail {
  int? id;
  int? productId;
  String? brand;
  String? description;
  String? specificationTexture;
  String? specificationBpom;
  int? specificationNetto;
  String? specificationNettoType;
  String? specificationExpired;
  String? specificationPackagingType;
  String? specificationIngredients;
  String? specificationHowToUse;
  String? specificationStorageAdvice;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkincareDetail(
      {this.id,
      this.productId,
      this.brand,
      this.description,
      this.specificationTexture,
      this.specificationBpom,
      this.specificationNetto,
      this.specificationNettoType,
      this.specificationExpired,
      this.specificationPackagingType,
      this.specificationIngredients,
      this.specificationHowToUse,
      this.specificationStorageAdvice,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkincareDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    brand = json['brand'];
    description = json['description'];
    specificationTexture = json['specification_texture'];
    specificationBpom = json['specification_bpom'];
    specificationNetto = json['specification_netto'];
    specificationNettoType = json['specification_netto_type'];
    specificationExpired = json['specification_expired'];
    specificationPackagingType = json['specification_packaging_type'];
    specificationIngredients = json['specification_ingredients'];
    specificationHowToUse = json['specification_how_to_use'];
    specificationStorageAdvice = json['specification_storage_advice'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['brand'] = brand;
    data['description'] = description;
    data['specification_texture'] = specificationTexture;
    data['specification_bpom'] = specificationBpom;
    data['specification_netto'] = specificationNetto;
    data['specification_netto_type'] = specificationNettoType;
    data['specification_expired'] = specificationExpired;
    data['specification_packaging_type'] = specificationPackagingType;
    data['specification_ingredients'] = specificationIngredients;
    data['specification_how_to_use'] = specificationHowToUse;
    data['specification_storage_advice'] = specificationStorageAdvice;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class MediaProducts {
  int? id;
  int? mediaId;
  int? productId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaProducts(
      {this.id,
      this.mediaId,
      this.productId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    productId = json['product_id'];
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
    data['product_id'] = productId;
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

class ConsultationRecomendationTreatment {
  int? id;
  int? consultationId;
  String? name;
  String? cost;
  String? recoveryTime;
  String? type;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<ConsultationRecomendationTreatmentClinics>?
      consultationRecomendationTreatmentClinics;

  ConsultationRecomendationTreatment(
      {this.id,
      this.consultationId,
      this.name,
      this.cost,
      this.recoveryTime,
      this.type,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.consultationRecomendationTreatmentClinics});

  ConsultationRecomendationTreatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    name = json['name'];
    cost = json['cost'];
    recoveryTime = json['recovery_time'];
    type = json['type'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['consultation_recomendation_treatment_clinics'] != null) {
      consultationRecomendationTreatmentClinics =
          <ConsultationRecomendationTreatmentClinics>[];
      json['consultation_recomendation_treatment_clinics'].forEach((v) {
        consultationRecomendationTreatmentClinics!
            .add(ConsultationRecomendationTreatmentClinics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['name'] = name;
    data['cost'] = cost;
    data['recovery_time'] = recoveryTime;
    data['type'] = type;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (consultationRecomendationTreatmentClinics != null) {
      data['consultation_recomendation_treatment_clinics'] =
          consultationRecomendationTreatmentClinics!
              .map((v) => v.toJson())
              .toList();
    }
    return data;
  }
}

class ConsultationRecomendationTreatmentClinics {
  int? id;
  int? consultationRecomendationTreatmentId;
  int? consultationId;
  int? clinicId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Clinic? clinic;

  ConsultationRecomendationTreatmentClinics(
      {this.id,
      this.consultationRecomendationTreatmentId,
      this.consultationId,
      this.clinicId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.clinic});

  ConsultationRecomendationTreatmentClinics.fromJson(
      Map<String, dynamic> json) {
    id = json['id'];
    consultationRecomendationTreatmentId =
        json['consultation_recomendation_treatment_id'];
    consultationId = json['consultation_id'];
    clinicId = json['clinic_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_recomendation_treatment_id'] =
        consultationRecomendationTreatmentId;
    data['consultation_id'] = consultationId;
    data['clinic_id'] = clinicId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
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
  List<ClinicOperationHours>? clinicOperationHours;
  City? cityCompany;
  Province? provinceCompany;
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
      this.clinicOperationHours,
      this.cityCompany,
      this.provinceCompany,
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

class ConsultationRecipeDrug {
  int? id;
  int? consultationId;
  int? productId;
  int? customerId;
  String? notes;
  int? redeemAmount;
  int? remainingRedeemAmount;
  String? dueDate;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  ProductRecipeDrug? product;

  ConsultationRecipeDrug(
      {this.id,
      this.consultationId,
      this.productId,
      this.customerId,
      this.notes,
      this.redeemAmount,
      this.remainingRedeemAmount,
      this.dueDate,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product});

  ConsultationRecipeDrug.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    consultationId = json['consultation_id'];
    productId = json['product_id'];
    customerId = json['customer_id'];
    notes = json['notes'];
    redeemAmount = json['redeem_amount'];
    remainingRedeemAmount = json['remaining_redeem_amount'];
    dueDate = json['due_date'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product = json['product'] != null
        ? ProductRecipeDrug.fromJson(json['product'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['consultation_id'] = consultationId;
    data['product_id'] = productId;
    data['customer_id'] = customerId;
    data['notes'] = notes;
    data['redeem_amount'] = redeemAmount;
    data['remaining_redeem_amount'] = remainingRedeemAmount;
    data['due_date'] = dueDate;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class ProductRecipeDrug {
  int? id;
  String? name;
  String? type;
  String? category;
  String? display;
  bool? hasVariant;
  int? minOrder;
  int? price;
  bool? productIsActive;
  int? productStock;
  dynamic productTreshold;
  dynamic productSku;
  double? rating;
  int? shippingProductWeight;
  String? shippingProductWeightType;
  dynamic shippingProductSizeLength;
  dynamic shippingProductSizeWidth;
  dynamic shippingProductSizeHeight;
  String? shipping;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic skincareDetail;
  DrugDetail? drugDetail;
  List<MediaProducts>? mediaProducts;

  ProductRecipeDrug(
      {this.id,
      this.name,
      this.type,
      this.category,
      this.display,
      this.hasVariant,
      this.minOrder,
      this.price,
      this.productIsActive,
      this.productStock,
      this.productTreshold,
      this.productSku,
      this.rating,
      this.shippingProductWeight,
      this.shippingProductWeightType,
      this.shippingProductSizeLength,
      this.shippingProductSizeWidth,
      this.shippingProductSizeHeight,
      this.shipping,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.skincareDetail,
      this.drugDetail,
      this.mediaProducts});

  ProductRecipeDrug.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    category = json['category'];
    display = json['display'];
    hasVariant = json['has_variant'];
    minOrder = json['min_order'];
    price = json['price'];
    productIsActive = json['product_is_active'];
    productStock = json['product_stock'];
    productTreshold = json['product_treshold'];
    productSku = json['product_sku'];
    rating = double.parse(json['rating'].toString());
    shippingProductWeight = json['shipping_product_weight'];
    shippingProductWeightType = json['shipping_product_weight_type'];
    shippingProductSizeLength = json['shipping_product_size_length'];
    shippingProductSizeWidth = json['shipping_product_size_width'];
    shippingProductSizeHeight = json['shipping_product_size_height'];
    shipping = json['shipping'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    skincareDetail = json['skincare_detail'];
    drugDetail = json['drug_detail'] != null
        ? DrugDetail.fromJson(json['drug_detail'])
        : null;
    if (json['media_products'] != null) {
      mediaProducts = <MediaProducts>[];
      json['media_products'].forEach((v) {
        mediaProducts!.add(MediaProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['category'] = category;
    data['display'] = display;
    data['has_variant'] = hasVariant;
    data['min_order'] = minOrder;
    data['price'] = price;
    data['product_is_active'] = productIsActive;
    data['product_stock'] = productStock;
    data['product_treshold'] = productTreshold;
    data['product_sku'] = productSku;
    data['rating'] = rating;
    data['shipping_product_weight'] = shippingProductWeight;
    data['shipping_product_weight_type'] = shippingProductWeightType;
    data['shipping_product_size_length'] = shippingProductSizeLength;
    data['shipping_product_size_width'] = shippingProductSizeWidth;
    data['shipping_product_size_height'] = shippingProductSizeHeight;
    data['shipping'] = shipping;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['skincare_detail'] = skincareDetail;
    if (drugDetail != null) {
      data['drug_detail'] = drugDetail!.toJson();
    }
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrugDetail {
  int? id;
  int? productId;
  String? manufacture;
  String? indication;
  String? contradiction;
  String? description;
  String? specificationForm;
  String? specificationClassification;
  String? specificationType;
  String? specificationPackaging;
  String? specificationCategory;
  String? specificationBpom;
  String? specificationIngredients;
  String? specificationDose;
  String? specificationSpecialAttention;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  DrugDetail(
      {this.id,
      this.productId,
      this.manufacture,
      this.indication,
      this.contradiction,
      this.description,
      this.specificationForm,
      this.specificationClassification,
      this.specificationType,
      this.specificationPackaging,
      this.specificationCategory,
      this.specificationBpom,
      this.specificationIngredients,
      this.specificationDose,
      this.specificationSpecialAttention,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  DrugDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    manufacture = json['manufacture'];
    indication = json['indication'];
    contradiction = json['contradiction'];
    description = json['description'];
    specificationForm = json['specification_form'];
    specificationClassification = json['specification_classification'];
    specificationType = json['specification_type'];
    specificationPackaging = json['specification_packaging'];
    specificationCategory = json['specification_category'];
    specificationBpom = json['specification_bpom'];
    specificationIngredients = json['specification_ingredients'];
    specificationDose = json['specification_dose'];
    specificationSpecialAttention = json['specification_special_attention'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['manufacture'] = manufacture;
    data['indication'] = indication;
    data['contradiction'] = contradiction;
    data['description'] = description;
    data['specification_form'] = specificationForm;
    data['specification_classification'] = specificationClassification;
    data['specification_type'] = specificationType;
    data['specification_packaging'] = specificationPackaging;
    data['specification_category'] = specificationCategory;
    data['specification_bpom'] = specificationBpom;
    data['specification_ingredients'] = specificationIngredients;
    data['specification_dose'] = specificationDose;
    data['specification_special_attention'] = specificationSpecialAttention;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
