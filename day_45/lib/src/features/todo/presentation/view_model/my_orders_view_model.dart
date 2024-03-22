import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../constants/globs.dart';
import '../../data/models/my_order_model.dart';
import '../../domain/repositories/service_call.dart';

class MyOrdersViewModel extends GetxController {
  final RxList<MyOrderModel> listArr = <MyOrderModel>[].obs;

  final isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      print("MyOrdersViewModel Init ");
    }

    serviceCallList();
  }

  //ServiceCall
  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({}, SVKey.svMyOrders, isToken: true,
        withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return MyOrderModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }
}
