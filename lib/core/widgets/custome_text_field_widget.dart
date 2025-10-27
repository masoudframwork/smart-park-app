// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomTextFormField extends StatelessWidget {
//   final String? label;
//   final String? hint;
//   final TextEditingController controller;
//   final TextInputType keyboardType;
//   final String? Function(String?)? validator;
//   final bool obscureText;
//   final VoidCallback? onTogglePasswordVisibility;
//   final bool readOnly;
//   final int? maxLength;
//   final int maxLines;
//   final Widget? prefixIcon;
//   final Widget? suffixIcon;
//   final TextInputAction textInputAction;
//   final Function(String)? onChanged;
//   final Function()? onTap;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextStyle? labelStyle;
//   final TextStyle? textStyle;
//   final InputBorder? enabledBorder;
//   final InputBorder? focusedBorder;
//
//   const CustomTextFormField({
//     super.key,
//     this.label,
//     this.hint,
//     required this.controller,
//     this.keyboardType = TextInputType.text,
//     this.validator,
//     this.obscureText = false,
//     this.onTogglePasswordVisibility,
//     this.readOnly = false,
//     this.maxLength,
//     this.maxLines = 1,
//     this.prefixIcon,
//     this.suffixIcon,
//     this.textInputAction = TextInputAction.next,
//     this.onChanged,
//     this.onTap,
//     this.inputFormatters,
//     this.labelStyle,
//     this.textStyle,
//     this.enabledBorder,
//     this.focusedBorder,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (label != null) ...[
//           Text(
//             label!,
//             style:
//             labelStyle ??
//                 Theme.of(
//                   context,
//                 ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
//           ),
//           SizedBox(height: 1.h),
//         ],
//
//         TextFormField(
//           controller: controller,
//           keyboardType: keyboardType,
//           obscureText: obscureText,
//           readOnly: readOnly,
//           maxLength: maxLength,
//           maxLines: maxLines,
//           textInputAction: textInputAction,
//           onChanged: onChanged,
//           onTap: onTap,
//           inputFormatters: inputFormatters,
//           style: textStyle,
//           decoration: InputDecoration(
//             hintText: hint,
//             prefixIcon: prefixIcon,
//             suffixIcon: onTogglePasswordVisibility != null
//                 ? IconButton(
//               onPressed: onTogglePasswordVisibility,
//               icon: Icon(
//                 obscureText
//                     ? Icons.visibility_off_outlined
//                     : Icons.visibility_outlined,
//               ),
//             )
//                 : suffixIcon,
//             enabledBorder: enabledBorder,
//             focusedBorder: focusedBorder,
//           ),
//           validator: validator,
//         ),
//       ],
//     );
//   }
// }
