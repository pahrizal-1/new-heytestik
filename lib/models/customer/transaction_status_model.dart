class TransactionStatusModel {
  bool? success;
  String? message;
  Data? data;

  TransactionStatusModel({this.success, this.message, this.data});

  TransactionStatusModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? paymentStatus;
  String? paymentMethod;
  dynamic paymentType;
  String? expiryTime;
  dynamic vaNumber;
  dynamic billKey;
  dynamic billCode;
  dynamic qrString;
  List<Actions>? actions;
  Transaction? transaction;

  Data(
      {this.paymentStatus,
      this.paymentMethod,
      this.paymentType,
      this.expiryTime,
      this.vaNumber,
      this.billKey,
      this.billCode,
      this.qrString,
      this.actions,
      this.transaction});

  Data.fromJson(Map<String, dynamic> json) {
    paymentStatus = json['payment_status'];
    paymentMethod = json['payment_method'];
    paymentType = json['payment_type'];
    expiryTime = json['expiry_time'];
    vaNumber = json['va_number'];
    billKey = json['bill_key'];
    billCode = json['bill_code'];
    qrString = json['qr_string'];
    if (json['actions'] != null) {
      actions = <Actions>[];
      json['actions'].forEach((v) {
        actions!.add(Actions.fromJson(v));
      });
    }
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['payment_status'] = this.paymentStatus;
    data['payment_method'] = this.paymentMethod;
    data['payment_type'] = this.paymentType;
    data['expiry_time'] = this.expiryTime;
    data['va_number'] = this.vaNumber;
    data['bill_key'] = this.billKey;
    data['bill_code'] = this.billCode;
    data['qr_string'] = this.qrString;
    if (this.actions != null) {
      data['actions'] = this.actions!.map((v) => v.toJson()).toList();
    }
    if (this.transaction != null) {
      data['transaction'] = this.transaction!.toJson();
    }
    return data;
  }
}

class Actions {
  String? name;
  String? method;
  String? url;

  Actions({this.name, this.method, this.url});

  Actions.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    method = json['method'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['method'] = this.method;
    data['url'] = this.url;
    return data;
  }
}

class Transaction {
  String? id;
  int? customerId;
  int? medicalHistoryId;
  int? duration;
  int? totalPrice;
  int? totalFee;
  int? transactionFee;
  int? deliveryFee;
  int? tax;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? orderId;
  String? paymentExternalId;
  String? paymentStatus;
  String? paymentExpiryTime;
  dynamic paymentSettlementTime;
  dynamic vaNumber;
  dynamic billKey;
  dynamic billerCode;
  dynamic qrString;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  dynamic consultationInvoice;
  Customer? customer;
  PaymentMethod? paymentMethod;
  MedicalHistory? medicalHistory;
  dynamic consultation;
  dynamic consultationReview;
  List<TransactionProductItems>? transactionProductItems;

