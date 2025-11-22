import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import '../details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';

class ScanCodeScreen extends StatefulWidget {
  const ScanCodeScreen({super.key});

  @override
  State<ScanCodeScreen> createState() => _ScanCodeScreenState();
}

class _ScanCodeScreenState extends State<ScanCodeScreen> {
  final MobileScannerController cameraController = MobileScannerController();

  Barcode? _barcode;
  bool _isHandled = false;

  void _handleBarcode(BarcodeCapture data) {
    if (_isHandled) return;

    final barcode = data.barcodes.firstOrNull;
    if (barcode == null) return;

    setState(() {
      _barcode = barcode;
    });

    _isHandled = true;

    Future.delayed(Duration(milliseconds: 400), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => BookingStep1Page()),
      );
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          MobileScanner(
            controller: cameraController,
            onDetect: _handleBarcode,
          ),

          // Bottom Info Box
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              height: 110,
              color: Colors.black54,
              child: Center(
                child: Text(
                  _barcode?.displayValue ?? "الرجاء مسح رمز الموقف",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

