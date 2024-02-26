class CustomerReviewProfile {
  final int id;
  final String transactionType;
  final String createdAt;
  final String review;
  final double averageRating;
  final String productName;
  final String productDescription;

  const CustomerReviewProfile({
    required this.id,
    required this.transactionType,
    required this.createdAt,
    required this.review,
    required this.averageRating,
    required this.productName,
    required this.productDescription,
  });

  factory CustomerReviewProfile.fromJson(Map<String, dynamic> json) {
    String review = "";
    double rating = 0.0;
    String productName = "";
    String productDescription = "";

    if (json['transaction_type'].toString().toUpperCase() == "TREATMENT") {
      review = json['detail']['treatment_review']['review'];
      rating = json['detail']['treatment_review']['avg_rating'];
      productName = json['detail']['treatment']['name'];
      productDescription = json['detail']['treatment']['description'];
    }

    if (json['transaction_type'].toString().toUpperCase() == "CONSULTATION") {
      review = json['detail']['consultation_review']['review'];
      rating = json['detail']['consultation_review']['avg_rating'];
      productName = json['detail']['consultation']['doctor']['fullname'];
      productDescription = json['detail']['consultation']['medical_history']['interest_condition']['name'];
    }

    return CustomerReviewProfile(
      id: json['id'],
      transactionType: json['transaction_type'],
      createdAt: json['created_at'],
      review: review,
      averageRating: rating,
      productName: productName,
      productDescription: productDescription,
    );
  }
}
