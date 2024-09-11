import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:swag_app_flutter/app/model/body_measurement_model.dart';
import 'package:swag_app_flutter/app/model/login_model.dart';
import 'package:swag_app_flutter/app/model/signup_model.dart';
import 'package:swag_app_flutter/app/model/user_income_model.dart';
import 'package:swag_app_flutter/app/model/user_location_model.dart';
import 'package:swag_app_flutter/app/model/user_personal_model.dart';
import 'package:swag_app_flutter/app/model/user_role_model.dart';
import 'package:swag_app_flutter/app/services/network_services.dart';
import 'package:swag_app_flutter/app/services/shared_preferences.dart';
import 'package:swag_app_flutter/app/views/auth_screen/login_view.dart';

class ApiService {
  static final http.Client _client = http.Client();
  static final Map<String, String> _headers = {
    'Accept': 'application/json',
    'Content-type': 'application/json',
  };

  static Future<bool> generateToken() async {
    try {
      final response = await _client.post(
        NetworkService.generateToken,
        headers: _headers,
        body: jsonEncode({
          'email': await SharedPreferencesService().getEmail(),
          'token': await SharedPreferencesService().getRefreshToken(),
        }),
      );
      LogInModel logInModel = LogInModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 200) {
        SharedPreferencesService()
            .setToken(logInModel.body!.tokens!.accessToken ?? '');
        return true;
      } else {
        SharedPreferencesService().deleteAll();
        Get.offAll(LogInView());
        return false;
      }
    } catch (e) {
      SharedPreferencesService().deleteAll();
      Get.offAll(LogInView());
      return false;
    }
  }

  // Register
  static Future<SignUpModel> register({
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await _client.post(
        NetworkService.register,
        headers: _headers,
        body: jsonEncode({
          'email': email,
          'password': password,
          'confirm_password': confirmPassword,
        }),
      );
      SignUpModel signUpModel = SignUpModel.fromJson(jsonDecode(response.body));
      signUpModel.statusCode = response.statusCode;
      return signUpModel;
    } catch (e) {
      return SignUpModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // LogIn
  static Future<LogInModel> socialLogIn({
    required String idtoken,
    required String provider,
  }) async {
    try {
      final response = await _client.post(
        NetworkService.socialLogIn,
        headers: _headers,
        body: jsonEncode({
          'id_token': idtoken,
          'provider': provider,
        }),
      );
      LogInModel logInModel = LogInModel.fromJson(jsonDecode(response.body));
      logInModel.statusCode = response.statusCode;
      return logInModel;
    } catch (e) {
      return LogInModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  static Future<LogInModel> logIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        NetworkService.logIn,
        headers: _headers,
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
      );
      LogInModel logInModel = LogInModel.fromJson(jsonDecode(response.body));
      logInModel.statusCode = response.statusCode;
      return logInModel;
    } catch (e) {
      return LogInModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Reset-password
  static Future<LogInModel> resetPassword({
    required String email,
  }) async {
    try {
      final response = await _client.post(
        NetworkService.resetPassword,
        headers: _headers,
        body: jsonEncode({
          'email': email,
        }),
      );
      LogInModel logInModel = LogInModel.fromJson(jsonDecode(response.body));
      logInModel.statusCode = response.statusCode;
      return logInModel;
    } catch (e) {
      return LogInModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Feedback
  static Future<LogInModel> feedback({
    required String feedbackText,
    File? image,
  }) async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final request = http.MultipartRequest('POST', NetworkService.feedback);
      request.headers.addAll(_headers);
      request.fields['feedback'] = feedbackText;

      if (image != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'image',
            image.readAsBytesSync(),
            filename: image.path,
          ),
        );
      }

      final response = await request.send();

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return feedback(feedbackText: feedbackText, image: image);
        }
      }
      final responseBody = await response.stream.bytesToString();
      LogInModel logInModel = LogInModel.fromJson(jsonDecode(responseBody));
      logInModel.statusCode = response.statusCode;
      return logInModel;
    } catch (e) {
      return LogInModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Set User Personal
  static Future<UserRoleModel> setUserPersonal({
    required String name,
    required String email,
    required String gender,
    File? avtar,
  }) async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final request =
          http.MultipartRequest('POST', NetworkService.userPersonal);
      request.headers.addAll(_headers);
      request.fields['name'] = name;
      request.fields['email'] = email;
      request.fields['gender'] = gender;

      if (avtar != null) {
        request.files.add(
          http.MultipartFile.fromBytes(
            'avatar',
            avtar.readAsBytesSync(),
            filename: avtar.path,
          ),
        );
      }

      final response = await request.send();

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return setUserPersonal(name: name, email: email, gender: gender);
        }
      }
      final responseBody = await response.stream.bytesToString();
      UserRoleModel userRoleModel =
          UserRoleModel.fromJson(jsonDecode(responseBody));
      userRoleModel.statusCode = response.statusCode;
      return userRoleModel;
    } catch (e) {
      return UserRoleModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Get User Role
  static Future<UserRoleModel> getUserRole() async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response =
          await _client.get(NetworkService.userRole, headers: _headers);
      UserRoleModel userRoleModel =
          UserRoleModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return getUserRole();
        }
      }

      userRoleModel.statusCode = response.statusCode;
      return userRoleModel;
    } catch (e) {
      return UserRoleModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Set User Role
  static Future<UserRoleModel> setUserRole({
    required String role,
  }) async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response = await _client.post(
        NetworkService.userRole,
        headers: _headers,
        body: jsonEncode({
          'role': role,
        }),
      );
      UserRoleModel userRoleModel =
          UserRoleModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 401) {
        if (await generateToken()) {
          return setUserRole(role: role);
        }
      }
      userRoleModel.statusCode = response.statusCode;
      return userRoleModel;
    } catch (e) {
      return UserRoleModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Get User Personal
  static Future<UserPesonalModel> getUserPersonal() async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response =
          await _client.get(NetworkService.userPersonal, headers: _headers);
      UserPesonalModel userPesonalModel =
          UserPesonalModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return getUserPersonal();
        }
      }

      userPesonalModel.statusCode = response.statusCode;
      return userPesonalModel;
    } catch (e) {
      return UserPesonalModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Get User Income
  static Future<UserIncomeModel> getUserIncome() async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response =
          await _client.get(NetworkService.userIncome, headers: _headers);
      UserIncomeModel userIncomeModel =
          UserIncomeModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return getUserIncome();
        }
      }

      userIncomeModel.statusCode = response.statusCode;
      return userIncomeModel;
    } catch (e) {
      return UserIncomeModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Set User Income
  static Future<UserIncomeModel> setUserIncome({
    required String income,
  }) async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });

      final response = await _client.post(
        NetworkService.userIncome,
        headers: _headers,
        body: jsonEncode({
          'income': income,
        }),
      );
      UserIncomeModel userRoleModel =
          UserIncomeModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 401) {
        if (await generateToken()) {
          return setUserIncome(income: income);
        }
      }
      userRoleModel.statusCode = response.statusCode;
      return userRoleModel;
    } catch (e) {
      return UserIncomeModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Get User Location
  static Future<UserLocationModel> getUserLocation() async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response =
          await _client.get(NetworkService.userLocation, headers: _headers);
      UserLocationModel userLocationModel =
          UserLocationModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return getUserLocation();
        }
      }

      userLocationModel.statusCode = response.statusCode;
      return userLocationModel;
    } catch (e) {
      return UserLocationModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Set User Location
  static Future<UserLocationModel> setUserLocation({
    required String location,
  }) async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response = await _client.post(
        NetworkService.userLocation,
        headers: _headers,
        body: jsonEncode({
          'location': location,
        }),
      );
      UserLocationModel userLocationModel =
          UserLocationModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 401) {
        if (await generateToken()) {
          return setUserLocation(location: location);
        }
      }
      userLocationModel.statusCode = response.statusCode;
      return userLocationModel;
    } catch (e) {
      return UserLocationModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Get Body Measurement
  static Future<BodyMeasurementModel> getBodyMeasurement() async {
    try {
      _headers.addAll({
        'Authorization': 'Bearer ${await SharedPreferencesService().getToken()}'
      });
      final response =
          await _client.get(NetworkService.bodyMeasurement, headers: _headers);
      BodyMeasurementModel bodyMeasurementModel =
          BodyMeasurementModel.fromJson(jsonDecode(response.body));

      if (response.statusCode == 401) {
        if (await generateToken()) {
          return getBodyMeasurement();
        }
      }

      bodyMeasurementModel.statusCode = response.statusCode;
      return bodyMeasurementModel;
    } catch (e) {
      return BodyMeasurementModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }

  // Set Body Measurement
  static Future<BodyMeasurementModel> setBodyMeasurement({
    double? neckCircumference,
    double? shoulderWidth,
    double? chestCircumference,
    double? waistCircumference,
    double? sleeveLength,
    double? bicepCircumference,
    double? wristCircumference,
    double? hipCircumference,
    double? trouserWaist,
    double? inseamLength,
    double? trouserOutseam,
    double? thighCircumference,
    double? kneeCircumference,
    double? ankleCircumference,
    double? bustCircumference,
    double? armCircumference,
    double? inseam,
    double? outseam,
    double? dressLength,
    double? frontWaistLength,
    double? backWaistLength,
  }) async {
    try {
      _headers.addAll({
        'Authorization':
            'Bearer ${await SharedPreferencesService().getToken()}',
      });
      final response = await _client.post(
        NetworkService.bodyMeasurement,
        headers: _headers,
        body: jsonEncode({
          'neck_circumference': neckCircumference,
          'shoulder_width': shoulderWidth,
          'chest_circumference': chestCircumference,
          'waist_circumference': waistCircumference,
          'sleeve_length': sleeveLength,
          'bicep_circumference': bicepCircumference,
          'wrist_circumference': wristCircumference,
          'hip_circumference': hipCircumference,
          'trouser_waist': trouserWaist,
          'inseam_length': inseamLength,
          'trouser_outseam': trouserOutseam,
          'thigh_circumference': thighCircumference,
          'knee_circumference': kneeCircumference,
          'ankle_circumference': ankleCircumference,
          'bust_circumference': bustCircumference,
          'arm_circumference': armCircumference,
          'inseam': inseam,
          'outseam': outseam,
          'dress_length': dressLength,
          'front_waist_length': frontWaistLength,
          'back_waist_length': backWaistLength,
        }),
      );
      BodyMeasurementModel bodyMeasurementModel =
          BodyMeasurementModel.fromJson(jsonDecode(response.body));
      if (response.statusCode == 401) {
        if (await generateToken()) {
          return setBodyMeasurement(
            neckCircumference: neckCircumference,
            shoulderWidth: shoulderWidth,
            chestCircumference: chestCircumference,
            waistCircumference: waistCircumference,
            sleeveLength: sleeveLength,
            bicepCircumference: bicepCircumference,
            wristCircumference: wristCircumference,
            hipCircumference: hipCircumference,
            trouserWaist: trouserWaist,
            inseamLength: inseamLength,
            trouserOutseam: trouserOutseam,
            thighCircumference: thighCircumference,
            kneeCircumference: kneeCircumference,
            ankleCircumference: ankleCircumference,
            bustCircumference: bustCircumference,
            armCircumference: armCircumference,
            inseam: inseam,
            outseam: outseam,
            dressLength: dressLength,
            frontWaistLength: frontWaistLength,
            backWaistLength: backWaistLength,
          );
        }
      }
      bodyMeasurementModel.statusCode = response.statusCode;
      return bodyMeasurementModel;
    } catch (e) {
      print(e);
      return BodyMeasurementModel.fromJson(
          jsonDecode('{"message":"some technical issue please try again"}'));
    }
  }
}
