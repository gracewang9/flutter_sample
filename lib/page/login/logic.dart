import 'package:get/get.dart';

import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  @override
  bool get initialized => state.name.isNotEmpty || state.pwd.isNotEmpty;

}
