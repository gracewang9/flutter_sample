import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService extends GetxService {
  final RxBool _isLoggedIn = false.obs;
  final RxString _token = "".obs;

  String get token => _token.value;

  void setToken(String token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _token.value = token;
    prefs.setString('token', token);
  }

  void getIsLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn.value = prefs.getBool('isLogged') ?? false;
  }

  bool get isLoggedIn => _isLoggedIn.value;

  void login() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn.value = true;
    prefs.setBool("isLogged", _isLoggedIn.value);
  }

  void loginOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _isLoggedIn.value = false;
    prefs.setBool('isLogged', false);
  }
}
