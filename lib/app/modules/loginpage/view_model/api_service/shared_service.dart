import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:cliffix/app/modules/loginpage/models/login_response.dart';
import 'package:flutter/widgets.dart';

class SharedService {
  static Future<bool> isLoggedIn() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');
    return isKeyExist;
  }

  static Future<LoginResponse?> loginDetails() async {
    var isKeyExist =
        await APICacheManager().isAPICacheKeyExist('login_details');
    if (isKeyExist) {
      var cacheData = await APICacheManager().getCacheData('login_details');
      return loginResponseFromJson(cacheData.syncData);
    }
  }

  static Future<void> saveLoginDetails(LoginResponse loginResponse) async {
    APICacheDBModel casheDBModel = APICacheDBModel(
      key: 'login_details',
      syncData: jsonEncode(loginResponse.toJson()),
    );
    await APICacheManager().addCacheData(casheDBModel);
  }

  static Future<void> logout(context) async {
    await APICacheManager().deleteCache('login_details');
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }
}
