class MedicineModel {
  final int id;
  final String name;
  final String type;
  final String category;
  final String display;
  final int price;
  final int order;
  final int productStock;
  final String packaging;
  final double rating;
  final List<String> media;
  final String form;
  final String BPOM;
  final String manufacture;
  final String description;
  final String indication;
  final String composition;
  final String doses;
  final String attention;
  final String contradiction;

  const MedicineModel({
    required this.id,
    required this.name,
    required this.type,
    required this.category,
    required this.display,
    required this.price,
    required this.order,
    required this.productStock,
    required this.packaging,
    required this.rating,
    required this.media,
    required this.form,
    required this.BPOM,
    required this.manufacture,
    required this.description,
    required this.indication,
    required this.composition,
    required this.doses,
    required this.attention,
    required this.contradiction,
  });

  factory MedicineModel.fromJson(Map<String, dynamic> json) {
    return MedicineModel(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      category: json['category'],
      display: json['display'],
      price: json['price'],
      order: json['min_order'],
      productStock: json['product_stock'],
      packaging: json['drug_detail']['specification_packaging'],
      rating: double.parse(json['rating'].toString()),
      media: (json['media_products'] as List)
          .map((document) => document['media']['path'].toString())
          .toList(),
      form: json['drug_detail']['specification_form'],
      BPOM: json['drug_detail']['specification_bpom'],
      manufacture: json['drug_detail']['manufacture'],
      description: json['drug_detail']['description'],
      indication: json['drug_detail']['indication'],
      composition: json['drug_detail']['specification_ingredients'],
      doses: json['drug_detail']['specification_dose'],
      attention: json['drug_detail']['specification_special_attention'],
      contradiction: json['drug_detail']['contradiction'],
    );
  }
}
