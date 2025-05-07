import 'package:get/get.dart';

class AuthService extends GetxService {
  final RxBool _isLoggedIn = false.obs;
  final RxString _token = "".obs;

  String get token => _token.value;

  void setToken(String token) {
    _token.value = token;
  }

  bool get isLoggedIn => _isLoggedIn.value;

  void login() {
    _isLoggedIn.value = true;
  }

  void loginOut() {
    _isLoggedIn.value = false;
  }
}
