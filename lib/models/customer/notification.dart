import 'package:heystetik_mobileapps/models/sender.dart';

class NotificationCustomerModel {
  bool? success;
  String? message;
  ResponseNotificationCustomerModel? data;

  NotificationCustomerModel({
    this.success,
    this.message,
    this.data,
  });

  NotificationCustomerModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? ResponseNotificationCustomerModel.fromJson(json['data']) : null;
  }
}

class ResponseNotificationCustomerModel {
  final List<DataNotificationCustomerModel> data;
  final Meta meta;

  const ResponseNotificationCustomerModel({
    required this.data,
    required this.meta,
  });

  factory ResponseNotificationCustomerModel.fromJson(Map<String, dynamic> json) {
    return ResponseNotificationCustomerModel(
      data: (json['data'] as List).map((e) => DataNotificationCustomerModel.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
    );
  }
}

class DataNotificationCustomerModel {
  final int id;
  final int recipientId;
  final String type;
  final String title;
  final String body;
  final Map<String, dynamic> data;
  final SenderModel sender;
  final String createdAt;

  const DataNotificationCustomerModel({
    required this.id,
    required this.recipientId,
    required this.type,
    required this.title,
    required this.body,
    required this.data,
    required this.sender,
    required this.createdAt,
  });

  factory DataNotificationCustomerModel.fromJson(Map<String, dynamic> json) {
    return DataNotificationCustomerModel(
      id: json['id'],
      recipientId: json['recipient_id'],
      type: json['type'],
      title: json['title'],
      body: json['body'],
      data: json['data'],
      sender: SenderModel.fromJson(json['sender']),
      createdAt: json['created_at'],
    );
  }
}

class Meta {
  int? page;
  int? take;
  int? itemCount;
  int? pageCount;
  bool? hasPreviousPage;
  bool? hasNextPage;

  Meta({this.page, this.take, this.itemCount, this.pageCount, this.hasPreviousPage, this.hasNextPage});

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
