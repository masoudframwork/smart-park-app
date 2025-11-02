import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/constants/image_string.dart';
import 'package:smart/core/routing/navigation_service.dart';
import 'package:smart/core/routing/routes.dart';
import 'package:smart/core/widgets/custom_button.dart';
import '../../../data/models/parking_location.dart';
import 'header_section.dart';
import 'parking_info_section.dart';
import 'quick_booking_section.dart';
// class ParkingDetailsSheet extends StatelessWidget {
//   final ParkingLocation parkingData;
//   final VoidCallback onClose;
//   final VoidCallback? onBookNow;
//   final VoidCallback? onDetails;
//
//   const ParkingDetailsSheet({
//     super.key,
//     required this.parkingData,
//     required this.onClose,
//     this.onBookNow,
//     this.onDetails,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 13).copyWith(bottom: 17),
//       child: SizedBox(
//         height: MediaQuery.of(context).size.height * 0.90,
//         width: MediaQuery.of(context).size.width,
//         child: Stack(children: [
//           Positioned(bottom: 0, child: _body(context)),
//           Positioned(
//             top: MediaQuery.of(context).size.height * 0.23,
//             child: SizedBox(
//               width: MediaQuery.of(context).size.width - 26,
//               child: Center(
//                 child: CircleAvatar(
//                   backgroundImage: AssetImage(AppImages.parkingDemo),
//                   backgroundColor: Colors.grey,
//                   radius: 55,
//                 ),
//               ),
//             ),
//           )
//         ]),
//       ),
//     );
//   }
//
//   Container _body(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.60,
//       width: MediaQuery.of(context).size.width - 26,
//       padding: EdgeInsets.symmetric(horizontal: 13.w),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20.r),
//       ),
//       child:Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           SizedBox(
//             height: 18.h,
//           ),
//           HeaderSection(
//             imageUrl: parkingData.imageUrl ?? "",
//             isAvailable: parkingData.isAvailable,
//           ),
//           SizedBox(
//             height: 12.h,
//           ),
//           ParkingInfoSection(parkingData: parkingData),
//           SizedBox(
//             height: 21.h,
//           ),
//           QuickBookingSection(
//             onBookNow: onBookNow,
//           ),
//           SizedBox(
//             height: 22.h,
//           ),
//           CustomButtonWidget(
//             onPressed: () {
//               NavigationService.push(RoutePaths.durationScreen,
//                   context: context);
//             },
//             text: "تفاصيل",
//           )
//         ],
//       ),
//     );
//   }
// }

class ParkingDetailsSheet extends StatelessWidget {
  final ParkingLocation parkingData;
  final VoidCallback onClose;
  final VoidCallback? onBookNow;
  final VoidCallback? onDetails;

  const ParkingDetailsSheet({
    super.key,
    required this.parkingData,
    required this.onClose,
    this.onBookNow,
    this.onDetails,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13).copyWith(bottom: 17),
      child: SizedBox(
        height: size.height * 0.90,
        width: size.width,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: _body(context, size),
            ),
            Positioned(
              top: size.height * 0.23,
              child: SizedBox(
                width: size.width - 26,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage(AppImages.parkingDemo),
                    backgroundColor: Colors.grey,
                    radius: 55,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context, Size size) {
    return Container(
      height: size.height * 0.60,
      width: size.width - 26,
      padding: EdgeInsets.symmetric(horizontal: 13.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 18.h),
              HeaderSection(
                imageUrl: parkingData.imageUrl ?? "",
                isAvailable: parkingData.isAvailable,
              ),
              SizedBox(height: 12.h),
              ParkingInfoSection(parkingData: parkingData),
              SizedBox(height: 21.h),
              QuickBookingSection(
                onBookNow: onBookNow,
              ),
              SizedBox(height: 22.h),
              CustomButtonWidget(
                onPressed: () {
                  NavigationService.push(
                    RoutePaths.durationScreen,
                    context: context,
                  );
                },
                text: "تفاصيل",
              ),
              SizedBox(height: 16.h),
            ],
          ),
        ),
      ),
    );
  }
}
