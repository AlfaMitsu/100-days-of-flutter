import 'dart:io';

import 'package:fbroadcast/fbroadcast.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/styles.dart';
import '../../data/data_sources/arrays.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final ImagePicker picker = ImagePicker();
  XFile? image;

  @override
  void initState() {
    super.initState();
    FBroadcast.instance().register("change_mode", (value, callback) {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kBg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () async {
                        image =
                            await picker.pickImage(source: ImageSource.gallery);
                        setState(() {});
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: kPrimaryG,
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter),
                          borderRadius:
                              BorderRadius.circular(size.width * 0.20),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 6,
                              offset: Offset(
                                0,
                                4,
                              ),
                            ),
                          ],
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: kBg,
                            borderRadius:
                                BorderRadius.circular(size.width * 0.15),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(
                                  0,
                                  4,
                                ),
                              ),
                            ],
                          ),
                          child: image != null
                              ? ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.15),
                                  child: Image.file(
                                    File(image!.path),
                                    width: size.width * 0.28,
                                    height: size.width * 0.28,
                                    fit: BoxFit.cover,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.15),
                                  child: Image.asset(
                                    kImgUserPlaceholder,
                                    width: size.width * 0.28,
                                    height: size.width * 0.28,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Text(
                      'Code For Any',
                      style: kProfileViewTextStyle,
                    ),
                    Text(
                      'Premium',
                      style: kProfileViewProfileStatusTextStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    var mObj = menuArr[index] as Map? ?? {};
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 8,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(
                            mObj['image'].toString(),
                            width: 20,
                            height: 20,
                            color: kText,
                          ),
                          const SizedBox(width: 20),
                          Text(
                            mObj['name'].toString(),
                            style: kCastDetailsViewDescriptionTextStyle,
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                    height: 1,
                    color: kSubtext.withOpacity(0.2),
                  ),
                  itemCount: menuArr.length,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