  Transaction(
      {this.id,
      this.customerId,
      this.medicalHistoryId,
      this.duration,
      this.totalPrice,
      this.totalFee,
      this.transactionFee,
      this.deliveryFee,
      this.tax,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.orderId,
      this.paymentExternalId,
      this.paymentStatus,
      this.paymentExpiryTime,
      this.paymentSettlementTime,
      this.vaNumber,
      this.billKey,
      this.billerCode,
      this.qrString,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.consultationInvoice,
      this.customer,
      this.paymentMethod,
      this.medicalHistory,
      this.consultation,
      this.consultationReview,
      this.transactionProductItems});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerId = json['customer_id'];
    medicalHistoryId = json['medical_history_id'];
    duration = json['duration'];
    totalPrice = json['total_price'];
    totalFee = json['total_fee'];
    transactionFee = json['transaction_fee'];
    deliveryFee = json['delivery_fee'];
    tax = json['tax'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    orderId = json['order_id'];
    paymentExternalId = json['payment_external_id'];
    paymentStatus = json['payment_status'];
    paymentExpiryTime = json['payment_expiry_time'];
    paymentSettlementTime = json['payment_settlement_time'];
    vaNumber = json['va_number'];
    billKey = json['bill_key'];
    billerCode = json['biller_code'];
    qrString = json['qr_string'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    consultationInvoice = json['consultation_invoice'];
    customer =
        json['customer'] != null ? Customer.fromJson(json['customer']) : null;
    paymentMethod = json['payment_method'] != null
        ? PaymentMethod.fromJson(json['payment_method'])
        : null;
    medicalHistory = json['medical_history'] != null
        ? MedicalHistory.fromJson(json['medical_history'])
        : null;
    consultation = json['consultation'];
    consultationReview = json['consultation_review'];
    if (json['transaction_product_items'] != null) {
      transactionProductItems = <TransactionProductItems>[];
      json['transaction_product_items'].forEach((v) {
        transactionProductItems!.add(TransactionProductItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['medical_history_id'] = this.medicalHistoryId;
    data['duration'] = this.duration;
    data['total_fee'] = this.totalFee;
    data['delivery_fee'] = this.deliveryFee;
    data['transaction_fee'] = this.transactionFee;
    data['tax'] = this.tax;
    data['total_discount'] = this.totalDiscount;
    data['total_paid'] = this.totalPaid;
    data['payment_method_id'] = this.paymentMethodId;
    data['order_id'] = this.orderId;
    data['payment_external_id'] = this.paymentExternalId;
    data['payment_status'] = this.paymentStatus;
    data['payment_expiry_time'] = this.paymentExpiryTime;
    data['payment_settlement_time'] = this.paymentSettlementTime;
    data['va_number'] = this.vaNumber;
    data['bill_key'] = this.billKey;
    data['biller_code'] = this.billerCode;
    data['qr_string'] = this.qrString;
    data['status'] = this.status;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['consultation_invoice'] = this.consultationInvoice;
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    if (this.paymentMethod != null) {
      data['payment_method'] = this.paymentMethod!.toJson();
    }
    if (this.medicalHistory != null) {
      data['medical_history'] = this.medicalHistory!.toJson();
    }
    data['consultation'] = this.consultation;
    data['consultation_review'] = this.consultationReview;
    return data;
  }
}

class Customer {
  int? id;
  String? fullname;
  String? username;
  String? email;
  dynamic password;
  dynamic noPhone;
  dynamic gender;
  dynamic address;
  dynamic photoProfile;
  dynamic referralCode;
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
  dynamic verifiedPhoneAt;
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
    data['id'] = this.id;
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['email'] = this.email;
    data['password'] = this.password;
    data['no_phone'] = this.noPhone;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['photo_profile'] = this.photoProfile;
    data['referral_code'] = this.referralCode;
    data['user_code'] = this.userCode;
    data['roleId'] = this.roleId;
    data['verification_code_phone'] = this.verificationCodePhone;
    data['verification_code_email'] = this.verificationCodeEmail;
    data['provinceId'] = this.provinceId;
    data['cityId'] = this.cityId;
    data['dob'] = this.dob;
    data['bio'] = this.bio;
    data['finish_register'] = this.finishRegister;
    data['verified_email_at'] = this.verifiedEmailAt;
    data['verified_phone_at'] = this.verifiedPhoneAt;
    data['verified_account_at'] = this.verifiedAccountAt;
    data['education'] = this.education;
    data['practice_location'] = this.practiceLocation;
    data['join_date'] = this.joinDate;
    data['title'] = this.title;
    data['sip'] = this.sip;
    data['str'] = this.str;
    data['ktp_no'] = this.ktpNo;
    data['ktp_image'] = this.ktpImage;
    data['npwp_no'] = this.npwpNo;
    data['npwp_image'] = this.npwpImage;
    data['specialist'] = this.specialist;
    data['rating'] = this.rating;
    data['status_schedule'] = this.statusSchedule;
    data['since'] = this.since;
    data['start'] = this.start;
    data['until'] = this.until;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    data['refresh_token'] = this.refreshToken;
    return data;
  }
}

class PaymentMethod {
  int? id;
  String? name;
  String? method;
  String? paymentGateway;
  String? type;
  String? channelCode;
  String? transactionFeeType;
  double? transactionFeePercentage;
  double? transactionFeeFixAmount;
  dynamic accountNumber;
  String? segment;
  String? description;
  bool? isActive;
  bool? isDisplayed;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  MediaPaymentMethod? mediaPaymentMethod;

  PaymentMethod(
      {this.id,
      this.name,
      this.method,
      this.paymentGateway,
      this.type,
      this.channelCode,
      this.transactionFeeType,
      this.transactionFeePercentage,
      this.transactionFeeFixAmount,
      this.accountNumber,
      this.segment,
      this.description,
      this.isActive,
      this.isDisplayed,
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
    paymentGateway = json['payment_gateway'];
    type = json['type'];
    channelCode = json['channel_code'];
    transactionFeeType = json['transaction_fee_type'];
    transactionFeePercentage = json['transaction_fee_percentage'] != null
        ? double.parse(json['transaction_fee_percentage'].toString())
        : null;
    transactionFeeFixAmount = json['transaction_fee_fix_amount'] != null
        ? double.parse((json['transaction_fee_fix_amount'] ?? "0.0").toString())
        : null;
    accountNumber = json['account_number'];
    segment = json['segment'];
    description = json['description'];
    isActive = json['is_active'];
    isDisplayed = json['is_displayed'];
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['method'] = this.method;
    data['payment_gateway'] = this.paymentGateway;
    data['type'] = this.type;
    data['channel_code'] = this.channelCode;
    data['transaction_fee_type'] = this.transactionFeeType;
    data['transaction_fee_percentage'] = this.transactionFeePercentage;
    data['transaction_fee_fix_amount'] = this.transactionFeeFixAmount;
    data['account_number'] = this.accountNumber;
    data['segment'] = this.segment;
    data['description'] = this.description;
    data['is_active'] = this.isActive;
    data['is_displayed'] = this.isDisplayed;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.mediaPaymentMethod != null) {
      data['media_payment_method'] = this.mediaPaymentMethod!.toJson();
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
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['payment_method_id'] = this.paymentMethodId;
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
    data['id'] = this.id;
    data['customer_id'] = this.customerId;
    data['interest_condition_id'] = this.interestConditionId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.interestCondition != null) {
      data['interest_condition'] = this.interestCondition!.toJson();
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
  String? note;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;
  dynamic productReview;

  TransactionProductItems(
      {this.id,
      this.transactionProductId,
      this.productId,
      this.qty,
      this.price,
      this.discount,
      this.subtotal,
      this.note,
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
    note = json['note'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
    productReview = json['product_review'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['transaction_product_id'] = this.transactionProductId;
    data['product_id'] = this.productId;
    data['qty'] = this.qty;
    data['price'] = this.price;
    data['discount'] = this.discount;
    data['subtotal'] = this.subtotal;
    data['note'] = this.note;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    data['product_review'] = this.productReview;
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
  dynamic productTreshold;
  String? productSku;
  int? rating;
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
    rating = json['rating'];
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['type'] = this.type;
    data['category'] = this.category;
    data['display'] = this.display;
    data['has_variant'] = this.hasVariant;
    data['min_order'] = this.minOrder;
    data['price'] = this.price;
    data['product_is_active'] = this.productIsActive;
    data['product_stock'] = this.productStock;
    data['product_treshold'] = this.productTreshold;
    data['product_sku'] = this.productSku;
    data['rating'] = this.rating;
    data['shipping_product_weight'] = this.shippingProductWeight;
    data['shipping_product_weight_type'] = this.shippingProductWeightType;
    data['shipping_product_size_length_type'] =
        this.shippingProductSizeLengthType;
    data['shipping_product_size_width_type'] =
        this.shippingProductSizeWidthType;
    data['shipping_product_size_height_type'] =
        this.shippingProductSizeHeightType;
    data['shipping_product_size_length'] = this.shippingProductSizeLength;
    data['shipping_product_size_width'] = this.shippingProductSizeWidth;
    data['shipping_product_size_height'] = this.shippingProductSizeHeight;
    data['shipping'] = this.shipping;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.skincareDetail != null) {
      data['skincare_detail'] = this.skincareDetail!.toJson();
    }
    data['drug_detail'] = this.drugDetail;
    if (this.mediaProducts != null) {
      data['media_products'] =
          this.mediaProducts!.map((v) => v.toJson()).toList();
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
    data['id'] = this.id;
    data['product_id'] = this.productId;
    data['brand'] = this.brand;
    data['description'] = this.description;
    data['specification_texture'] = this.specificationTexture;
    data['specification_bpom'] = this.specificationBpom;
    data['specification_netto'] = this.specificationNetto;
    data['specification_netto_type'] = this.specificationNettoType;
    data['specification_expired'] = this.specificationExpired;
    data['specification_packaging_type'] = this.specificationPackagingType;
    data['specification_ingredients'] = this.specificationIngredients;
    data['specification_how_to_use'] = this.specificationHowToUse;
    data['specification_storage_advice'] = this.specificationStorageAdvice;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
    data['id'] = this.id;
    data['media_id'] = this.mediaId;
    data['product_id'] = this.productId;
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
    data['id'] = this.id;
    data['concern_id'] = this.concernId;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['segment'] = this.segment;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
