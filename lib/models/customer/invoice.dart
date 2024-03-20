class InvoiceModel {
  final Map<String, dynamic> content;

  const InvoiceModel({
    required this.content,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) {
    return InvoiceModel(
      content: json['data'],
    );
  }
}
