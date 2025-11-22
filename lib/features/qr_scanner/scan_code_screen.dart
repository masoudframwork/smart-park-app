import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  Barcode? _barcode;

  void _handleBarcode(BarcodeCapture capture) {
    if (mounted) {
      final code = capture.barcodes.firstOrNull?.displayValue;
      if (code != null) {
        Navigator.pop(context, code);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          /// CAMERA VIEW
          MobileScanner(
            onDetect: _handleBarcode,
          ),

          /// CUSTOM OVERLAY
          _ScannerOverlay(),

          /// BOTTOM LABEL
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                "الرجاء مسح رمز الموقف",
                style: TextStyle(
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
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final double boxSize = constraints.maxWidth * 0.65;

      return Stack(
        children: [
          /// DARK BACKGROUND
          ColorFiltered(
            colorFilter:
            const ColorFilter.mode(Colors.black54, BlendMode.srcOut),
            child: Stack(
              children: [
                /// Full-screen layer
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black54,
                ),

                /// Transparent cut-out (camera visible inside)
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
