class LogInModel {
  String? message;
  int? statusCode;
  Body? body;

  LogInModel({
    this.message,
    this.statusCode,
    this.body,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  Tokens? tokens;
  User? user;

  Body({
    this.tokens,
    this.user,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        tokens: json["tokens"] == null ? null : Tokens.fromJson(json["tokens"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "tokens": tokens?.toJson(),
        "user": user?.toJson(),
      };
}

class Tokens {
  String? tokenType;
  String? accessToken;
  String? refreshToken;
  DateTime? expiresIn;

  Tokens({
    this.tokenType,
    this.accessToken,
    this.refreshToken,
    this.expiresIn,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        tokenType: json["tokenType"],
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"] == null
            ? null
            : DateTime.parse(json["expiresIn"]),
      );

  Map<String, dynamic> toJson() => {
        "tokenType": tokenType,
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn?.toIso8601String(),
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
