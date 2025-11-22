import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/button_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/text_field_widget.dart';
import 'package:smart/features/auth/sign_up/presentation/widget/titel_desc_widget.dart';
import '../../../../core/constants/image_string.dart';
import '../../../../core/routing/navigation_service.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_image_widget.dart';
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,

        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 31.h,
              children: [
                GestureDetector(
                  onTap: (){
                    NavigationService.go(RoutePaths.loginPage);
                  },
                  child: Container(
                    width: 34.w,
                    height: 34.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        color:AppColor.contanearGreyColor,
                        width: 1,
                      ),
                    ),
                    child:CustomImageWidget(imageUrl:
                    AppImages.arrowRightIcon,
                      width: 20.w,
                      height: 20.w,
                      isFlag: true,
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                    child: CustomImageWidget(
                      isFlag: true,
                      imageUrl: AppImages.appLogo,
                      width: 107.w,
                      height: 107.w,
                    ),
                  ),
                ),

                TitelDescrpationWidget(),

                TextFieldWidget(),

                ButtonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
