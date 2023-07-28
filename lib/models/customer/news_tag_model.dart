class NewsTagModel {
  List<Record>? record;
  int? totalrecord;

  NewsTagModel({this.record, this.totalrecord});

  NewsTagModel.fromJson(Map<String, dynamic> json) {
    if (json['record'] != null) {
      record = <Record>[];
      json['record'].forEach((v) {
        record!.add(Record.fromJson(v));
      });
    }
    totalrecord = json['totalrecord'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    data['totalrecord'] = totalrecord;
    return data;
  }
}

class Record {
  String? id;
  String? tag;
  String? seoTag;
  String? link;

  Record({this.id, this.tag, this.seoTag, this.link});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tag = json['tag'];
    seoTag = json['seo_tag'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag'] = tag;
    data['seo_tag'] = seoTag;
    data['link'] = link;
    return data;
  }
}
