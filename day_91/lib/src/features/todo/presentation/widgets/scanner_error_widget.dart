import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../constants/colors.dart';

class ScannerErrorWidget extends StatelessWidget {
  final MobileScannerException error;
  const ScannerErrorWidget({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    String errorMessage;

    switch (error.errorCode) {
      case MobileScannerErrorCode.controllerUninitialized:
        errorMessage = 'Controller not ready.';
      case MobileScannerErrorCode.permissionDenied:
        errorMessage = 'Permission denied';
      case MobileScannerErrorCode.unsupported:
        errorMessage = 'Scanning is unsupported on this device';
      default:
        errorMessage = 'Generic Error';
        break;
    }

    return ColoredBox(
      color: kBlackColor,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Icon(
                Icons.error,
                color: kWhiteColor,
              ),
            ),
            Text(
              errorMessage,
              style: const TextStyle(
                color: kWhiteColor,
              ),
            ),
            Text(
              error.errorDetails?.message ?? '',
              style: const TextStyle(
                color: kWhiteColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
