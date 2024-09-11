class UserIncomeModel {
  String? message;
  int? statusCode;
  Body? body;

  UserIncomeModel({
    this.message,
    this.statusCode,
    this.body,
  });

  factory UserIncomeModel.fromJson(Map<String, dynamic> json) =>
      UserIncomeModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  String? income;

  Body({
    this.income,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        income: json["income"],
      );

  Map<String, dynamic> toJson() => {
        "income": income,
      };
}
