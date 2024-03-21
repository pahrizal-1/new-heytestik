class PaymentMethodModel {
  bool? success;
  String? message;
  List<Data>? data;

  PaymentMethodModel({this.success, this.message, this.data});

  PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? name;
  String? method;
  String? paymentGateway;
  String? type;
  String? channelCode;
  String? transactionFeeType;
  double? transactionFeePercentage;
  double? transactionFeeFixAmount;
  String? accountNumber;
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
  List<HowToPays>? howToPays;

  Data(
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
      this.mediaPaymentMethod,
      this.howToPays});

  Data.fromJson(Map<String, dynamic> json) {
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
    if (json['how_to_pays'] != null) {
      howToPays = <HowToPays>[];
      json['how_to_pays'].forEach((v) {
        howToPays!.add(HowToPays.fromJson(v));
      });
    }
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
    if (this.howToPays != null) {
      data['how_to_pays'] = this.howToPays!.map((v) => v.toJson()).toList();
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
    data['id'] = this.id;
    data['payment_method_id'] = this.paymentMethodId;
    data['name'] = this.name;
    data['steps'] = this.steps;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    return data;
  }
}
