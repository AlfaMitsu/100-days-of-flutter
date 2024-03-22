import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../constants/globs.dart';
import '../../domain/repositories/service_call.dart';
import '../../data/models/offer_product_model.dart';

class FavoriteViewModel extends GetxController {
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();

    if (kDebugMode) {
      print("FavoriteViewModel Init ");
    }

    serviceCalList();
  }

  void serviceCalList() {
    Globs.showHUD();
    ServiceCall.post(
      {},
      SVKey.svFavorite,
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();

        if (resObj[KKey.status] == "1") {
          var listDataArr = (resObj[KKey.payload] as List? ?? []).map(
            (oObj) {
              return OfferProductModel.fromJson(oObj);
            },
          ).toList();

          listArr.value = listDataArr;
        } else {}
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(
          Globs.appName,
          err.toString(),
        );
      },
    );
  }

  void serviceCallAddRemoveFavorite(int index) {
    Globs.showHUD();
    ServiceCall.post(
      {
        "prod_id": listArr[index].prodId.toString(),
      },
      SVKey.svAddRemoveFavorite,
      isToken: true,
      withSuccess: (resObj) async {
        Globs.hideHUD();

        if (resObj[KKey.status] == "1") {
          listArr.removeAt(index);
          Get.snackbar(
            Globs.appName,
            resObj[KKey.message],
          );
        } else {}
      },
      failure: (err) async {
        Globs.hideHUD();
        Get.snackbar(
          Globs.appName,
          err.toString(),
        );
      },
    );
  }
}
