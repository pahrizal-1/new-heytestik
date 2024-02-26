class SenderModel {
  final String name;
  final String email;

  const SenderModel({
    required this.name,
    required this.email,
  });

  factory SenderModel.fromJson(Map<String, dynamic> data) {
    return SenderModel(
      name: data['fullname'],
      email: data['email'],
    );
  }
}
