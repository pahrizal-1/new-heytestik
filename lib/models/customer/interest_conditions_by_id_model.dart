class InterestConditionByIdModel {
  Data? data;
  String? message;

  InterestConditionByIdModel({this.data, this.message});

  InterestConditionByIdModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? interestConditionsCategoryId;
  String? name;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Category? category;
  List<InterestConditionsQuestion>? interestConditionsQuestion;

  Data(
      {this.id,
      this.interestConditionsCategoryId,
      this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.category,
      this.interestConditionsQuestion});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestConditionsCategoryId = json['interest_conditions_category_id'];
    name = json['name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['interest_conditions_question'] != null) {
      interestConditionsQuestion = <InterestConditionsQuestion>[];
      json['interest_conditions_question'].forEach((v) {
        interestConditionsQuestion!.add(InterestConditionsQuestion.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['interest_conditions_category_id'] = interestConditionsCategoryId;
    data['name'] = name;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (interestConditionsQuestion != null) {
      data['interest_conditions_question'] =
          interestConditionsQuestion!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Category(
      {this.id,
      this.name,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class InterestConditionsQuestion {
  int? id;
  String? name;
  String? type;
  String? typeAnswer;
  int? interestConditionsId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  List<InterestConditionsAnswer>? interestConditionsAnswer;

  InterestConditionsQuestion(
      {this.id,
      this.name,
      this.type,
      this.typeAnswer,
      this.interestConditionsId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestConditionsAnswer});

  InterestConditionsQuestion.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    typeAnswer = json['type_answer'];
    interestConditionsId = json['interest_conditions_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    if (json['interest_conditions_answer'] != null) {
      interestConditionsAnswer = <InterestConditionsAnswer>[];
      json['interest_conditions_answer'].forEach((v) {
        interestConditionsAnswer!.add(InterestConditionsAnswer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['type'] = type;
    data['type_answer'] = typeAnswer;
    data['interest_conditions_id'] = interestConditionsId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (interestConditionsAnswer != null) {
      data['interest_conditions_answer'] =
          interestConditionsAnswer!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterestConditionsAnswer {
  int? id;
  String? name;
  int? position;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  int? interestConditionsQuestionId;

  InterestConditionsAnswer(
      {this.id,
      this.name,
      this.position,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.interestConditionsQuestionId});

  InterestConditionsAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    position = json['position'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    interestConditionsQuestionId = json['interest_conditions_question_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['position'] = position;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['interest_conditions_question_id'] = interestConditionsQuestionId;
    return data;
  }
}
