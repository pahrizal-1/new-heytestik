class ClinicModel {
  bool? success;
  String? message;
  List<ClinicDataModel>? data;
  Meta? meta;

  ClinicModel({
    this.success,
    this.message,
    this.data,
  });

  ClinicModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null
        ? (json['data']['data'] as List)
            .map((e) => ClinicDataModel.fromJson(e))
            .toList()
        : null;
    meta = Meta.fromJson(json['data']['meta']);
  }
}

class ClinicDataModel {
  final int id;
  final String name;
  final double? rating;
  final String distance;
  final int price;
  final String logo;
  final String city;

  const ClinicDataModel({
    required this.id,
    required this.name,
    required this.rating,
    required this.distance,
    required this.price,
    required this.logo,
    required this.city,
  });

  factory ClinicDataModel.fromJson(Map<String, dynamic> json) {
    return ClinicDataModel(
      id: json['id'],
      name: json['name'],
      rating: double.parse(json['rating'].toString()),
      distance: json['distance'],
      price: int.parse(json['avg_price'].toString()),
      logo: json['media_clinic_logo']['media']['path'],
      city: json['city']['name'],
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

  Meta({
    this.page,
    this.take,
    this.itemCount,
    this.pageCount,
    this.hasPreviousPage,
    this.hasNextPage,
  });

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
