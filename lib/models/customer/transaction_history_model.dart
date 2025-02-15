class TransactionHistoryModel {
  bool? success;
  String? message;
  Data? data;

  TransactionHistoryModel({this.success, this.message, this.data});

  TransactionHistoryModel.fromJson(Map<String, dynamic> json) {
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
  String? transactionId;
  String? transactionType;
  String? createdAt;
  Detail? detail;

  Data2(
      {this.transactionId, this.transactionType, this.createdAt, this.detail});

  Data2.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    transactionType = json['transaction_type'];
    createdAt = json['created_at'];
    detail = json['detail'] != null ? Detail.fromJson(json['detail']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['transaction_type'] = transactionType;
    data['created_at'] = createdAt;
    if (detail != null) {
      data['detail'] = detail!.toJson();
    }
    return data;
  }
}

class Detail {
  String? id;
  int? userId;
  int? totalPrice;
  int? deliveryFee;
  int? transactionFee;
  int? tax;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? orderId;
  String? paymentStatus;
  String? paymentExpiryTime;
  dynamic paymentTime;
  String? vaNumber;
  String? billKey;
  String? billerCode;
  String? status;
  String? orderStatus;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  PaymentMethod? paymentMethod;
  List<TransactionTreatmentItems>? transactionTreatmentItems;
  List<TransactionProductItems>? transactionProductItems;
  ShippingProduct? shippingProduct;
  int? customerId;
  int? medicalHistoryId;
  int? duration;
  int? totalFee;
  dynamic consultationInvoice;
  Customer? customer;
  MedicalHistory? medicalHistory;
  Consultation? consultation;
  ConsultationReview? consultationReview;

  Detail(
      {this.id,
      this.userId,
      this.totalPrice,
      this.deliveryFee,
      this.transactionFee,
      this.tax,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.orderId,
      this.paymentStatus,
      this.paymentExpiryTime,
      this.paymentTime,
      this.vaNumber,
      this.billKey,
      this.billerCode,
      this.status,
      this.orderStatus,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.paymentMethod,
      this.transactionTreatmentItems,
      this.transactionProductItems,
      this.shippingProduct,
      this.customerId,
      this.medicalHistoryId,
      this.duration,
      this.totalFee,
      this.consultationInvoice,
      this.customer,
      this.medicalHistory,
      this.consultation,
      this.consultationReview});

  Detail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    deliveryFee = json['delivery_fee'];
    transactionFee = json['transaction_fee'];
    tax = json['tax'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    orderId = json['order_id'];
    paymentStatus = json['payment_status'];
    paymentExpiryTime = json['payment_expiry_time'];
    paymentTime = json['payment_time'];
    vaNumber = json['va_number'];
    billKey = json['bill_key'];
    billerCode = json['biller_code'];
    status = json['status'];
    orderStatus = json['order_status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
    if (json['transaction_treatment_items'] != null) {
      transactionTreatmentItems = <TransactionTreatmentItems>[];
      json['transaction_treatment_items'].forEach((v) {
        transactionTreatmentItems!.add(TransactionTreatmentItems.fromJson(v));
      });
    }
    if (json['transaction_product_items'] != null) {
      transactionProductItems = <TransactionProductItems>[];
      json['transaction_product_items'].forEach((v) {
        transactionProductItems!.add(TransactionProductItems.fromJson(v));
      });
    }
    shippingProduct = json['shipping_product'] != null
        ? ShippingProduct.fromJson(json['shipping_product'])
        : null;
    customerId = json['customer_id'];
    medicalHistoryId = json['medical_history_id'];
    duration = json['duration'];
    totalFee = json['total_fee'];
    consultationInvoice = json['consultation_invoice'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
    consultation = json['consultation'] != null
        ? Consultation.fromJson(json['consultation'])
        : null;
    consultationReview = json['consultation_review'] != null
        ? ConsultationReview.fromJson(json['consultation_review'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['total_price'] = totalPrice;
    data['delivery_fee'] = deliveryFee;
    data['transaction_fee'] = transactionFee;
    data['tax'] = tax;
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['payment_method_id'] = paymentMethodId;
    data['order_id'] = orderId;
    data['payment_status'] = paymentStatus;
    data['payment_expiry_time'] = paymentExpiryTime;
    data['payment_time'] = paymentTime;
    data['va_number'] = vaNumber;
    data['bill_key'] = billKey;
    data['biller_code'] = billerCode;
    data['status'] = status;
    data['order_status'] = orderStatus;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (paymentMethod != null) {
      data['payment_method'] = paymentMethod!.toJson();
    }
    if (transactionTreatmentItems != null) {
      data['transaction_treatment_items'] =
          transactionTreatmentItems!.map((v) => v.toJson()).toList();
    }
    if (transactionProductItems != null) {
      data['transaction_product_items'] =
          transactionProductItems!.map((v) => v.toJson()).toList();
    }
    if (shippingProduct != null) {
      data['shipping_product'] = shippingProduct!.toJson();
    }
    data['customer_id'] = customerId;
    data['medical_history_id'] = medicalHistoryId;
    data['duration'] = duration;
    data['total_fee'] = totalFee;
    data['consultation_invoice'] = consultationInvoice;
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    if (medicalHistory != null) {
      data['medical_history'] = medicalHistory!.toJson();
    }
    if (consultation != null) {
      data['consultation'] = consultation!.toJson();
    }
    if (consultationReview != null) {
      data['consultation_review'] = consultationReview!.toJson();
    }
    return data;
  }
}

class TransactionTreatmentItems {
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
  Treatment? treatment;
  TreatmentReview? treatmentReview;

  TransactionTreatmentItems(
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
      this.treatment,
      this.treatmentReview});

  TransactionTreatmentItems.fromJson(Map<String, dynamic> json) {
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
    treatment = json['treatment'] != null
        ? Treatment.fromJson(json['treatment'])
        : null;
    treatmentReview = json['treatment_review'] != null
        ? TreatmentReview.fromJson(json['treatment_review'])
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
    if (treatment != null) {
      data['treatment'] = treatment!.toJson();
    }
    if (treatmentReview != null) {
      data['treatment_review'] = treatmentReview!.toJson();
    }
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
  List<MediaTreatments>? mediaTreatments;
  Clinic? clinic;

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
      this.mediaTreatments,
      this.clinic});

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
    if (json['media_treatments'] != null) {
      mediaTreatments = <MediaTreatments>[];
      json['media_treatments'].forEach((v) {
        mediaTreatments!.add(MediaTreatments.fromJson(v));
      });
    }
    clinic = json['clinic'] != null ? Clinic.fromJson(json['clinic']) : null;
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
    if (mediaTreatments != null) {
      data['media_treatments'] =
          mediaTreatments!.map((v) => v.toJson()).toList();
    }
    if (clinic != null) {
      data['clinic'] = clinic!.toJson();
    }
    return data;
  }
}

class TreatmentReview {
  int? id;
  String? transactionTreatmentId;
  int? transactionTreatmentItemId;
  int? treatmentId;
  int? userId;
  int? careRating;
  int? serviceRating;
  int? managementRating;
  double? avgRating;
  String? review;
  dynamic replyReview;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  TreatmentReview(
      {this.id,
      this.transactionTreatmentId,
      this.transactionTreatmentItemId,
      this.treatmentId,
      this.userId,
      this.careRating,
      this.serviceRating,
      this.managementRating,
      this.avgRating,
      this.review,
      this.replyReview,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  TreatmentReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionTreatmentId = json['transaction_treatment_id'];
    transactionTreatmentItemId = json['transaction_treatment_item_id'];
    treatmentId = json['treatment_id'];
    userId = json['user_id'];
    careRating = json['care_rating'];
    serviceRating = json['service_rating'];
    managementRating = json['management_rating'];
    avgRating = double.parse(json['avg_rating'].toString());
    review = json['review'];
    replyReview = json['reply_review'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_treatment_id'] = transactionTreatmentId;
    data['transaction_treatment_item_id'] = transactionTreatmentItemId;
    data['treatment_id'] = treatmentId;
    data['user_id'] = userId;
    data['care_rating'] = careRating;
    data['service_rating'] = serviceRating;
    data['management_rating'] = managementRating;
    data['avg_rating'] = avgRating;
    data['review'] = review;
    data['reply_review'] = replyReview;
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
    rating = double.parse(json['rating'].toString());
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
    return data;
  }
}

class PaymentMethod {
  int? id;
  String? name;
  String? method;
  String? type;
  String? transactionFee;
  dynamic accountNumber;
  String? segment;
  String? description;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  MediaPaymentMethod? mediaPaymentMethod;

  PaymentMethod(
      {this.id,
      this.name,
      this.method,
      this.type,
      this.transactionFee,
      this.accountNumber,
      this.segment,
      this.description,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaPaymentMethod});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    method = json['method'];
    type = json['type'];
    transactionFee = json['transaction_fee'];
    accountNumber = json['account_number'];
    segment = json['segment'];
    description = json['description'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    mediaPaymentMethod = json['media_payment_method'] != null
        ? MediaPaymentMethod.fromJson(json['media_payment_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['method'] = method;
    data['type'] = type;
    data['transaction_fee'] = transactionFee;
    data['account_number'] = accountNumber;
    data['segment'] = segment;
    data['description'] = description;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (mediaPaymentMethod != null) {
      data['media_payment_method'] = mediaPaymentMethod!.toJson();
    }
    return data;
  }
}

class MediaPaymentMethod {
  int? id;
  int? mediaId;
  int? paymentMethodId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaPaymentMethod(
      {this.id,
      this.mediaId,
      this.paymentMethodId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaPaymentMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    paymentMethodId = json['payment_method_id'];
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
    data['payment_method_id'] = paymentMethodId;
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

class TransactionProductItems {
  int? id;
  String? transactionProductId;
  int? productId;
  int? qty;
  int? price;
  int? discount;
  int? subtotal;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;
  ProductReview? productReview;

  TransactionProductItems(
      {this.id,
      this.transactionProductId,
      this.productId,
      this.qty,
      this.price,
      this.discount,
      this.subtotal,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product,
      this.productReview});

  TransactionProductItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionProductId = json['transaction_product_id'];
    productId = json['product_id'];
    qty = json['qty'];
    price = json['price'];
    discount = json['discount'];
    subtotal = json['subtotal'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    productReview = json['product_review'] != null
        ? ProductReview.fromJson(json['product_review'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_product_id'] = transactionProductId;
    data['product_id'] = productId;
    data['qty'] = qty;
    data['price'] = price;
    data['discount'] = discount;
    data['subtotal'] = subtotal;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    if (productReview != null) {
      data['product_review'] = productReview!.toJson();
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
  String? shippingProductSizeLengthType;
  String? shippingProductSizeWidthType;
  String? shippingProductSizeHeightType;
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
      this.shippingProductSizeLengthType,
      this.shippingProductSizeWidthType,
      this.shippingProductSizeHeightType,
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
    shippingProductSizeLengthType = json['shipping_product_size_length_type'];
    shippingProductSizeWidthType = json['shipping_product_size_width_type'];
    shippingProductSizeHeightType = json['shipping_product_size_height_type'];
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
    data['shipping_product_size_length_type'] = shippingProductSizeLengthType;
    data['shipping_product_size_width_type'] = shippingProductSizeWidthType;
    data['shipping_product_size_height_type'] = shippingProductSizeHeightType;
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

class ProductReview {
  int? id;
  String? transactionProductId;
  int? transactionProductItemId;
  int? productId;
  int? userId;
  int? effectivenessRating;
  int? textureRating;
  int? packagingRating;
  double? avgRating;
  String? review;
  dynamic replyReview;
  String? usageDuration;
  String? wouldRecommend;
  String? wouldRepurchase;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ProductReview(
      {this.id,
      this.transactionProductId,
      this.transactionProductItemId,
      this.productId,
      this.userId,
      this.effectivenessRating,
      this.textureRating,
      this.packagingRating,
      this.avgRating,
      this.review,
      this.replyReview,
      this.usageDuration,
      this.wouldRecommend,
      this.wouldRepurchase,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ProductReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionProductId = json['transaction_product_id'];
    transactionProductItemId = json['transaction_product_item_id'];
    productId = json['product_id'];
    userId = json['user_id'];
    effectivenessRating = json['effectiveness_rating'];
    textureRating = json['texture_rating'];
    packagingRating = json['packaging_rating'];
    avgRating = double.parse(json['avg_rating'].toString());
    review = json['review'];
    replyReview = json['reply_review'];
    usageDuration = json['usage_duration'];
    wouldRecommend = json['would_recommend'];
    wouldRepurchase = json['would_repurchase'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_product_id'] = transactionProductId;
    data['transaction_product_item_id'] = transactionProductItemId;
    data['product_id'] = productId;
    data['user_id'] = userId;
    data['effectiveness_rating'] = effectivenessRating;
    data['texture_rating'] = textureRating;
    data['packaging_rating'] = packagingRating;
    data['avg_rating'] = avgRating;
    data['review'] = review;
    data['reply_review'] = replyReview;
    data['usage_duration'] = usageDuration;
    data['would_recommend'] = wouldRecommend;
    data['would_repurchase'] = wouldRepurchase;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ShippingProduct {
  int? id;
  int? userId;
  String? transactionProductId;
  int? shippingMethodId;
  int? shipperId;
  String? recipientName;
  String? recipientPhone;
  String? recipientLatitude;
  String? recipientLongitude;
  String? recipientProvince;
  String? recipientCity;
  String? recipientSubdistrict;
  String? recipientZipCode;
  String? recipientAddress;
  String? recipientNote;
  int? deliveryFee;
  String? deliveryStatus;
  String? waybill;
  String? podReceiver;
  String? podUrl;
  dynamic driverId;
  dynamic driverName;
  dynamic driverPhone;
  dynamic driverPhoto;
  dynamic driverVehicleNumber;
  dynamic cancelledBy;
  dynamic cancelledReason;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Shipper? shipper;
  ShippingMethod? shippingMethod;

  ShippingProduct(
      {this.id,
      this.userId,
      this.transactionProductId,
      this.shippingMethodId,
      this.shipperId,
      this.recipientName,
      this.recipientPhone,
      this.recipientLatitude,
      this.recipientLongitude,
      this.recipientProvince,
      this.recipientCity,
      this.recipientSubdistrict,
      this.recipientZipCode,
      this.recipientAddress,
      this.recipientNote,
      this.deliveryFee,
      this.deliveryStatus,
      this.waybill,
      this.podReceiver,
      this.podUrl,
      this.driverId,
      this.driverName,
      this.driverPhone,
      this.driverPhoto,
      this.driverVehicleNumber,
      this.cancelledBy,
      this.cancelledReason,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.shipper,
      this.shippingMethod});

  ShippingProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    transactionProductId = json['transaction_product_id'];
    shippingMethodId = json['shipping_method_id'];
    shipperId = json['shipper_id'];
    recipientName = json['recipient_name'];
    recipientPhone = json['recipient_phone'];
    recipientLatitude = json['recipient_latitude'];
    recipientLongitude = json['recipient_longitude'];
    recipientProvince = json['recipient_province'];
    recipientCity = json['recipient_city'];
    recipientSubdistrict = json['recipient_subdistrict'];
    recipientZipCode = json['recipient_zip_code'];
    recipientAddress = json['recipient_address'];
    recipientNote = json['recipient_note'];
    deliveryFee = json['delivery_fee'];
    deliveryStatus = json['delivery_status'];
    waybill = json['waybill'];
    podReceiver = json['pod_receiver'];
    podUrl = json['pod_url'];
    driverId = json['driver_id'];
    driverName = json['driver_name'];
    driverPhone = json['driver_phone'];
    driverPhoto = json['driver_photo'];
    driverVehicleNumber = json['driver_vehicle_number'];
    cancelledBy = json['cancelled_by'];
    cancelledReason = json['cancelled_reason'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    shipper =
        json['shipper'] != null ? Shipper.fromJson(json['shipper']) : null;
    shippingMethod = json['shipping_method'] != null
        ? ShippingMethod.fromJson(json['shipping_method'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['transaction_product_id'] = transactionProductId;
    data['shipping_method_id'] = shippingMethodId;
    data['shipper_id'] = shipperId;
    data['recipient_name'] = recipientName;
    data['recipient_phone'] = recipientPhone;
    data['recipient_latitude'] = recipientLatitude;
    data['recipient_longitude'] = recipientLongitude;
    data['recipient_province'] = recipientProvince;
    data['recipient_city'] = recipientCity;
    data['recipient_subdistrict'] = recipientSubdistrict;
    data['recipient_zip_code'] = recipientZipCode;
    data['recipient_address'] = recipientAddress;
    data['recipient_note'] = recipientNote;
    data['delivery_fee'] = deliveryFee;
    data['delivery_status'] = deliveryStatus;
    data['waybill'] = waybill;
    data['pod_receiver'] = podReceiver;
    data['pod_url'] = podUrl;
    data['driver_id'] = driverId;
    data['driver_name'] = driverName;
    data['driver_phone'] = driverPhone;
    data['driver_photo'] = driverPhoto;
    data['driver_vehicle_number'] = driverVehicleNumber;
    data['cancelled_by'] = cancelledBy;
    data['cancelled_reason'] = cancelledReason;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (shipper != null) {
      data['shipper'] = shipper!.toJson();
    }
    if (shippingMethod != null) {
      data['shipping_method'] = shippingMethod!.toJson();
    }
    return data;
  }
}

class Shipper {
  int? id;
  String? name;
  String? phone;
  String? email;
  String? latitude;
  String? longitude;
  String? province;
  String? city;
  String? subdistrict;
  String? zipCode;
  String? address;
  String? originCode;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Shipper(
      {this.id,
      this.name,
      this.phone,
      this.email,
      this.latitude,
      this.longitude,
      this.province,
      this.city,
      this.subdistrict,
      this.zipCode,
      this.address,
      this.originCode,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Shipper.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    province = json['province'];
    city = json['city'];
    subdistrict = json['subdistrict'];
    zipCode = json['zip_code'];
    address = json['address'];
    originCode = json['origin_code'];
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
    data['phone'] = phone;
    data['email'] = email;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['province'] = province;
    data['city'] = city;
    data['subdistrict'] = subdistrict;
    data['zip_code'] = zipCode;
    data['address'] = address;
    data['origin_code'] = originCode;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class ShippingMethod {
  int? id;
  String? name;
  String? provider;
  String? description;
  String? type;
  String? providerServiceCode;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ShippingMethod(
      {this.id,
      this.name,
      this.provider,
      this.description,
      this.type,
      this.providerServiceCode,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ShippingMethod.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    provider = json['provider'];
    description = json['description'];
    type = json['type'];
    providerServiceCode = json['provider_service_code'];
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
    data['provider'] = provider;
    data['description'] = description;
    data['type'] = type;
    data['provider_service_code'] = providerServiceCode;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Customer {
  int? id;
  String? fullname;
  String? username;
  String? email;
  String? password;
  String? noPhone;
  String? gender;
  String? address;
  String? photoProfile;
  String? referralCode;
  dynamic userCode;
  int? roleId;
  dynamic verificationCodePhone;
  dynamic verificationCodeEmail;
  dynamic provinceId;
  dynamic cityId;
  dynamic dob;
  dynamic bio;
  bool? finishRegister;
  String? verifiedEmailAt;
  String? verifiedPhoneAt;
  dynamic verifiedAccountAt;
  dynamic education;
  dynamic practiceLocation;
  dynamic joinDate;
  dynamic title;
  dynamic sip;
  dynamic str;
  dynamic ktpNo;
  dynamic ktpImage;
  dynamic npwpNo;
  dynamic npwpImage;
  dynamic specialist;
  int? rating;
  dynamic statusSchedule;
  dynamic since;
  dynamic start;
  dynamic until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic refreshToken;

  Customer(
      {this.id,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.noPhone,
      this.gender,
      this.address,
      this.photoProfile,
      this.referralCode,
      this.userCode,
      this.roleId,
      this.verificationCodePhone,
      this.verificationCodeEmail,
      this.provinceId,
      this.cityId,
      this.dob,
      this.bio,
      this.finishRegister,
      this.verifiedEmailAt,
      this.verifiedPhoneAt,
      this.verifiedAccountAt,
      this.education,
      this.practiceLocation,
      this.joinDate,
      this.title,
      this.sip,
      this.str,
      this.ktpNo,
      this.ktpImage,
      this.npwpNo,
      this.npwpImage,
      this.specialist,
      this.rating,
      this.statusSchedule,
      this.since,
      this.start,
      this.until,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.refreshToken});

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    noPhone = json['no_phone'];
    gender = json['gender'];
    address = json['address'];
    photoProfile = json['photo_profile'];
    referralCode = json['referral_code'];
    userCode = json['user_code'];
    roleId = json['roleId'];
    verificationCodePhone = json['verification_code_phone'];
    verificationCodeEmail = json['verification_code_email'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    dob = json['dob'];
    bio = json['bio'];
    finishRegister = json['finish_register'];
    verifiedEmailAt = json['verified_email_at'];
    verifiedPhoneAt = json['verified_phone_at'];
    verifiedAccountAt = json['verified_account_at'];
    education = json['education'];
    practiceLocation = json['practice_location'];
    joinDate = json['join_date'];
    title = json['title'];
    sip = json['sip'];
    str = json['str'];
    ktpNo = json['ktp_no'];
    ktpImage = json['ktp_image'];
    npwpNo = json['npwp_no'];
    npwpImage = json['npwp_image'];
    specialist = json['specialist'];
    rating = json['rating'];
    statusSchedule = json['status_schedule'];
    since = json['since'];
    start = json['start'];
    until = json['until'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['address'] = address;
    data['photo_profile'] = photoProfile;
    data['referral_code'] = referralCode;
    data['user_code'] = userCode;
    data['roleId'] = roleId;
    data['verification_code_phone'] = verificationCodePhone;
    data['verification_code_email'] = verificationCodeEmail;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['dob'] = dob;
    data['bio'] = bio;
    data['finish_register'] = finishRegister;
    data['verified_email_at'] = verifiedEmailAt;
    data['verified_phone_at'] = verifiedPhoneAt;
    data['verified_account_at'] = verifiedAccountAt;
    data['education'] = education;
    data['practice_location'] = practiceLocation;
    data['join_date'] = joinDate;
    data['title'] = title;
    data['sip'] = sip;
    data['str'] = str;
    data['ktp_no'] = ktpNo;
    data['ktp_image'] = ktpImage;
    data['npwp_no'] = npwpNo;
    data['npwp_image'] = npwpImage;
    data['specialist'] = specialist;
    data['rating'] = rating;
    data['status_schedule'] = statusSchedule;
    data['since'] = since;
    data['start'] = start;
    data['until'] = until;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['refresh_token'] = refreshToken;
    return data;
  }
}

class MedicalHistory {
  int? id;
  int? customerId;
  int? interestConditionId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  InterestCondition? interestCondition;

  MedicalHistory(
      {this.id,
      this.customerId,
      this.interestConditionId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestCondition});

  MedicalHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    interestConditionId = json['interest_condition_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    interestCondition = json['interest_condition'] != null
        ? InterestCondition.fromJson(json['interest_condition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['customer_id'] = customerId;
    data['interest_condition_id'] = interestConditionId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (interestCondition != null) {
      data['interest_condition'] = interestCondition!.toJson();
    }
    return data;
  }
}

class InterestCondition {
  int? id;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Concern? concern;

  InterestCondition(
      {this.id,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.concern});

  InterestCondition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
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
    data['concern_id'] = concernId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (this.concern != null) {
      data['concern'] = this.concern!.toJson();
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

class Consultation {
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
  Doctor? doctor;
  MedicalHistory? medicalHistory;

  Consultation(
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
      this.doctor,
      this.medicalHistory});

  Consultation.fromJson(Map<String, dynamic> json) {
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
    doctor = json['doctor'] != null ? Doctor.fromJson(json['doctor']) : null;
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
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
    if (doctor != null) {
      data['doctor'] = doctor!.toJson();
    }
    if (medicalHistory != null) {
      data['medical_history'] = medicalHistory!.toJson();
    }
    return data;
  }
}

class Doctor {
  int? id;
  String? fullname;
  String? username;
  String? email;
  String? password;
  String? noPhone;
  String? gender;
  String? address;
  String? photoProfile;
  String? referralCode;
  dynamic userCode;
  int? roleId;
  dynamic verificationCodePhone;
  dynamic verificationCodeEmail;
  dynamic provinceId;
  dynamic cityId;
  dynamic dob;
  dynamic bio;
  bool? finishRegister;
  String? verifiedEmailAt;
  String? verifiedPhoneAt;
  dynamic verifiedAccountAt;
  dynamic education;
  dynamic practiceLocation;
  dynamic joinDate;
  dynamic title;
  dynamic sip;
  dynamic str;
  dynamic ktpNo;
  dynamic ktpImage;
  dynamic npwpNo;
  dynamic npwpImage;
  dynamic specialist;
  double? rating;
  dynamic statusSchedule;
  dynamic since;
  dynamic start;
  dynamic until;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic refreshToken;
  MediaUserProfilePicture? mediaUserProfilePicture;

  Doctor(
      {this.id,
      this.fullname,
      this.username,
      this.email,
      this.password,
      this.noPhone,
      this.gender,
      this.address,
      this.photoProfile,
      this.referralCode,
      this.userCode,
      this.roleId,
      this.verificationCodePhone,
      this.verificationCodeEmail,
      this.provinceId,
      this.cityId,
      this.dob,
      this.bio,
      this.finishRegister,
      this.verifiedEmailAt,
      this.verifiedPhoneAt,
      this.verifiedAccountAt,
      this.education,
      this.practiceLocation,
      this.joinDate,
      this.title,
      this.sip,
      this.str,
      this.ktpNo,
      this.ktpImage,
      this.npwpNo,
      this.npwpImage,
      this.specialist,
      this.rating,
      this.statusSchedule,
      this.since,
      this.start,
      this.until,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.refreshToken,
      this.mediaUserProfilePicture});

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    noPhone = json['no_phone'];
    gender = json['gender'];
    address = json['address'];
    photoProfile = json['photo_profile'];
    referralCode = json['referral_code'];
    userCode = json['user_code'];
    roleId = json['roleId'];
    verificationCodePhone = json['verification_code_phone'];
    verificationCodeEmail = json['verification_code_email'];
    provinceId = json['provinceId'];
    cityId = json['cityId'];
    dob = json['dob'];
    bio = json['bio'];
    finishRegister = json['finish_register'];
    verifiedEmailAt = json['verified_email_at'];
    verifiedPhoneAt = json['verified_phone_at'];
    verifiedAccountAt = json['verified_account_at'];
    education = json['education'];
    practiceLocation = json['practice_location'];
    joinDate = json['join_date'];
    title = json['title'];
    sip = json['sip'];
    str = json['str'];
    ktpNo = json['ktp_no'];
    ktpImage = json['ktp_image'];
    npwpNo = json['npwp_no'];
    npwpImage = json['npwp_image'];
    specialist = json['specialist'];
    rating = double.parse(json['rating'].toString());
    statusSchedule = json['status_schedule'];
    since = json['since'];
    start = json['start'];
    until = json['until'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    refreshToken = json['refresh_token'];
    mediaUserProfilePicture = json['media_user_profile_picture'] != null
        ? MediaUserProfilePicture.fromJson(json['media_user_profile_picture'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fullname'] = fullname;
    data['username'] = username;
    data['email'] = email;
    data['password'] = password;
    data['no_phone'] = noPhone;
    data['gender'] = gender;
    data['address'] = address;
    data['photo_profile'] = photoProfile;
    data['referral_code'] = referralCode;
    data['user_code'] = userCode;
    data['roleId'] = roleId;
    data['verification_code_phone'] = verificationCodePhone;
    data['verification_code_email'] = verificationCodeEmail;
    data['provinceId'] = provinceId;
    data['cityId'] = cityId;
    data['dob'] = dob;
    data['bio'] = bio;
    data['finish_register'] = finishRegister;
    data['verified_email_at'] = verifiedEmailAt;
    data['verified_phone_at'] = verifiedPhoneAt;
    data['verified_account_at'] = verifiedAccountAt;
    data['education'] = education;
    data['practice_location'] = practiceLocation;
    data['join_date'] = joinDate;
    data['title'] = title;
    data['sip'] = sip;
    data['str'] = str;
    data['ktp_no'] = ktpNo;
    data['ktp_image'] = ktpImage;
    data['npwp_no'] = npwpNo;
    data['npwp_image'] = npwpImage;
    data['specialist'] = specialist;
    data['rating'] = rating;
    data['status_schedule'] = statusSchedule;
    data['since'] = since;
    data['start'] = start;
    data['until'] = until;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['refresh_token'] = refreshToken;
    if (mediaUserProfilePicture != null) {
      data['media_user_profile_picture'] = mediaUserProfilePicture!.toJson();
    }
    return data;
  }
}

class MediaUserProfilePicture {
  int? id;
  int? mediaId;
  int? userId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaUserProfilePicture(
      {this.id,
      this.mediaId,
      this.userId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaUserProfilePicture.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    userId = json['user_id'];
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
    data['user_id'] = userId;
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

class ConsultationReview {
  int? id;
  String? transactionConsultationId;
  int? consultationId;
  int? doctorId;
  int? customerId;
  double? rating;
  String? review;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  ConsultationReview(
      {this.id,
      this.transactionConsultationId,
      this.consultationId,
      this.doctorId,
      this.customerId,
      this.rating,
      this.review,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  ConsultationReview.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionConsultationId = json['transaction_consultation_id'];
    consultationId = json['consultation_id'];
    doctorId = json['doctor_id'];
    customerId = json['customer_id'];
    rating = double.parse(json['rating'].toString());
    review = json['review'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_consultation_id'] = transactionConsultationId;
    data['consultation_id'] = consultationId;
    data['doctor_id'] = doctorId;
    data['customer_id'] = customerId;
    data['rating'] = rating;
    data['review'] = review;
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
