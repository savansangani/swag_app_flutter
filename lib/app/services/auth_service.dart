import 'package:google_sign_in/google_sign_in.dart';

import 'shared_preferences.dart';

class AuthService {
  static Future<GoogleSignInAccount> signInWithGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );

      var account = await googleSignIn.signIn();
      if (account == null) {
        throw Exception('Google sign in failed');
      }

      return account;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<bool> isAuthenticated(String token) async {
    var token = await SharedPreferencesService().getToken();
    if (token != null) {
      return true;
    }
    return false;
  }

  static Future<void> setAuthenticated(String token) async {
    await SharedPreferencesService().setToken(token);
  }

  static Future<String?> getToken() async {
    return await SharedPreferencesService().getToken();
  }

  static Future<void> logOut() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: [
          'email',
        ],
      );
      await googleSignIn.signOut();

      await SharedPreferencesService().deleteAll();
    } catch (e) {
      // print(e);
    }
  }
}
