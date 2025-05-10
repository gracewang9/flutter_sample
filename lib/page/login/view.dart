import 'package:flutter/material.dart';
import 'package:flutter_sample/core/network/interceptors/auth_service.dart';
import 'package:flutter_sample/routes/app_routes.dart';
import 'package:get/get.dart';

import '../../widget/checkbox/msh_checkbox.dart';
import '../../widget/checkbox/msh_checkbox_style.dart';
import '../../widget/checkbox/msh_color_config.dart';
import '../../widget/gradient_button.dart';
import 'logic.dart';
import 'state.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginLogic logic = Get.put(LoginLogic());
  final LoginState state = Get.find<LoginLogic>().state;
  final AuthService _auth = Get.find();

  void _handleLogin() {
    _auth.login();
    final fromRoute = Get.parameters['from'] ?? AppRoutes.home;
    Get.toNamed(fromRoute);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    GlobalKey _formKey = GlobalKey<FormState>();
    var _checkboxSelected = true.obs;
    var _checkSelected = true.obs;
    var textStyleColor = TextStyle(color: Colors.grey[700], fontSize: 14);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(title: Text('login'.tr)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.center,
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Image.asset(
                        'images/androidIcon.png',
                        width: 60.0,
                        height: 60.0,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hi!',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '欢迎来到懂球宝',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              SizedBox(height: 60),
              Text(
                '手机号登录',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                '未注册的手机号码将自动登录',
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),

              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('+86', style: textStyleColor),
                    SizedBox(width: 8),

                    Container(color: Colors.grey[350], height: 30, width: 1),
                    SizedBox(width: 8),
                    Expanded(
                      flex: 2,
                      child: Container(
                        child: TextField(
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: '请输入手机号码',
                            border: InputBorder.none,
                            hintStyle: textStyleColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextField(
                        obscureText: true,
                        maxLines: 1,
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                          hintText: '请输入密码',
                          border: InputBorder.none,
                          hintStyle: textStyleColor,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 40,
                        child: Center(
                          child: Text(
                            "获取验证码",
                            style: TextStyle(color: Colors.red[700]),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Center(
                child: GradientButton(
                  padding: EdgeInsets.symmetric(horizontal: 140, vertical: 12),
                  colors: [Colors.red, Colors.orange.shade700],
                  borderRadius: BorderRadius.circular(50),
                  onPressed: _handleLogin,
                  child: Text(
                    'login'.tr,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),

              Obx(
                () => Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.red,
                      checkColor: Colors.white,
                      splashRadius: 50,
                      value: _checkboxSelected.value,
                      onChanged: ((v) {
                        _checkboxSelected.value = v ?? false;
                      }),
                    ),
                    Text(
                      '我已阅读并同意懂球宝《隐私协议》《用户协议》',
                      style: TextStyle(fontSize: 10, color: Colors.black54),
                    ),
                  ],
                ),
              ),

              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MSHCheckbox(
                      value: _checkboxSelected.value,
                      style: MSHCheckboxStyle.stroke,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: Colors.blue,
                      ),
                      onChanged: (selected) {
                        _checkboxSelected.value = selected;
                      },
                    ),
                    MSHCheckbox(
                      value: _checkboxSelected.value,
                      style: MSHCheckboxStyle.fillFade,
                      onChanged: (v) {
                        _checkboxSelected.value = v;
                      }, colorConfig:  MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Color(0xFF0048FF),
                      // uncheckedColor: Color(0xFFEA0E0E),
                      disabledColor: Color(0xFF3BEC59),
                    ),
                    ),
                    // MSHCheckbox(
                    //   style: MSHCheckboxStyle.fillScaleCheck,
                    //   value: _checkboxSelected.value,
                    //   onChanged: (v) {
                    //     _checkboxSelected.value = v;
                    //   },
                    // ),
                    MSHCheckbox(
                      style: MSHCheckboxStyle.fillScaleColor,
                      value: _checkboxSelected.value,
                      colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                        checkedColor: Color(0xFF0048FF),
                        // uncheckedColor: Color(0xFFEA0E0E),
                        disabledColor: Color(0xFF3BEC59),
                      ),
                      onChanged: (v) {
                        _checkboxSelected.value = v;
                      },
                    ),
                  ],
                ),
              ),
              // Center(
              //   child: MSHCheckbox(
              //     size: 60,
              //     value: isChecked,
              //     colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
              //       checkedColor: Colors.blue,
              //     ),
              //     style: MSHCheckboxStyle.stroke,
              //     onChanged: (selected) {
              //       setState(() {
              //         isChecked = selected;
              //       });
              //     },
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
