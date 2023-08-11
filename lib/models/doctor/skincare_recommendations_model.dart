class SkincareRecommendationModel {
  bool? success;
  String? message;
  Data? data;

  SkincareRecommendationModel({this.success, this.message, this.data});

  SkincareRecommendationModel.fromJson(Map<String, dynamic> json) {
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
  List<Data2>? data;
  Meta? meta;

  Data({this.data, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data2>[];
      json['data'].forEach((v) {
        data!.add(new Data2.fromJson(v));
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

class Data2 {
  int? id;
  int? doctorId;
  String? title;
  String? subtitle;
  bool? isActive;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<RecipeRecomendationSkincareItems>? recipeRecomendationSkincareItems;

  Data2(
      {this.id,
      this.doctorId,
      this.title,
      this.subtitle,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.recipeRecomendationSkincareItems});

  Data2.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['recipe_recomendation_skincare_items'] != null) {
      recipeRecomendationSkincareItems = <RecipeRecomendationSkincareItems>[];
      json['recipe_recomendation_skincare_items'].forEach((v) {
        recipeRecomendationSkincareItems!
            .add(new RecipeRecomendationSkincareItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.recipeRecomendationSkincareItems != null) {
      data['recipe_recomendation_skincare_items'] = this
          .recipeRecomendationSkincareItems!
          .map((v) => v.toJson())
          .toList();
    }
    return data;
  }
}

class RecipeRecomendationSkincareItems {
  int? id;
  int? recipeRecomendationSkincareId;
  int? skincareId;
  String? notes;
  int? qty;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  Skincare? skincare;

  RecipeRecomendationSkincareItems(
      {this.id,
      this.recipeRecomendationSkincareId,
      this.skincareId,
      this.notes,
      this.qty,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.skincare});

  RecipeRecomendationSkincareItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    recipeRecomendationSkincareId = json['recipe_recomendation_skincare_id'];
    skincareId = json['skincare_id'];
    notes = json['notes'];
    qty = json['qty'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    skincare = json['skincare'] != null
        ? new Skincare.fromJson(json['skincare'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['recipe_recomendation_skincare_id'] =
        this.recipeRecomendationSkincareId;
    data['skincare_id'] = this.skincareId;
    data['notes'] = this.notes;
    data['qty'] = this.qty;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.skincare != null) {
      data['skincare'] = this.skincare!.toJson();
    }
    return data;
  }
}

class Skincare {
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
  int? rating;
  int? shippingProductWeight;
  String? shippingProductWeightType;
  int? shippingProductSizeLength;
  int? shippingProductSizeWidth;
  int? shippingProductSizeHeight;
  String? shipping;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  SkincareDetail? skincareDetail;
  Null? drugDetail;
  List<MediaProducts>? mediaProducts;

  Skincare(
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

  Skincare.fromJson(Map<String, dynamic> json) {
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
        ? new SkincareDetail.fromJson(json['skincare_detail'])
        : null;
    drugDetail = json['drug_detail'];
    if (json['media_products'] != null) {
      mediaProducts = <MediaProducts>[];
      json['media_products'].forEach((v) {
        mediaProducts!.add(new MediaProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
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
    media = json['media'] != null ? new Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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