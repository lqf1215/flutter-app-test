import 'dart:async';
import 'dart:io';

import 'package:app_test/utils/app_exceptions.dart';
import 'package:app_test/utils/global_url.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect{
  static const int timeOutSeconds = 1 * 60;
  Future<dynamic> getRequest(String endPoint,
      {Map<String, String>? queryParams}) async {
    Response response;
    try {
      String baseUrl = GlobalUrl.listBaseApiUrl;
      response = await get(baseUrl + endPoint)
          .timeout(const Duration(seconds: timeOutSeconds));
    } on TimeoutException catch (_) {
      throw FetchDataException(
        "something_went_wrong".tr,
      );
    } on SocketException catch (_) {
      throw FetchDataException("no_internet".tr);
    } on UnauthorisedException catch (_) {
      throw UnauthorisedException("unauthorized".tr);
    } catch (e) {
      if (kDebugMode) {
        print("exception: $e");
      }
      throw FetchDataException(
        "something_went_wrong".tr,
      );
    }
    return returnListResponse(response);
  }
}

dynamic returnListResponse(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
    case 202:
    case 401:
    case 404:
      return response.body;
    case 500:
      throw FetchDataException(
          'DATA SERVER CAN’T BE REACHED, PLEASE TRY AGAIN SHORTLY');
    default:
      throw FetchDataException(
          'DATA SERVER CAN’T BE REACHED, PLEASE TRY AGAIN SHORTLY');
  }
}