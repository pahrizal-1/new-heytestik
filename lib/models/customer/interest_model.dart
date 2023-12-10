class InterestModel {
  bool? success;
  String? message;
  Data? data;

  InterestModel({this.success, this.message, this.data});

  InterestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  BeautyProfile? beautyProfile;
  List<SkinGoalsFaceCorrective>? skinGoalsFaceCorrective;
  List<SkinGoalsBodyCorrective>? skinGoalsBodyCorrective;
  List<SkinGoalsAugmentation>? skinGoalsAugmentation;
  List<SkinGoalsSexuallyAndSkinDiseases>? skinGoalsSexuallyAndSkinDiseases;
  List<SkinGoalsHistoryTreatment>? skinGoalsHistoryTreatment;
  SkinGoalsBudget? skinGoalsBudget;

  Data(
      {this.beautyProfile,
      this.skinGoalsFaceCorrective,
      this.skinGoalsBodyCorrective,
      this.skinGoalsAugmentation,
      this.skinGoalsSexuallyAndSkinDiseases,
      this.skinGoalsHistoryTreatment,
      this.skinGoalsBudget});

  Data.fromJson(Map<String, dynamic> json) {
    beautyProfile = json['beauty_profile'] != null
        ? BeautyProfile.fromJson(json['beauty_profile'])
        : null;
    if (json['skin_goals_face_corrective'] != null) {
      skinGoalsFaceCorrective = <SkinGoalsFaceCorrective>[];
      json['skin_goals_face_corrective'].forEach((v) {
        skinGoalsFaceCorrective!.add(SkinGoalsFaceCorrective.fromJson(v));
      });
    }
    if (json['skin_goals_body_corrective'] != null) {
      skinGoalsBodyCorrective = <SkinGoalsBodyCorrective>[];
      json['skin_goals_body_corrective'].forEach((v) {
        skinGoalsBodyCorrective!.add(SkinGoalsBodyCorrective.fromJson(v));
      });
    }
    if (json['skin_goals_augmentation'] != null) {
      skinGoalsAugmentation = <SkinGoalsAugmentation>[];
      json['skin_goals_augmentation'].forEach((v) {
        skinGoalsAugmentation!.add(SkinGoalsAugmentation.fromJson(v));
      });
    }
    if (json['skin_goals_sexually_and_skin_diseases'] != null) {
      skinGoalsSexuallyAndSkinDiseases = <SkinGoalsSexuallyAndSkinDiseases>[];
      json['skin_goals_sexually_and_skin_diseases'].forEach((v) {
        skinGoalsSexuallyAndSkinDiseases!
            .add(SkinGoalsSexuallyAndSkinDiseases.fromJson(v));
      });
    }
    if (json['skin_goals_history_treatment'] != null) {
      skinGoalsHistoryTreatment = <SkinGoalsHistoryTreatment>[];
      json['skin_goals_history_treatment'].forEach((v) {
        skinGoalsHistoryTreatment!.add(SkinGoalsHistoryTreatment.fromJson(v));
      });
    }
    skinGoalsBudget = json['skin_goals_budget'] != null
        ? SkinGoalsBudget.fromJson(json['skin_goals_budget'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (beautyProfile != null) {
      data['beauty_profile'] = beautyProfile!.toJson();
    }
    if (skinGoalsFaceCorrective != null) {
      data['skin_goals_face_corrective'] =
          skinGoalsFaceCorrective!.map((v) => v.toJson()).toList();
    }
    if (skinGoalsBodyCorrective != null) {
      data['skin_goals_body_corrective'] =
          skinGoalsBodyCorrective!.map((v) => v.toJson()).toList();
    }
    if (skinGoalsAugmentation != null) {
      data['skin_goals_augmentation'] =
          skinGoalsAugmentation!.map((v) => v.toJson()).toList();
    }
    if (skinGoalsSexuallyAndSkinDiseases != null) {
      data['skin_goals_sexually_and_skin_diseases'] =
          skinGoalsSexuallyAndSkinDiseases!.map((v) => v.toJson()).toList();
    }
    if (skinGoalsHistoryTreatment != null) {
      data['skin_goals_history_treatment'] =
          skinGoalsHistoryTreatment!.map((v) => v.toJson()).toList();
    }
    if (skinGoalsBudget != null) {
      data['skin_goals_budget'] = skinGoalsBudget!.toJson();
    }
    return data;
  }
}

class BeautyProfile {
  int? id;
  int? userId;
  String? skinType;
  String? skinToneColor;
  String? skinUndertoneColor;
  String? hairType;
  String? hairColor;
  bool? hijabers;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  BeautyProfile(
      {this.id,
      this.userId,
      this.skinType,
      this.skinToneColor,
      this.skinUndertoneColor,
      this.hairType,
      this.hairColor,
      this.hijabers,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  BeautyProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    skinType = json['skin_type'];
    skinToneColor = json['skin_tone_color'];
    skinUndertoneColor = json['skin_undertone_color'];
    hairType = json['hair_type'];
    hairColor = json['hair_color'];
    hijabers = json['hijabers'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['skin_type'] = skinType;
    data['skin_tone_color'] = skinToneColor;
    data['skin_undertone_color'] = skinUndertoneColor;
    data['hair_type'] = hairType;
    data['hair_color'] = hairColor;
    data['hijabers'] = hijabers;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsFaceCorrective {
  int? id;
  int? userId;
  String? nameFaceCorrective;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsFaceCorrective(
      {this.id,
      this.userId,
      this.nameFaceCorrective,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsFaceCorrective.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    nameFaceCorrective = json['name_face_corrective'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name_face_corrective'] = nameFaceCorrective;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsBodyCorrective {
  int? id;
  int? userId;
  String? nameBodyCorrective;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsBodyCorrective(
      {this.id,
      this.userId,
      this.nameBodyCorrective,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsBodyCorrective.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    nameBodyCorrective = json['name_body_corrective'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name_body_corrective'] = nameBodyCorrective;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsAugmentation {
  int? id;
  int? userId;
  String? nameAugmentation;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsAugmentation(
      {this.id,
      this.userId,
      this.nameAugmentation,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsAugmentation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    nameAugmentation = json['name_augmentation'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name_augmentation'] = nameAugmentation;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsSexuallyAndSkinDiseases {
  int? id;
  int? userId;
  String? name;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsSexuallyAndSkinDiseases(
      {this.id,
      this.userId,
      this.name,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsSexuallyAndSkinDiseases.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    name = json['name'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name'] = name;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsHistoryTreatment {
  int? id;
  int? userId;
  String? nameHistoryTreatment;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsHistoryTreatment(
      {this.id,
      this.userId,
      this.nameHistoryTreatment,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsHistoryTreatment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    nameHistoryTreatment = json['name_history_treatment'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['name_history_treatment'] = nameHistoryTreatment;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class SkinGoalsBudget {
  int? id;
  int? userId;
  String? budgetForSkincare;
  String? budgetForTreatment;
  bool? status;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  SkinGoalsBudget(
      {this.id,
      this.userId,
      this.budgetForSkincare,
      this.budgetForTreatment,
      this.status,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  SkinGoalsBudget.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['userId'];
    budgetForSkincare = json['budget_for_skincare'];
    budgetForTreatment = json['budget_for_treatment'];
    status = json['status'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userId'] = userId;
    data['budget_for_skincare'] = budgetForSkincare;
    data['budget_for_treatment'] = budgetForTreatment;
    data['status'] = status;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}
