class NewsCategoryModel {
  int? statusCode;
  String? statusMessage;
  int? totalrecord;
  List<Record>? record;

  NewsCategoryModel(
      {this.statusCode, this.statusMessage, this.totalrecord, this.record});

  NewsCategoryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    totalrecord = json['totalrecord'];
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['status_message'] = statusMessage;
    data['totalrecord'] = totalrecord;
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? category;
  String? seoCategory;
  String? bgImage;
  String? bgImageMobile;
  String? description;
  String? priority;
  String? link;

  Record(
      {this.id,
      this.category,
      this.seoCategory,
      this.bgImage,
      this.bgImageMobile,
      this.description,
      this.priority,
      this.link});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    category = json['category'];
    seoCategory = json['seo_category'];
    bgImage = json['bg_image'];
    bgImageMobile = json['bg_image_mobile'];
    description = json['description'];
    priority = json['priority'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category'] = category;
    data['seo_category'] = seoCategory;
    data['bg_image'] = bgImage;
    data['bg_image_mobile'] = bgImageMobile;
    data['description'] = description;
    data['priority'] = priority;
    data['link'] = link;
    return data;
  }
}
