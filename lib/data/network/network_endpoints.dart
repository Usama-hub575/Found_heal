class NetworkEndPoints {
  var baseUrl = "http://13.50.17.104/";
  var localHostUrl = "http://Localhost:3001/";
  final _login = "api/auth-service/login";
  final _resetPassword = "api/auth-service/reset-password";
  final _signup = "api/auth-service/signup";
  final _updateProfile = "api/user-service/update_profile";

  ///Getters

  String getLoginUserEndPoint() => '$baseUrl$_login';
  String getResetUserEndPoint() => '$baseUrl$_resetPassword';
  String getSignupUserEndPoint() => '$baseUrl$_signup';
  String getUpdateProfileUserEndPoint() => '$baseUrl$_updateProfile';
}
