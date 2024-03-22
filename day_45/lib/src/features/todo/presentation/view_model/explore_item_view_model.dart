import 'package:get/get.dart';

import '../../../../constants/globs.dart';
import '../../domain/repositories/service_call.dart';
import '../../data/models/explore_category_model.dart';
import '../../data/models/offer_product_model.dart';
import '../../data/models/product_detail_model.dart';

class ExploreItemViewModel extends GetxController {
  final ExploreCategoryModel pObj;
  final sProductObj = ProductDetailModel().obs;
  final RxList<OfferProductModel> listArr = <OfferProductModel>[].obs;

  ExploreItemViewModel(this.pObj);

  @override
  void onInit() {
    super.onInit();

    serviceCallList();
  }

  void serviceCallList() {
    Globs.showHUD();
    ServiceCall.post({
      "cat_id": pObj.catId.toString(),
    }, SVKey.svExploreItemList, isToken: true, withSuccess: (resObj) async {
      Globs.hideHUD();

      if (resObj[KKey.status] == "1") {
        var listDataArr = (resObj[KKey.payload] as List? ?? []).map((oObj) {
          return OfferProductModel.fromJson(oObj);
        }).toList();

        listArr.value = listDataArr;
      } else {}
    }, failure: (err) async {
      Globs.hideHUD();
      Get.snackbar(Globs.appName, err.toString());
    });
  }
}
