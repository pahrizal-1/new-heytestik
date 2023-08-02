class OrderTreatmentModel {
  bool? success;
  String? message;
  Data? data;

  OrderTreatmentModel({this.success, this.message, this.data});

  OrderTreatmentModel.fromJson(Map<String, dynamic> json) {
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
  Transaction? transaction;
  Payment? payment;

  Data({this.transaction, this.payment});

  Data.fromJson(Map<String, dynamic> json) {
    transaction = json['transaction'] != null
        ? Transaction.fromJson(json['transaction'])
        : null;
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (transaction != null) {
      data['transaction'] = transaction!.toJson();
    }
    if (payment != null) {
      data['payment'] = payment!.toJson();
    }
    return data;
  }
}

class Transaction {
  String? id;
  int? userId;
  int? totalPrice;
  int? totalDiscount;
  int? totalPaid;
  int? paymentMethodId;
  String? orderId;
  String? paymentStatus;
  String? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Transaction(
      {this.id,
      this.userId,
      this.totalPrice,
      this.totalDiscount,
      this.totalPaid,
      this.paymentMethodId,
      this.orderId,
      this.paymentStatus,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    totalPrice = json['total_price'];
    totalDiscount = json['total_discount'];
    totalPaid = json['total_paid'];
    paymentMethodId = json['payment_method_id'];
    orderId = json['order_id'];
    paymentStatus = json['payment_status'];
    status = json['status'];
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
    data['total_discount'] = totalDiscount;
    data['total_paid'] = totalPaid;
    data['payment_method_id'] = paymentMethodId;
    data['order_id'] = orderId;
    data['payment_status'] = paymentStatus;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class Payment {
  String? statusCode;
  String? statusMessage;
  String? transactionId;
  String? orderId;
  String? merchantId;
  String? grossAmount;
  String? currency;
  String? paymentType;
  String? transactionTime;
  String? transactionStatus;
  String? fraudStatus;
  List<VaNumbers>? vaNumbers;
  String? expiryTime;

  Payment(
      {this.statusCode,
      this.statusMessage,
      this.transactionId,
      this.orderId,
      this.merchantId,
      this.grossAmount,
      this.currency,
      this.paymentType,
      this.transactionTime,
      this.transactionStatus,
      this.fraudStatus,
      this.vaNumbers,
      this.expiryTime});

  Payment.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    transactionId = json['transaction_id'];
    orderId = json['order_id'];
    merchantId = json['merchant_id'];
    grossAmount = json['gross_amount'];
    currency = json['currency'];
    paymentType = json['payment_type'];
    transactionTime = json['transaction_time'];
    transactionStatus = json['transaction_status'];
    fraudStatus = json['fraud_status'];
    if (json['va_numbers'] != null) {
      vaNumbers = <VaNumbers>[];
      json['va_numbers'].forEach((v) {
        vaNumbers!.add(VaNumbers.fromJson(v));
      });
    }
    expiryTime = json['expiry_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    data['transaction_id'] = transactionId;
    data['order_id'] = orderId;
    data['merchant_id'] = merchantId;
    data['gross_amount'] = grossAmount;
    data['currency'] = currency;
    data['payment_type'] = paymentType;
    data['transaction_time'] = transactionTime;
    data['transaction_status'] = transactionStatus;
    data['fraud_status'] = fraudStatus;
    if (vaNumbers != null) {
      data['va_numbers'] = vaNumbers!.map((v) => v.toJson()).toList();
    }
    data['expiry_time'] = expiryTime;
    return data;
  }
}

class VaNumbers {
  String? bank;
  String? vaNumber;

  VaNumbers({this.bank, this.vaNumber});

  VaNumbers.fromJson(Map<String, dynamic> json) {
    bank = json['bank'];
    vaNumber = json['va_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['bank'] = bank;
    data['va_number'] = vaNumber;
    return data;
  }
}
