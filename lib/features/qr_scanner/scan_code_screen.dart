import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../generated/l10n.dart';
import '../details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  bool _isHandling = false;
  bool _cameraAllowed = false;

  @override
  void initState() {
    super.initState();
    _checkCameraPermission();
  }

  Future<void> _checkCameraPermission() async {
    final status = await Permission.camera.status;

    if (status.isGranted) {
      setState(() => _cameraAllowed = true);
      return;
    }

    final result = await Permission.camera.request();
    if (result.isGranted) {
      setState(() => _cameraAllowed = true);
    } else {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Camera permission is required to scan."),
          ),
        );
        Navigator.pop(context);
      }
    }
  }

  void _handleBarcode(BarcodeCapture capture) {
    if (_isHandling) return;

    final String? code = capture.barcodes.firstOrNull?.displayValue;
    if (code == null) return;

    _isHandling = true; // prevent double scan

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => BookingStep1Page(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraAllowed) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: CircularProgressIndicator(color: Colors.white),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// CAMERA VIEW
          MobileScanner(
            controller: MobileScannerController(
              detectionSpeed: DetectionSpeed.normal,
              facing: CameraFacing.back,
              torchEnabled: false,
            ),
            onDetect: _handleBarcode,
          ),

          /// CUSTOM OVERLAY
          const _ScannerOverlay(),

          /// TITLE
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                S.of(context).scanParkingCode,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ScannerOverlay extends StatelessWidget {
  const _ScannerOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double boxSize = constraints.maxWidth * 0.65;

      return Stack(
        children: [
          /// DARK SCREEN WITH HOLE
          ColorFiltered(
            colorFilter:
                const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
            child: Stack(
              children: [
                /// Full dark layer
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black54,
                ),

                /// Transparent cut-out
                Center(
                  child: Container(
                    width: boxSize,
                    height: boxSize,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),

          /// WHITE BORDER FRAME
          Center(
            child: Container(
              width: boxSize,
              height: boxSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.white,
                  width: 3,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
