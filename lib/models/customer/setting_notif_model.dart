class SettingNotifModel {
  bool? success;
  String? message;
  List<Data>? data;

  SettingNotifModel({this.success, this.message, this.data});

  SettingNotifModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? type;
  String? group;
  bool? isEnabled;

  Data({this.name, this.type, this.group, this.isEnabled});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    type = json['type'];
    group = json['group'];
    isEnabled = json['is_enabled'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = this.name;
    data['type'] = this.type;
    data['group'] = this.group;
    data['is_enabled'] = this.isEnabled;
    return data;
  }
}
