import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/address_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../../view_model/address_view_model.dart';
import '../../widgets/address_row.dart';
import 'add_addressview.dart';

class AddressListView extends StatefulWidget {
  final Function(AddressModel aObj)? didSelect;

  const AddressListView({
    super.key,
    this.didSelect,
  });

  @override
  State<AddressListView> createState() => _AddressListViewState();
}

class _AddressListViewState extends State<AddressListView> {
  final addressVM = Get.put(AddressViewModel());

  @override
  void dispose() {
    Get.delete<AddressViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Image.asset(
                "assets/img/back.png",
                width: 20,
                height: 20,
              )),
          centerTitle: true,
          title: Text(
            "Delivery Address",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  addressVM.clearAll();

                  await Get.to(() => const AddAddressView(
                        isEdit: false,
                      ));
                  addressVM.serviceCallList();
                },
                icon: Image.asset(
                  "assets/img/add.png",
                  width: 20,
                  height: 20,
                  color: TColor.primaryText,
                )),
          ]),
      backgroundColor: Colors.white,
      body: Obx(
        () => ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var aObj = addressVM.listArr[index];
              return AddressRow(
                aObj: aObj,
                onTap: () {
                  if (widget.didSelect != null) {
                    widget.didSelect!(aObj);
                    Get.back();
                  }
                },
                didUpdateDone: () {
                  addressVM.serviceCallList();
                },
              );
            },
            separatorBuilder: (context, index) =>
                const Divider(color: Colors.black12, height: 1),
            itemCount: addressVM.listArr.length),
      ),
    );
  }
}
