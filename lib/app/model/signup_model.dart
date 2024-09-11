class SignUpModel {
  String? message;
  int? statusCode;
  Body? body;

  SignUpModel({
    this.message,
    this.statusCode,
    this.body,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  String? token;
  User? user;

  Body({
    this.token,
    this.user,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        token: json["token"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user?.toJson(),
      };
}

class User {
  String? id;
  String? email;
  String? role;

  User({
    this.id,
    this.email,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "role": role,
      };
}
