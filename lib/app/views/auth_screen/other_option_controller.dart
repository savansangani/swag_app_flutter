import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:swag_app_flutter/app/services/auth_service.dart';
import 'package:swag_app_flutter/app/utils/helper.dart';
import 'package:swag_app_flutter/app/views/auth_screen/login_view.dart';
import 'package:swag_app_flutter/app/views/auth_screen/reset_password_sucess_view.dart';
import 'package:swag_app_flutter/app/views/auth_screen/signup_view.dart';
import 'package:swag_app_flutter/app/views/subscription_screen/subscription_view.dart';
import '../../services/api_services.dart';
import '../../services/shared_preferences.dart';

class OtherOptionController extends GetxController {
  final TextEditingController resetPasswordController = TextEditingController();

  goToLogInView() {
    Get.to(() => LogInView());
  }

  goToSignUpView() {
    Get.to(() => SignUpView());
  }

  goToResetSuccessView() {
    Get.to(() => const ResetPasswordSucessView());
  }

  Future<void> initiateSignInWithGoogle() async {
    GoogleSignInAccount account = await AuthService.signInWithGoogle();
    var auth = await account.authentication;

    if (auth.idToken == null) {
      print("Error: Id Token retrieval failed");
      return;
    }

    await socialLogIn(idtoken: auth.idToken!);

    // await AuthService.setAuthenticated(token);
  }

  signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    }
    // print(googleUser.);
    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential
    GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    if (googleAuth.accessToken != null) {
      // print(googleAuth.accessToken);
      // print(googleAuth.idToken);
      socialLogIn(idtoken: googleUser.email);
    }
  }

  Future<void> socialLogIn({
    required String idtoken,
  }) async {
    Helper.showLoading();
    final response = await ApiService.socialLogIn(
      idtoken: idtoken,
      provider: 'GOOGLE',
    );
    if (response.statusCode == 200) {
      Helper.hideLoading();
      var token = response.body?.tokens!.accessToken;
      var refreshToken = response.body?.tokens!.refreshToken;
      var email = response.body?.user!.email!;
      SharedPreferencesService().setToken(token ?? '');
      SharedPreferencesService().setRefreshToken(refreshToken ?? '');
      SharedPreferencesService().setEmail(email ?? '');
      Get.to(() => const SubScriptionView());
      // Get.to(() => BottomNavigationBarView());
    } else {
      Helper.hideLoading();
      Helper.showSnackBar(message: response.message!);
    }
  }

  Future<void> resetPassword({required String email}) async {
    Helper.showLoading();
    final response = await ApiService.resetPassword(
        email: resetPasswordController.value.text);
    if (response.statusCode == 200) {
      Helper.hideLoading();
      print(response.message);
      goToResetSuccessView();
    } else {
      Helper.hideLoading();
      Helper.showSnackBar(message: response.message!);
    }
  }
}
