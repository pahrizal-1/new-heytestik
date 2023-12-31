class ShippingInfoModel {
  bool? success;
  String? message;
  Data? data;

  ShippingInfoModel({this.success, this.message, this.data});

  ShippingInfoModel.fromJson(Map<String, dynamic> json) {
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
  ShippingMethod? shippingMethod;
  Shipper? shipper;
  TransactionProduct? transactionProduct;

  Data(
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
      this.shippingMethod,
      this.shipper,
      this.transactionProduct});

  Data.fromJson(Map<String, dynamic> json) {
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
    shippingMethod = json['shipping_method'] != null
        ? ShippingMethod.fromJson(json['shipping_method'])
        : null;
    shipper =
        json['shipper'] != null ? Shipper.fromJson(json['shipper']) : null;
    transactionProduct = json['transaction_product'] != null
        ? TransactionProduct.fromJson(json['transaction_product'])
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
    if (shippingMethod != null) {
      data['shipping_method'] = shippingMethod!.toJson();
    }
    if (shipper != null) {
      data['shipper'] = shipper!.toJson();
    }
    if (transactionProduct != null) {
      data['transaction_product'] = transactionProduct!.toJson();
    }
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

class TransactionProduct {
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
  dynamic billKey;
  dynamic billerCode;
  String? status;
  String? orderStatus;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  TransactionProduct(
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
      this.deletedAt});

  TransactionProduct.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}
