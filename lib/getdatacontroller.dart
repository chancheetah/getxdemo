import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'get_data_model.dart';

class GetDataController extends GetxController {
  // @override
  // void onInit() {
  //   // TODO: implement onInit
  //   super.onInit();
  // }

  var isLoading = false.obs;
  var getDataModel = GetDataModel().obs;

  getDataFromApi() async {
    isLoading.value = true;
    try {
//      var response = await Dio().get('http://api.open-notify.org/astros.json');
      var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=us&apiKey=8e76e65f404d4ae2ae1b146dd08ee83f');
      getDataModel.value = GetDataModel.fromJson(response.data);
      if (kDebugMode) {
        print(response);
      }
      isLoading.value = false;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
