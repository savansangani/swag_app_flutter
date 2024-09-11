class UserPesonalModel {
  String? message;
  int? statusCode;
  Body? body;

  UserPesonalModel({
    this.message,
    this.statusCode,
    this.body,
  });

  factory UserPesonalModel.fromJson(Map<String, dynamic> json) =>
      UserPesonalModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  String? avatar;
  String? name;
  String? email;
  String? gender;

  Body({
    this.avatar,
    this.name,
    this.email,
    this.gender,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        avatar: json["avatar"],
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
      );

  Map<String, dynamic> toJson() => {
        "avatar": avatar,
        "name": name,
        "email": email,
        "gender": gender,
      };
}
