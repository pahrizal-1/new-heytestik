class CompletionModel {
  bool? success;
  String? message;
  Data? data;

  CompletionModel({this.success, this.message, this.data});

  CompletionModel.fromJson(Map<String, dynamic> json) {
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
  int? percentage;
  String? title;
  String? subtitle;

  Data({this.percentage, this.title, this.subtitle});

  Data.fromJson(Map<String, dynamic> json) {
    percentage = json['percentage'];
    title = json['title'];
    subtitle = json['subtitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['percentage'] = percentage;
    data['title'] = title;
    data['subtitle'] = subtitle;
    return data;
  }
}
