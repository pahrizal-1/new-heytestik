class InterestConditionsModel {
  List<Data>? data;
  String? message;

  InterestConditionsModel({this.data, this.message});

  InterestConditionsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Concern? concern;
  List<InterestConditionsCharacteristics>? interestConditionsCharacteristics;
  List<InterestConditionsQuestion>? interestConditionsQuestion;
  List<MediaInterestConditionsCharacteristics>?
      mediaInterestConditionsCharacteristics;

  Data(
      {this.id,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.concern,
      this.interestConditionsCharacteristics,
      this.interestConditionsQuestion,
      this.mediaInterestConditionsCharacteristics});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    concernId = json['concern_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    concern =
        json['concern'] != null ? Concern.fromJson(json['concern']) : null;
    if (json['interest_conditions_characteristics'] != null) {
      interestConditionsCharacteristics = <InterestConditionsCharacteristics>[];
      json['interest_conditions_characteristics'].forEach((v) {
        interestConditionsCharacteristics!
            .add(InterestConditionsCharacteristics.fromJson(v));
      });
    }
    if (json['interest_conditions_question'] != null) {
      interestConditionsQuestion = <InterestConditionsQuestion>[];
      json['interest_conditions_question'].forEach((v) {
        interestConditionsQuestion!.add(InterestConditionsQuestion.fromJson(v));
      });
    }
    if (json['media_interest_conditions_characteristics'] != null) {
      mediaInterestConditionsCharacteristics =
          <MediaInterestConditionsCharacteristics>[];
      json['media_interest_conditions_characteristics'].forEach((v) {
        mediaInterestConditionsCharacteristics!
            .add(MediaInterestConditionsCharacteristics.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['concern_id'] = concernId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (concern != null) {
      data['concern'] = concern!.toJson();
    }
    if (interestConditionsCharacteristics != null) {
      data['interest_conditions_characteristics'] =
          interestConditionsCharacteristics!.map((v) => v.toJson()).toList();
    }
    if (interestConditionsQuestion != null) {
      data['interest_conditions_question'] =
          interestConditionsQuestion!.map((v) => v.toJson()).toList();
    }
    if (mediaInterestConditionsCharacteristics != null) {
      data['media_interest_conditions_characteristics'] =
          mediaInterestConditionsCharacteristics!
              .map((v) => v.toJson())
              .toList();
    }
    return data;
  }
}

class Concern {
  int? id;
  String? name;
  String? segment;
  bool? isActive;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  MediaConcern? mediaConcern;

  Concern(
      {this.id,
      this.name,
      this.segment,
      this.isActive,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.mediaConcern});

  Concern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    segment = json['segment'];
    isActive = json['is_active'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    mediaConcern = json['media_concern'] != null
        ? MediaConcern.fromJson(json['media_concern'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['segment'] = segment;
    data['is_active'] = isActive;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (mediaConcern != null) {
      data['media_concern'] = mediaConcern!.toJson();
    }
    return data;
  }
}

class MediaConcern {
  int? id;
  int? mediaId;
  int? concernId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaConcern(
      {this.id,
      this.mediaId,
      this.concernId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaConcern.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    concernId = json['concern_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['concern_id'] = concernId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}

class Media {
  int? id;
  String? filename;
  String? ext;
  int? size;
  String? mime;
  String? path;
  String? destination;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  Media(
      {this.id,
      this.filename,
      this.ext,
      this.size,
      this.mime,
      this.path,
      this.destination,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Media.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    filename = json['filename'];
    ext = json['ext'];
    size = json['size'];
    mime = json['mime'];
    path = json['path'];
    destination = json['destination'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['filename'] = filename;
    data['ext'] = ext;
    data['size'] = size;
    data['mime'] = mime;
    data['path'] = path;
    data['destination'] = destination;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    return data;
  }
}

class InterestConditionsCharacteristics {
  int? id;
  int? interestConditionsId;
  String? characteristic;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;

  InterestConditionsCharacteristics(
      {this.id,
      this.interestConditionsId,
      this.characteristic,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  InterestConditionsCharacteristics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    interestConditionsId = json['interest_conditions_id'];
    characteristic = json['characteristic'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['interest_conditions_id'] = interestConditionsId;
    data['characteristic'] = characteristic;
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
  bool? withDescription;
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
      this.withDescription,
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
    withDescription = json['with_description'];
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
    data['with_description'] = withDescription;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    data['interest_conditions_question_id'] = interestConditionsQuestionId;
    return data;
  }
}

class MediaInterestConditionsCharacteristics {
  int? id;
  int? mediaId;
  int? interestConditionsId;
  dynamic createdBy;
  dynamic updatedBy;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  Media? media;

  MediaInterestConditionsCharacteristics(
      {this.id,
      this.mediaId,
      this.interestConditionsId,
      this.createdBy,
      this.updatedBy,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.media});

  MediaInterestConditionsCharacteristics.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mediaId = json['media_id'];
    interestConditionsId = json['interest_conditions_id'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    media = json['media'] != null ? Media.fromJson(json['media']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['media_id'] = mediaId;
    data['interest_conditions_id'] = interestConditionsId;
    data['created_by'] = createdBy;
    data['updated_by'] = updatedBy;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['deleted_at'] = deletedAt;
    if (media != null) {
      data['media'] = media!.toJson();
    }
    return data;
  }
}
