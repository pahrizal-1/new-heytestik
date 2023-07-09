class SkincareRecommendationModel {
  bool? success;
  String? message;
  Data? data;

  SkincareRecommendationModel({this.success, this.message, this.data});

  SkincareRecommendationModel.fromJson(Map<String, dynamic> json) {
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
  int? doctorId;
  String? name;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<RecipeRecomendationSkincareItems>? recipeRecomendationSkincareItems;

  Data2(
      {this.id,
      this.doctorId,
      this.name,
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
    name = json['name'];
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
            .add(RecipeRecomendationSkincareItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['doctor_id'] = doctorId;
    data['name'] = name;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (recipeRecomendationSkincareItems != null) {
      data['recipe_recomendation_skincare_items'] =
          recipeRecomendationSkincareItems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecipeRecomendationSkincareItems {
  int? id;
  int? recipeRecomendationSkincareId;
  int? skincareId;
  String? notes;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Skincare? skincare;

  RecipeRecomendationSkincareItems(
      {this.id,
      this.recipeRecomendationSkincareId,
      this.skincareId,
      this.notes,
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
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    skincare =
        json['skincare'] != null ? Skincare.fromJson(json['skincare']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['recipe_recomendation_skincare_id'] = recipeRecomendationSkincareId;
    data['skincare_id'] = skincareId;
    data['notes'] = notes;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (skincare != null) {
      data['skincare'] = skincare!.toJson();
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
  dynamic productTreshold;
  dynamic productSku;
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
    if (mediaProducts != null) {
      data['media_products'] = mediaProducts!.map((v) => v.toJson()).toList();
    }
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
