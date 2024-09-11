class BodyMeasurementModel {
  String? message;
  int? statusCode;
  Body? body;

  BodyMeasurementModel({
    this.message,
    this.statusCode,
    this.body,
  });

  factory BodyMeasurementModel.fromJson(Map<String, dynamic> json) =>
      BodyMeasurementModel(
        message: json["message"],
        body: json["body"] == null ? null : Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "body": body?.toJson(),
      };
}

class Body {
  BodyMeasurement? bodyMeasurement;

  Body({
    this.bodyMeasurement,
  });

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        bodyMeasurement: json["body_measurement"] == null
            ? null
            : BodyMeasurement.fromJson(json["body_measurement"]),
      );

  Map<String, dynamic> toJson() => {
        "body_measurement": bodyMeasurement?.toJson(),
      };
}

class BodyMeasurement {
  String? id;
  String? user;
  DateTime? createdAt;
  DateTime? updatedAt;
  double? ankleCircumference;
  double? armCircumference;
  double? backWaistLength;
  double? bicepCircumference;
  double? bustCircumference;
  double? chestCircumference;
  double? dressLength;
  double? frontWaistLength;
  double? hipCircumference;
  double? inseam;
  double? inseamLength;
  double? kneeCircumference;
  double? neckCircumference;
  double? outseam;
  double? shoulderWidth;
  double? sleeveLength;
  double? thighCircumference;
  double? trouserOutseam;
  double? trouserWaist;
  double? waistCircumference;
  double? wristCircumference;

  BodyMeasurement({
    this.id,
    this.user,
    this.createdAt,
    this.updatedAt,
    this.ankleCircumference,
    this.armCircumference,
    this.backWaistLength,
    this.bicepCircumference,
    this.bustCircumference,
    this.chestCircumference,
    this.dressLength,
    this.frontWaistLength,
    this.hipCircumference,
    this.inseam,
    this.inseamLength,
    this.kneeCircumference,
    this.neckCircumference,
    this.outseam,
    this.shoulderWidth,
    this.sleeveLength,
    this.thighCircumference,
    this.trouserOutseam,
    this.trouserWaist,
    this.waistCircumference,
    this.wristCircumference,
  });

  factory BodyMeasurement.fromJson(Map<String, dynamic> json) =>
      BodyMeasurement(
        id: json["_id"],
        user: json["user"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        ankleCircumference: json["ankle_circumference"] == null
            ? null
            : double.parse(json["ankle_circumference"].toString()),
        armCircumference: json["arm_circumference"] == null
            ? null
            : double.parse(json["arm_circumference"].toString()),
        backWaistLength: json["back_waist_length"] == null
            ? null
            : double.parse(json["back_waist_length"].toString()),
        bicepCircumference: json["bicep_circumference"] == null
            ? null
            : double.parse(json["bicep_circumference"].toString()),
        bustCircumference: json["bust_circumference"] == null
            ? null
            : double.parse(json["bust_circumference"].toString()),
        chestCircumference: json["chest_circumference"] == null
            ? null
            : double.parse(json["chest_circumference"].toString()),
        dressLength: json["dress_length"] == null
            ? null
            : double.parse(json["dress_length"].toString()),
        frontWaistLength: json["front_waist_length"] == null
            ? null
            : double.parse(json["front_waist_length"].toString()),
        hipCircumference: json["hip_circumference"] == null
            ? null
            : double.parse(json["hip_circumference"].toString()),
        inseam: json["inseam"] == null
            ? null
            : double.parse(json["inseam"].toString()),
        inseamLength: json["inseam_length"] == null
            ? null
            : double.parse(json["inseam_length"].toString()),
        kneeCircumference: json["knee_circumference"] == null
            ? null
            : double.parse(json["knee_circumference"].toString()),
        neckCircumference: json["neck_circumference"] == null
            ? null
            : double.parse(json["neck_circumference"].toString()),
        outseam: json["outseam"] == null
            ? null
            : double.parse(json["outseam"].toString()),
        shoulderWidth: json["shoulder_width"] == null
            ? null
            : double.parse(json["shoulder_width"].toString()),
        sleeveLength: json["sleeve_length"] == null
            ? null
            : double.parse(json["sleeve_length"].toString()),
        thighCircumference: json["thigh_circumference"] == null
            ? null
            : double.parse(json["thigh_circumference"].toString()),
        trouserOutseam: json["trouser_outseam"] == null
            ? null
            : double.parse(json["trouser_outseam"].toString()),
        trouserWaist: json["trouser_waist"] == null
            ? null
            : double.parse(json["trouser_waist"].toString()),
        waistCircumference: json["waist_circumference"] == null
            ? null
            : double.parse(json["waist_circumference"].toString()),
        wristCircumference: json["wrist_circumference"] == null
            ? null
            : double.parse(json["wrist_circumference"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "user": user,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "ankle_circumference": ankleCircumference,
        "arm_circumference": armCircumference,
        "back_waist_length": backWaistLength,
        "bicep_circumference": bicepCircumference,
        "bust_circumference": bustCircumference,
        "chest_circumference": chestCircumference,
        "dress_length": dressLength,
        "front_waist_length": frontWaistLength,
        "hip_circumference": hipCircumference,
        "inseam": inseam,
        "inseam_length": inseamLength,
        "knee_circumference": kneeCircumference,
        "neck_circumference": neckCircumference,
        "outseam": outseam,
        "shoulder_width": shoulderWidth,
        "sleeve_length": sleeveLength,
        "thigh_circumference": thighCircumference,
        "trouser_outseam": trouserOutseam,
        "trouser_waist": trouserWaist,
        "waist_circumference": waistCircumference,
        "wrist_circumference": wristCircumference,
      };
}
