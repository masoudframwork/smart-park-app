import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/features/auth/nafath/persentation/widget/text_descrpatin_widget.dart';
import 'package:smart/features/auth/nafath/persentation/widget/text_field.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/theme/app_color.dart';
import '../../../../core/widgets/custom_image_widget.dart';

class NafathPageLogin extends StatelessWidget {
  const NafathPageLogin({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.whiteBackgroundColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 31.h,
            children: [
              SizedBox(
                height: 12.h,
              ),
              Center(
                child: ClipOval(
                  child: CustomImageWidget(
                    isFlag: true,
                    imageUrl: AppImages.appLogo,
                    width: 147.w,
                    height: 147.h,
                  ),
                ),
              ),
              TextDescrpationWidget(),
              TextFieldWidgets(),
            ],
          ),
        ),
      ),
    );
  }
}
