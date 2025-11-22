// import 'package:flutter/material.dart';
// import 'package:mobile_scanner/mobile_scanner.dart';
//
// class ScanCodeScreen extends StatefulWidget {
//   const ScanCodeScreen({super.key});
//
//   @override
//   State<ScanCodeScreen> createState() => _ScanCodeScreenState();
// }
//
// class _ScanCodeScreenState extends State<ScanCodeScreen> {
//   Barcode? _barcode;
//
//   Widget _barcodePreview(Barcode? value) {
//     if (value == null) {
//       return const Text(
//         'الرجاء مسح الموقف الخاص بك',
//         overflow: TextOverflow.fade,
//         style: TextStyle(color: Colors.white),
//       );
//     }
//
//     return Text(
//       value.displayValue ?? 'لا يةجد بيانات للعرض',
//       overflow: TextOverflow.fade,
//       style: const TextStyle(color: Colors.white),
//     );
//   }
//
//   void _handleBarcode(BarcodeCapture barcodes) {
//     if (mounted) {
//       setState(() {
//         _barcode = barcodes.barcodes.firstOrNull;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('ماسح المواقف')),
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           MobileScanner(onDetect: _handleBarcode),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               height: 100,
//               color: const Color.fromRGBO(0, 0, 0, 0.4),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Expanded(child: Center(child: _barcodePreview(_barcode))),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
