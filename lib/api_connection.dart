import 'dart:convert';

import 'package:dio/dio.dart';

import 'model.dart';

Future<VadiateSettingRequestModel> getHttp() async {
  try {
    Response<dynamic> response =
        await Dio().get('https://gorest.co.in/public/v1/users');
    final vadiateSettingRequestModel =
        vadiateSettingRequestModelFromJson(jsonEncode(response.data));
    return vadiateSettingRequestModel;
  } on Exception {
    throw Exception('Network error');
  }
}
