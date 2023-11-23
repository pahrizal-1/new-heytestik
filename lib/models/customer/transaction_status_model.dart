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
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  String? statusCode;
  String? transactionId;
  String? grossAmount;
  String? currency;
  String? orderId;
  String? paymentType;
  String? signatureKey;
  String? transactionStatus;
  String? fraudStatus;
  String? statusMessage;
  String? merchantId;
  String? billKey;
  String? billerCode;
  List<VaNumbers>? vaNumbers;
  List<dynamic>? paymentAmounts;
  String? transactionTime;
  String? settlementTime;
  String? expiryTime;

  Data(
      {this.statusCode,
      this.transactionId,
      this.grossAmount,
      this.currency,
      this.orderId,
      this.paymentType,
      this.signatureKey,
      this.transactionStatus,
      this.fraudStatus,
      this.statusMessage,
      this.merchantId,
      this.billKey,
      this.billerCode,
      this.vaNumbers,
      this.paymentAmounts,
      this.transactionTime,
      this.settlementTime,
      this.expiryTime});

  Data.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    transactionId = json['transaction_id'];
    grossAmount = json['gross_amount'];
    currency = json['currency'];
    orderId = json['order_id'];
    paymentType = json['payment_type'];
    signatureKey = json['signature_key'];
    transactionStatus = json['transaction_status'];
    fraudStatus = json['fraud_status'];
    statusMessage = json['status_message'];
    merchantId = json['merchant_id'];
    billKey = json['bill_key'];
    billerCode = json['biller_code'];
    if (json['va_numbers'] != null) {
      vaNumbers = <VaNumbers>[];
      json['va_numbers'].forEach((v) {
        vaNumbers!.add(VaNumbers.fromJson(v));
      });
    }
    // if (json['payment_amounts'] != null) {
    //   paymentAmounts = <Null>[];
    //   json['payment_amounts'].forEach((v) {
    //     paymentAmounts!.add(Null.fromJson(v));
    //   });
    // }
    transactionTime = json['transaction_time'];
    settlementTime = json['settlement_time'];
    expiryTime = json['expiry_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['transaction_id'] = transactionId;
    data['gross_amount'] = grossAmount;
    data['currency'] = currency;
    data['order_id'] = orderId;
    data['payment_type'] = paymentType;
    data['signature_key'] = signatureKey;
    data['transaction_status'] = transactionStatus;
    data['fraud_status'] = fraudStatus;
    data['status_message'] = statusMessage;
    data['merchant_id'] = merchantId;
    data['bill_key'] = billKey;
    data['biller_code'] = billerCode;
    if (vaNumbers != null) {
      data['va_numbers'] = vaNumbers!.map((v) => v.toJson()).toList();
    }
    // if (paymentAmounts != null) {
    //   data['payment_amounts'] = paymentAmounts!.map((v) => v.toJson()).toList();
    // }
    data['transaction_time'] = transactionTime;
    data['settlement_time'] = settlementTime;
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
