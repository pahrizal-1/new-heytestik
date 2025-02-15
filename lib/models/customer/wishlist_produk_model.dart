class WishlistProdukModel {
  bool? success;
  String? message;
  Data? data;

  WishlistProdukModel({this.success, this.message, this.data});

  WishlistProdukModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  int? productId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Product? product;

  Data2(
      {this.id,
      this.userId,
      this.productId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.product});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
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
    data['user_id'] = userId;
    data['product_id'] = productId;
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
  List<ConsultationRecipeDrugs>? consultationRecipeDrugs;
  List<MediaProducts>? mediaProducts;
  SkincareDetail? skincareDetail;
  DrugDetail? drugDetail;

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
      this.consultationRecipeDrugs,
      this.mediaProducts,
      this.skincareDetail,
      this.drugDetail});

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
    if (json['consultation_recipe_drugs'] != null) {
      consultationRecipeDrugs = <ConsultationRecipeDrugs>[];
      json['consultation_recipe_drugs'].forEach((v) {
        consultationRecipeDrugs!.add(ConsultationRecipeDrugs.fromJson(v));
      });
    }
    if (json['media_products'] != null) {
      mediaProducts = <MediaProducts>[];
      json['media_products'].forEach((v) {
        mediaProducts!.add(MediaProducts.fromJson(v));
      });
    }
    skincareDetail = json['skincare_detail'] != null
        ? SkincareDetail.fromJson(json['skincare_detail'])
        : null;
    drugDetail = json['drug_detail'] != null
        ? DrugDetail.fromJson(json['drug_detail'])
        : null;
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
    if (consultationRecipeDrugs != null) {
      data['consultation_recipe_drugs'] =
          consultationRecipeDrugs!.map((v) => v.toJson()).toList();
    }
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
    if (skincareDetail != null) {
      data['skincare_detail'] = skincareDetail!.toJson();
    }
    if (drugDetail != null) {
      data['drug_detail'] = drugDetail!.toJson();
    }
    return data;
  }
}

class ConsultationRecipeDrugs {
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

  ConsultationRecipeDrugs(
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
      this.deletedAt});

  ConsultationRecipeDrugs.fromJson(Map<String, dynamic> json) {
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
