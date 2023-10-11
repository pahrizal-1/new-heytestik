class PaymentMethodByIdModel {
  bool? success;
  String? message;
  Data? data;

  PaymentMethodByIdModel({this.success, this.message, this.data});

  PaymentMethodByIdModel.fromJson(Map<String, dynamic> json) {
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
  MediaPaymentMethod? mediaPaymentMethod;
  List<HowToPays>? howToPays;

  Data(
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
      this.deletedAt,
      this.mediaPaymentMethod,
      this.howToPays});

  Data.fromJson(Map<String, dynamic> json) {
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
    mediaPaymentMethod = json['media_payment_method'] != null
        ? MediaPaymentMethod.fromJson(json['media_payment_method'])
        : null;
    if (json['how_to_pays'] != null) {
      howToPays = <HowToPays>[];
      json['how_to_pays'].forEach((v) {
        howToPays!.add(HowToPays.fromJson(v));
      });
    }
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
    if (mediaPaymentMethod != null) {
      data['media_payment_method'] = mediaPaymentMethod!.toJson();
    }
    if (howToPays != null) {
      data['how_to_pays'] = howToPays!.map((v) => v.toJson()).toList();
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

class HowToPays {
  int? id;
  int? paymentMethodId;
  String? name;
  String? steps;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  HowToPays(
      {this.id,
      this.paymentMethodId,
      this.name,
      this.steps,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  HowToPays.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    paymentMethodId = json['payment_method_id'];
    name = json['name'];
    steps = json['steps'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['payment_method_id'] = paymentMethodId;
    data['name'] = name;
    data['steps'] = steps;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
