class UserLocationModel {
  String? message;
  int? statusCode;
  Body? body;

  UserLocationModel({
    this.message,
    this.body,
  });

  factory UserLocationModel.fromJson(Map<String, dynamic> json) =>
      UserLocationModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  String? location;

  Body({
    this.location,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        location: json["location"],
      );

  Map<String, dynamic> toJson() => {
        "location": location,
      };
}
