class NetworkService {
  static const String _baseUrl = 'https://swagapp.ai:8000/api';
  // static const String _baseUrl = 'http://192.168.1.3:9000/api';

  static Uri generateToken = Uri.parse('$_baseUrl//auth/token');
  static Uri register = Uri.parse('$_baseUrl/auth/register');
  static Uri logIn = Uri.parse('$_baseUrl/auth/login');
  static Uri socialLogIn = Uri.parse('$_baseUrl/auth/social/login');
  static Uri resetPassword = Uri.parse('$_baseUrl/auth/reset-password');
  static Uri feedback = Uri.parse('$_baseUrl/settings/feedback');
  static Uri userRole = Uri.parse('$_baseUrl/profile/select-role');
  static Uri userPersonal = Uri.parse('$_baseUrl/profile/personal');
  static Uri userIncome = Uri.parse('$_baseUrl/profile/income');
  static Uri userLocation = Uri.parse('$_baseUrl/profile/location');
  static Uri bodyMeasurement = Uri.parse('$_baseUrl/profile/body-measurement');
}
