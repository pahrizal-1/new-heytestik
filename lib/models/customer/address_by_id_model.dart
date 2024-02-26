class AddressByIdModel {
  bool? success;
  String? message;
  Data? data;

  AddressByIdModel({this.success, this.message, this.data});

  AddressByIdModel.fromJson(Map<String, dynamic> json) {
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
  int? userId;
  String? recipientName;
  String? recipientPhone;
  String? province;
  String? city;
  String? subdistrict;
  String? village;
  String? zipCode;
  double? pinpointLatitude;
  double? pinpointLongitude;
  String? pinpointAddress;
  String? labelAddress;
  String? completeAddress;
  String? noteForCourier;
  bool? mainAddress;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Data(
      {this.id,
      this.userId,
      this.recipientName,
      this.recipientPhone,
      this.province,
      this.city,
      this.subdistrict,
      this.village,
      this.zipCode,
      this.pinpointLatitude,
      this.pinpointLongitude,
      this.pinpointAddress,
      this.labelAddress,
      this.completeAddress,
      this.noteForCourier,
      this.mainAddress,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    recipientName = json['recipient_name'];
    recipientPhone = json['recipient_phone'];
    province = json['province'];
    city = json['city'];
    subdistrict = json['subdistrict'];
    village = json['village'];
    zipCode = json['zip_code'];
    pinpointLatitude = json['pinpoint_latitude'];
    pinpointLongitude = json['pinpoint_longitude'];
    pinpointAddress = json['pinpoint_address'];
    labelAddress = json['label_address'];
    completeAddress = json['complete_address'];
    noteForCourier = json['note_for_courier'];
    mainAddress = json['main_address'];
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
    data['recipient_name'] = recipientName;
    data['recipient_phone'] = recipientPhone;
    data['province'] = province;
    data['city'] = city;
    data['subdistrict'] = subdistrict;
    data['village'] = village;
    data['zip_code'] = zipCode;
    data['pinpoint_latitude'] = pinpointLatitude;
    data['pinpoint_longitude'] = pinpointLongitude;
    data['pinpoint_address'] = pinpointAddress;
    data['label_address'] = labelAddress;
    data['complete_address'] = completeAddress;
    data['note_for_courier'] = noteForCourier;
    data['main_address'] = mainAddress;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
