import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/models/address_model.dart';
import '../../../domain/repositories/color_extension.dart';
import '../../view_model/address_view_model.dart';
import '../../widgets/line_text_field.dart';
import '../../widgets/round_button.dart';

class AddAddressView extends StatefulWidget {
  final AddressModel? aObj;
  final bool isEdit;

  const AddAddressView({
    super.key,
    this.aObj,
    required this.isEdit,
  });

  @override
  State<AddAddressView> createState() => _AddAddressViewState();
}

class _AddAddressViewState extends State<AddAddressView> {
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
          widget.isEdit ? "Edit Address" : "Add Address",
          style: TextStyle(
              color: TColor.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
          child: Column(
            children: [
              Column(
                children: [
                  Obx(
                    () => Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              addressVM.txtType.value = "Home";
                            },
                            child: Row(
                              children: [
                                Icon(
                                  addressVM.txtType.value == "Home"
                                      ? Icons.radio_button_checked
                                      : Icons.radio_button_off,
                                  color: TColor.primaryText,
                                ),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                      color: TColor.primaryText,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: InkWell(
                          onTap: () {
                            addressVM.txtType.value = "Office";
                          },
                          child: Row(
                            children: [
                              Icon(
                                addressVM.txtType.value == "Office"
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: TColor.primaryText,
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                "Office",
                                style: TextStyle(
                                    color: TColor.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                    title: "Name",
                    placeholder: "Enter you name",
                    controller: addressVM.txtName.value,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                    title: "Mobile",
                    placeholder: "Enter you mobile number",
                    keyboardType: TextInputType.phone,
                    controller: addressVM.txtMobile.value,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                    title: "Address Line",
                    placeholder: "Enter you address",
                    controller: addressVM.txtAddressLine.value,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: LineTextField(
                          title: "City",
                          placeholder: "Enter City",
                          controller: addressVM.txtCity.value,
                          obscureText: false,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: LineTextField(
                          title: "State",
                          placeholder: "Enter State",
                          controller: addressVM.txtState.value,
                          obscureText: false,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  LineTextField(
                    title: "Postal Code",
                    placeholder: "Enter you Postal Code",
                    controller: addressVM.txtPostalCode.value,
                    obscureText: false,
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              RoundButton(
                  title: widget.isEdit ? "Update" : "Add Address",
                  onPressed: () {
                    if (widget.isEdit) {
                      addressVM.serviceCallUpdate(widget.aObj?.addressId ?? 0,
                          () {
                        Navigator.pop(context);
                      });
                    } else {
                      addressVM.serviceCallAdd(() {
                        Navigator.pop(context);
                      });
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
