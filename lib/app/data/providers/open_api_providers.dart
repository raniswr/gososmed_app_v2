import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:gososmed_app/app/data/models/model_comment.dart';
import 'package:gososmed_app/app/data/models/model_post.dart';
import 'package:gososmed_app/app/data/models/model_user.dart';
import 'package:gososmed_app/app/data/models/model_user_register.dart';
import 'package:gososmed_app/utils/api_interface.dart';
import 'package:gososmed_app/utils/const.dart';
import 'package:video_player/video_player.dart';

class OpenAPIProviders {
  static Future<ModelUser?> apiLogin({required String username, required String password}) async {
    try {
      var dio = ApiInterface.instance.api;
      var response = await dio.post(
        '/auth/local',
        data: {
          "identifier": username,
          "password": password,
        },
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        return ModelUser.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log('failed to apiLogin : $e');
      return null;
    }
  }

  static Future<ModelUserRegister?> apiRegister({required String username, required String email, required String password}) async {
    try {
      var dio = Dio();

      var response = await dio.post(
        '${Const.apiURL}/auth/local/register',
        data: {
          "username": username,
          "email": email,
          "password": password,
        },
      );
      log(response.statusCode.toString());

      if (response.statusCode == 200) {
        return ModelUserRegister.fromJson(response.data);
      } else {
        log(response.data['error']['message']);
        return null;
      }
    } catch (e) {
      log('failed to apiRegister : $e');
      return null;
    }
  }

  static Future<ModelPost?> getAllPost() async {
    try {
      var response = await Dio().get(
        '${Const.apiURL}/user-posts',
      );
      if (response.statusCode == 200) {
        return ModelPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log('failed to getAllPost : $e');
      return null;
    }
  }

  static Future<ModelPost?> postUser() async {
    try {
      var response = await Dio().get(
        '${Const.apiURL}/user-posts',
      );
      if (response.statusCode == 200) {
        return ModelPost.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log('failed to getAllPost : $e');
      return null;
    }
  }
}
