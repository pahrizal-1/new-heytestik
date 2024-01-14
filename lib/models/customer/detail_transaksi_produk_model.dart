class DetailTransaksiProdukModel {
  bool? success;
  String? message;
  Data? data;

  DetailTransaksiProdukModel({this.success, this.message, this.data});

  DetailTransaksiProdukModel.fromJson(Map<String, dynamic> json) {
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
  PaymentMethod? paymentMethod;
  List<TransactionProductItems>? transactionProductItems;
  ShippingProduct? shippingProduct;

  Data(
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
      this.transactionProductItems,
      this.shippingProduct});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['transaction_product_items'] != null) {
      transactionProductItems = <TransactionProductItems>[];
      json['transaction_product_items'].forEach((v) {
        transactionProductItems!.add(TransactionProductItems.fromJson(v));
      });
    }
    shippingProduct = json['shipping_product'] != null
        ? ShippingProduct.fromJson(json['shipping_product'])
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
    if (transactionProductItems != null) {
      data['transaction_product_items'] =
          transactionProductItems!.map((v) => v.toJson()).toList();
    }
    if (shippingProduct != null) {
      data['shipping_product'] = shippingProduct!.toJson();
    }
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
  dynamic deletedAt;
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
  dynamic productReview;

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
    productReview = json['product_review'];
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
    data['product_review'] = productReview;
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
  dynamic productSku;
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
