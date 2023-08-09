class UserActivity {
  final int id;
  final String transactionID;
  final String transactionType;
  final String createdAt;
  final String productName;
  final String review;
  final double rating;
  final List<String> image;

  const UserActivity({
    required this.id,
    required this.transactionID,
    required this.transactionType,
    required this.createdAt,
    required this.productName,
    required this.review,
    required this.rating,
    required this.image,
  });

  factory UserActivity.fromJson(Map<String, dynamic> json) {
    String productName = "-";
    String review = "-";
    double rating = 0.0;
    List<String> image = [];

    if (json['transaction_type'] == 'TREATMENT') {
      productName = json['detail']['treatment']['name'];
      review = json['detail']['treatment_review']['review'];
      rating = double.parse((json['detail']['treatment_review']['avg_rating'] ?? 0).toString());
      image = (json['detail']['treatment_review']['media_treatment_reviews'] as List).map((e) => e['media']['path'].toString()).toList();
    }

    return UserActivity(
      id: json['id'],
      transactionID: json['transaction_id'],
      transactionType: json['transaction_type'],
      createdAt: json['created_at'],
      productName: productName,
      review: review,
      rating: rating,
      image: image,
    );
  }
}
