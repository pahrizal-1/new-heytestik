class ReplyChatModel {
  bool? success;
  String? message;
  Data? data;

  ReplyChatModel({this.success, this.message, this.data});

  ReplyChatModel.fromJson(Map<String, dynamic> json) {
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
  List<DataDatum>? dataDatum;
  Meta? meta;

  Data({this.dataDatum, this.meta});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dataDatum = <DataDatum>[];
      json['data'].forEach((v) {
        dataDatum!.add(new DataDatum.fromJson(v));
      });
    }
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> dataDatum = new Map<String, dynamic>();
    if (this.dataDatum != null) {
      dataDatum['data'] = this.dataDatum!.map((v) => v.toJson()).toList();
    }
    if (this.meta != null) {
      dataDatum['meta'] = this.meta!.toJson();
    }
    return dataDatum;
  }
}

class DataDatum {
  int? id;
  int? doctorId;
  String? shortcut;
  String? message;
  bool? isActive;
  Null? createdBy;
  Null? updatedBy;
  String? createdAt;
  String? updatedAt;
  Null? deletedAt;
  List<Null>? mediaChatQuickReplies;

  DataDatum(
      {this.id,
      this.doctorId,
      this.shortcut,
      this.message,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaChatQuickReplies});

  DataDatum.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    doctorId = json['doctor_id'];
    shortcut = json['shortcut'];
    message = json['message'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['media_chat_quick_replies'] != null) {
      mediaChatQuickReplies = <Null>[];
      // json['media_chat_quick_replies'].forEach((v) {
      //   mediaChatQuickReplies!.add(new Null.fromJson(v));
      // });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['doctor_id'] = this.doctorId;
    data['shortcut'] = this.shortcut;
    data['message'] = this.message;
    data['is_active'] = this.isActive;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['deleted_at'] = this.deletedAt;
    if (this.mediaChatQuickReplies != null) {
      // data['media_chat_quick_replies'] =
      //     this.mediaChatQuickReplies!.map((v) => v.toJson()).toList();
    }
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