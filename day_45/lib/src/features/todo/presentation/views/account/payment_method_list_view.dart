import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/models/payment_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../../view_model/payment_view_model.dart';
import '../../widgets/payment_method_row.dart';
import 'add_payment_method_view.dart';

class PaymentMethodListView extends StatefulWidget {
  final Function(PaymentModel pObj)? didSelect;

  const PaymentMethodListView({super.key, this.didSelect});

  @override
  State<PaymentMethodListView> createState() => _PaymentMethodListViewState();
}

class _PaymentMethodListViewState extends State<PaymentMethodListView> {
  final payVM = Get.put(PaymentViewModel());

  @override
  void dispose() {
    Get.delete<PaymentViewModel>();
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
            "Payment Methods",
            style: TextStyle(
                color: TColor.primaryText,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () async {
                  payVM.clearAll();

                  await Get.to(() => const AddPaymentMethodView());
                  payVM.serviceCallList();
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
        () => ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            itemBuilder: (context, index) {
              var pObj = payVM.listArr[index];
              return PaymentMethodRow(
                pObj: pObj,
                onTap: () {
                  if (widget.didSelect != null) {
                    widget.didSelect!(pObj);
                    Get.back();
                  }
                },
                didUpdateDone: () {
                  payVM.serviceCallList();
                },
              );
            },
            itemCount: payVM.listArr.length),
      ),
    );
  }
}
