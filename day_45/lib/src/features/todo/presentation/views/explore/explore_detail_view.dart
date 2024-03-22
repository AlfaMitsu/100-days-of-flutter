import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/explore_category_model.dart';
import '../../view_model/cart_view_model.dart';
import '../../view_model/explore_item_view_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../../widgets/product_cell.dart';
import '../product_details_view/product_details_view.dart';
import 'filter_view.dart';

class ExploreDetailView extends StatefulWidget {
  final ExploreCategoryModel eObj;

  const ExploreDetailView({
    super.key,
    required this.eObj,
  });

  @override
  State<ExploreDetailView> createState() => _ExploreDetailViewState();
}

class _ExploreDetailViewState extends State<ExploreDetailView> {
  late ExploreItemViewModel listVM;

  @override
  void initState() {
    super.initState();
    listVM = Get.put(ExploreItemViewModel(widget.eObj));
  }

  @override
  void dispose() {
    Get.delete<ExploreItemViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Image.asset(
              "assets/img/back.png",
              width: 20,
              height: 20,
            )),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const FilterView()));
              },
              icon: Image.asset(
                "assets/img/filter_ic.png",
                width: 20,
                height: 20,
              )),
        ],
        title: Text(
          widget.eObj.catName ?? "",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.75,
              crossAxisSpacing: 15,
              mainAxisSpacing: 15),
          itemCount: listVM.listArr.length,
          itemBuilder: ((context, index) {
            var pObj = listVM.listArr[index];
            return ProductCell(
              pObj: pObj,
              margin: 0,
              weight: double.maxFinite,
              onPressed: () async {
                await Get.to(() => ProductDetailsView(
                      pObj: pObj,
                    ));
                listVM.serviceCallList();
              },
              onCart: () {
                CartViewModel.serviceCallAddToCart(pObj.prodId ?? 0, 1, () {});
              },
            );
          }),
        ),
      ),
    );
  }
}
