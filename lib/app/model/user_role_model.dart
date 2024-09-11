class UserRoleModel {
  String? message;
  int? statusCode;
  Body? body;

  UserRoleModel({
    this.message,
    this.body,
  });

  factory UserRoleModel.fromJson(Map<String, dynamic> json) => UserRoleModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  String? role;

  Body({
    this.role,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        role: json["user_role"],
      );

  Map<String, dynamic> toJson() => {
        "user_role": role,
      };
}
