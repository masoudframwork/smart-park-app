import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart/core/theme/app_color.dart';
import '../../../../../../../core/widgets/custom_button.dart';
import '../../../../../../../core/widgets/custome_text_field_widget.dart';
import '../../../../../../../generated/l10n.dart';

class TextFieldAndButtonsWidget extends StatelessWidget {
  const TextFieldAndButtonsWidget({
    super.key,
    required this.formKey,
    required this.phoneController,
    required this.onPhoneChanged,
    required this.phoneValidator,
    this.onSendCode,
    this.onLoginWithNafath,
    this.isLoading = false,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phoneController;

  final ValueChanged<String> onPhoneChanged;
  final String? Function(String?) phoneValidator;

  final VoidCallback? onSendCode;
  final VoidCallback? onLoginWithNafath;

  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 16.h,
        children: [
          CustomTextFormField(
            width: 360.w,
            controller: phoneController,
            borderRadius: 10.r,
            hintText: S.of(context).phone_number,
            textInputType: TextInputType.phone,
            hintStyle: const TextStyle(color: AppColor.greyBorderColor),
            onChanged: onPhoneChanged,
            validator: phoneValidator,

          ),

          CustomButtonWidget(
            text: isLoading ? S.of(context).sending : S.of(context).send_code,
            borderRadius: 10.r,
            onPressed: isLoading ? null : () => onSendCode?.call(),
          ),
        ],
      ),
    );
  }
}

