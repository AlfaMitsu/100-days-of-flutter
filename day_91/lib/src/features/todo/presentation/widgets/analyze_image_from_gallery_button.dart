import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../constants/colors.dart';

class AnalyzeImageFromGalleryButton extends StatelessWidget {
  final MobileScannerController controller;
  const AnalyzeImageFromGalleryButton({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: kWhiteColor,
      icon: const Icon(Icons.image),
      iconSize: 32,
      onPressed: () async {
        final ImagePicker picker = ImagePicker();

        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );

        if (image == null) {
          return;
        }

        final BarcodeCapture? barcodes = await controller.analyzeImage(
          image.path,
        );

        if (!context.mounted) {
          return;
        }

        final SnackBar snackbar = barcodes != null
            ? const SnackBar(
                content: Text('Barcode found!'),
                backgroundColor: kLightGreenColor,
              )
            : const SnackBar(
                content: Text('No barcode found!'),
                backgroundColor: kRedColor,
              );

        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      },
    );
  }
}
