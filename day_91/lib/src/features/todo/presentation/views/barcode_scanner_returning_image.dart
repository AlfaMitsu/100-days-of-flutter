import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../../../constants/colors.dart';
import '../widgets/scanned_barcode_label.dart';
import '../widgets/scanner_error_widget.dart';
import '../widgets/start_stop_mobile_scanner_button.dart';
import '../widgets/switch_camera_button.dart';
import '../widgets/toggle_flashlight_button.dart';

class BarcodeScannerReturningImage extends StatefulWidget {
  const BarcodeScannerReturningImage({super.key});

  @override
  State<BarcodeScannerReturningImage> createState() =>
      _BarcodeScannerReturningImageState();
}

class _BarcodeScannerReturningImageState
    extends State<BarcodeScannerReturningImage> {
  final MobileScannerController controller = MobileScannerController(
    torchEnabled: true,
    // formats: [BarcodeFormat.qrCode]
    // facing: CameraFacing.front,
    // detectionSpeed: DetectionSpeed.normal
    // detectionTimeoutMs: 1000,
    returnImage: true,
  );

  @override
  void initState() {
    super.initState();
    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Returning image')),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: StreamBuilder<BarcodeCapture>(
                stream: controller.barcodes,
                builder: (context, snapshot) {
                  final barcode = snapshot.data;
                  if (barcode == null) {
                    return const Center(
                      child: Text(
                        'Your scanned barcode will appear here!',
                      ),
                    );
                  }
                  final barcodeImage = barcode.image;
                  if (barcodeImage == null) {
                    return const Center(
                      child: Text('No image for this barcode.'),
                    );
                  }
                  return Image.memory(
                    barcodeImage,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Text('Could not decode image bytes. $error'),
                      );
                    },
                    frameBuilder: (
                      BuildContext context,
                      Widget child,
                      int? frame,
                      bool? wasSynchronouslyLoaded,
                    ) {
                      if (wasSynchronouslyLoaded == true || frame != null) {
                        return Transform.rotate(
                          angle: 90 * pi / 180,
                          child: child,
                        );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  );
                },
              ),
            ),
            Expanded(
              flex: 2,
              child: ColoredBox(
                color: kGreyColor,
                child: Stack(
                  children: [
                    MobileScanner(
                      controller: controller,
                      errorBuilder: (context, error, child) {
                        return ScannerErrorWidget(error: error);
                      },
                      fit: BoxFit.contain,
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        height: 100,
                        color: kBlackColor.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ToggleFlashlightButton(controller: controller),
                            StartStopMobileScannerButton(
                              controller: controller,
                            ),
                            Expanded(
                              child: Center(
                                child: ScannedBarcodeLabel(
                                  barcodes: controller.barcodes,
                                ),
                              ),
                            ),
                            SwitchCameraButton(controller: controller),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> dispose() async {
    super.dispose();
    await controller.dispose();
  }
}
