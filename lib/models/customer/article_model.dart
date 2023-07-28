class ArticleModel {
  int? statusCode;
  String? statusMessage;
  int? totalrecord;
  int? itemPerPage;
  int? halaman;
  int? jumlahHalaman;
  List<Record>? record;

  ArticleModel(
      {this.statusCode,
      this.statusMessage,
      this.totalrecord,
      this.itemPerPage,
      this.halaman,
      this.jumlahHalaman,
      this.record});

  ArticleModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    statusMessage = json['status_message'];
    totalrecord = json['totalrecord'];
    itemPerPage = json['item_per_page'];
    halaman = json['halaman'];
    jumlahHalaman = json['jumlah_halaman'];
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
    data['item_per_page'] = itemPerPage;
    data['halaman'] = halaman;
    data['jumlah_halaman'] = jumlahHalaman;
    if (record != null) {
      data['record'] = record!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Record {
  String? id;
  String? newscategoryId;
  String? newsDate;
  String? title;
  String? seoTitle;
  String? author;
  String? description;
  String? image;
  String? thumb;
  String? imageLink;
  String? thumbLink;
  String? link;
  List<Tag>? tag;

  Record(
      {this.id,
      this.newscategoryId,
      this.newsDate,
      this.title,
      this.seoTitle,
      this.author,
      this.description,
      this.image,
      this.thumb,
      this.imageLink,
      this.thumbLink,
      this.link,
      this.tag});

  Record.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    newscategoryId = json['newscategory_id'];
    newsDate = json['news_date'];
    title = json['title'];
    seoTitle = json['seo_title'];
    author = json['author'];
    description = json['description'];
    image = json['image'];
    thumb = json['thumb'];
    imageLink = json['image_link'];
    thumbLink = json['thumb_link'];
    link = json['link'];
    if (json['tag'] != null) {
      tag = <Tag>[];
      json['tag'].forEach((v) {
        tag!.add(Tag.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['newscategory_id'] = newscategoryId;
    data['news_date'] = newsDate;
    data['title'] = title;
    data['seo_title'] = seoTitle;
    data['author'] = author;
    data['description'] = description;
    data['image'] = image;
    data['thumb'] = thumb;
    data['image_link'] = imageLink;
    data['thumb_link'] = thumbLink;
    data['link'] = link;
    if (tag != null) {
      data['tag'] = tag!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tag {
  String? id;
  String? tagName;
  String? seoTag;

  Tag({this.id, this.tagName, this.seoTag});

  Tag.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tagName = json['tag_name'];
    seoTag = json['seo_tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['tag_name'] = tagName;
    data['seo_tag'] = seoTag;
    return data;
  }
}
