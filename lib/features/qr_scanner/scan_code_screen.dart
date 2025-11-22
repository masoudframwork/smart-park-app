// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// import '../details_reserve_parking_spot/booking_step1/presentation/BookingStep1Page.dart';
//
// class ScanCodeScreen extends StatefulWidget {
//   const ScanCodeScreen({super.key});
//
//   @override
//   State<ScanCodeScreen> createState() => _ScanCodeScreenState();
// }
//
// class _ScanCodeScreenState extends State<ScanCodeScreen> {
//   final MobileScannerController controller = MobileScannerController();
//   bool isNavigated = false;
//
//   void _handleBarcode(BarcodeCapture capture) async {
//     if (!mounted || isNavigated) return;
//
//     final code = capture.barcodes.firstOrNull?.displayValue;
//     if (code == null) return;
//
//     isNavigated = true;
//     await controller.stop();
//
//     if (!mounted) return;
//
//     /// 🔥 Navigate to BookingStep1Page
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (_) => BookingStep1Page(
//          // scannedCode: code,   // <-- your code from QR
//         ),
//       ),
//     ).then((_) {
//       /// Restart scanner when user comes back
//       isNavigated = false;
//       controller.start();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           MobileScanner(
//             controller: controller,
//             onDetect: _handleBarcode,
//           ),
//
//        //   _ScannerOverlay(),
//
//           Positioned(
//             bottom: 80,
//             left: 0,
//             right: 0,
//             child: Center(
//               child: Text(
//                 "الرجاء مسح رمز الموقف",
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 18,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
