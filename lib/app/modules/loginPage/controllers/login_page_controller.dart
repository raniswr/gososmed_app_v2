import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gososmed_app/app/data/providers/open_api_providers.dart';
import 'package:gososmed_app/app/routes/app_pages.dart';
import 'package:gososmed_app/utils/storage_names.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPageController extends GetxController {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();
  final formKeyRegist = GlobalKey<FormState>();
  TextEditingController usernameRegister = TextEditingController();
  TextEditingController emailRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  bool isPasswordCorrect = false;

  checkPassword(String value) {
    if (value.length <= 6) {
      isPasswordCorrect = false;
    } else {
      isPasswordCorrect = true;
    }
    update();
  }

  //TODO: Implement RegisterPageController
  register(context) async {
    if (formKeyRegist.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      var register = await OpenAPIProviders.apiRegister(username: usernameRegister.text, email: emailRegister.text, password: passwordRegister.text);
      if (register != null) {
        Get.toNamed(Routes.INTEREST_PAGE);
      }
    }
  }

  @override
  void onReady() async {
    super.onReady();
  }

  login(context) async {
    if (formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );

      var login = await OpenAPIProviders.apiLogin(username: usernameLogin.text, password: passwordLogin.text);

      if (login != null) {
        var sharePreference = await SharedPreferences.getInstance();
        await sharePreference.setString(StorageNames.token, login.jwt ?? "");
        Get.toNamed(Routes.INTEREST_PAGE);
      }
    }
  }

  logout() async {
    var sharePreference = await SharedPreferences.getInstance();
    await sharePreference.clear();
    Get.offAndToNamed(Routes.LOGIN_PAGE);
  }
}
