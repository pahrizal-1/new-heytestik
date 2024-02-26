class DrugModel {
  bool? success;
  String? message;
  Data? data;

  DrugModel({this.success, this.message, this.data});

  DrugModel.fromJson(Map<String, dynamic> json) {
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
  List<ConsultationRecipeDrugs>? consultationRecipeDrugs;
  List<MediaProducts>? mediaProducts;
  dynamic skincareDetail;
  DrugDetail? drugDetail;
  List<ProductConcerns>? productConcerns;

  Data2(
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
      this.consultationRecipeDrugs,
      this.mediaProducts,
      this.skincareDetail,
      this.drugDetail,
      this.productConcerns});

  Data2.fromJson(Map<String, dynamic> json) {
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
    skincareDetail = json['skincare_detail'];
    drugDetail = json['drug_detail'] != null
        ? DrugDetail.fromJson(json['drug_detail'])
        : null;
    if (json['product_concerns'] != null) {
      productConcerns = <ProductConcerns>[];
      json['product_concerns'].forEach((v) {
        productConcerns!.add(ProductConcerns.fromJson(v));
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
    if (consultationRecipeDrugs != null) {
      data['consultation_recipe_drugs'] =
          consultationRecipeDrugs!.map((v) => v.toJson()).toList();
    }
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
    data['skincare_detail'] = skincareDetail;
    if (drugDetail != null) {
      data['drug_detail'] = drugDetail!.toJson();
    }
    if (productConcerns != null) {
      data['product_concerns'] =
          productConcerns!.map((v) => v.toJson()).toList();
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

class ProductConcerns {
  int? id;
  int? productId;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Concern? concern;

  ProductConcerns(
      {this.id,
      this.productId,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.concern});

  ProductConcerns.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
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
    data['product_id'] = productId;
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
