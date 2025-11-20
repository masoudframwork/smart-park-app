// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../theme/app_color.dart';
//
// Future<T?> showBlurBottomSheet<T>({
//   required BuildContext context,
//   required Widget child,
// }) {
//   return Navigator.of(context).push(
//     _BlurBottomSheetRoute<T>(
//       sheetChild: child,
//     ),
//   );
// }
//
// class _BlurBottomSheetRoute<T> extends PageRoute<T> {
//   final Widget sheetChild;
//
//   _BlurBottomSheetRoute({
//     required this.sheetChild,
//   });
//
//   @override
//   bool get opaque => false;
//   @override
//   bool get barrierDismissible => true;
//   @override
//   Duration get transitionDuration => const Duration(milliseconds: 160);
//   @override
//   Duration get reverseTransitionDuration => const Duration(milliseconds: 160);
//   @override
//   Color get barrierColor => Colors.transparent;
//   @override
//   String? get barrierLabel => 'Dismiss';
//   @override
//   bool get maintainState => true;
//
//   @override
//   Widget buildPage(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//   ) {
//     return const SizedBox.shrink();
//   }
//
//   @override
//   Widget buildTransitions(
//     BuildContext context,
//     Animation<double> animation,
//     Animation<double> secondaryAnimation,
//     Widget childFromBuildPage,
//   ) {
//     final overlayOpacity = CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeOutCubic,
//       reverseCurve: Curves.easeInCubic,
//     );
//
//     final sheetOpacity = CurvedAnimation(
//       parent: animation,
//       curve: Curves.easeOutCubic,
//       reverseCurve: Curves.easeInCubic,
//     );
//
//     final sheetSlide = Tween<Offset>(
//       begin: const Offset(0, 0.08),
//       end: Offset.zero,
//     )
//         .chain(
//           CurveTween(curve: Curves.easeOutCubic),
//         )
//         .animate(animation);
//
//     return _BlurSheetScaffold(
//       overlayOpacity: overlayOpacity,
//       sheetOpacity: sheetOpacity,
//       sheetOffset: sheetSlide,
//       onRequestClose: () {
//         navigator?.pop();
//       },
//       sheetChild: sheetChild,
//     );
//   }
// }
//
// class _BlurSheetScaffold extends StatelessWidget {
//   final Animation<double> overlayOpacity;
//   final Animation<double> sheetOpacity;
//   final Animation<Offset> sheetOffset;
//   final VoidCallback onRequestClose;
//   final Widget sheetChild;
//
//   const _BlurSheetScaffold({
//     required this.overlayOpacity,
//     required this.sheetOpacity,
//     required this.sheetOffset,
//     required this.onRequestClose,
//     required this.sheetChild,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Positioned.fill(
//           child: GestureDetector(
//             behavior: HitTestBehavior.opaque,
//             onTap: onRequestClose,
//             child: AnimatedBuilder(
//               animation: overlayOpacity,
//               builder: (context, _) {
//                 final t = overlayOpacity.value;
//                 final double blurSigma = lerpDouble(0.0, 3.0, t)!;
//                 final double overlayAlpha = 0.08 * t;
//
//                 return BackdropFilter(
//                   filter: ImageFilter.blur(
//                     sigmaX: blurSigma,
//                     sigmaY: blurSigma,
//                   ),
//                   child: Container(
//                     color:
//                         AppColor.shadowOpticalColor.withOpacity(overlayAlpha),
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomCenter,
//           child: AnimatedBuilder(
//             animation: sheetOpacity,
//             builder: (context, _) {
//               return SlideTransition(
//                 position: sheetOffset,
//                 child: Opacity(
//                   opacity: sheetOpacity.value,
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     child: _InjectedCloseHandler(
//                       onRequestClose: onRequestClose,
//                       child: sheetChild,
//                     ),
//                   ),
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
//
// class _InjectedCloseHandler extends InheritedWidget {
//   final VoidCallback onRequestClose;
//
//   const _InjectedCloseHandler({
//     required this.onRequestClose,
//     required super.child,
//   });
//
//   static _InjectedCloseHandler? of(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<_InjectedCloseHandler>();
//   }
//
//   @override
//   bool updateShouldNotify(_InjectedCloseHandler oldWidget) {
//     return oldWidget.onRequestClose != onRequestClose;
//   }
// }
//
// VoidCallback useBottomSheetCloser(BuildContext context) {
//   final inherited = _InjectedCloseHandler.of(context);
//   return inherited?.onRequestClose ??
//       () {
//         Navigator.of(context).pop();
//       };
// }
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/app_color.dart';

Future<T?> showBlurBottomSheet<T>({
  required BuildContext context,
  required Widget child,

  /// نفس فكرة showModalBottomSheet
  bool isScrollControlled = false,
}) {
  return Navigator.of(context).push(
    _BlurBottomSheetRoute<T>(
      sheetChild: child,
      isScrollControlled: isScrollControlled,
    ),
  );
}

class _BlurBottomSheetRoute<T> extends PageRoute<T> {
  final Widget sheetChild;
  final bool isScrollControlled;

  _BlurBottomSheetRoute({
    required this.sheetChild,
    required this.isScrollControlled,
  });

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 160);

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 160);

  @override
  Color get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => 'Dismiss';

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      ) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget childFromBuildPage,
      ) {
    final overlayOpacity = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    final sheetOpacity = CurvedAnimation(
      parent: animation,
      curve: Curves.easeOutCubic,
      reverseCurve: Curves.easeInCubic,
    );

    final sheetSlide = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).chain(
      CurveTween(curve: Curves.easeOutCubic),
    ).animate(animation);

    return _BlurSheetScaffold(
      overlayOpacity: overlayOpacity,
      sheetOpacity: sheetOpacity,
      sheetOffset: sheetSlide,
      isScrollControlled: isScrollControlled,
      onRequestClose: () {
        navigator?.pop();
      },
      sheetChild: sheetChild,
    );
  }
}

class _BlurSheetScaffold extends StatelessWidget {
  final Animation<double> overlayOpacity;
  final Animation<double> sheetOpacity;
  final Animation<Offset> sheetOffset;
  final VoidCallback onRequestClose;
  final Widget sheetChild;
  final bool isScrollControlled;

  const _BlurSheetScaffold({
    required this.overlayOpacity,
    required this.sheetOpacity,
    required this.sheetOffset,
    required this.onRequestClose,
    required this.sheetChild,
    required this.isScrollControlled,
  });

  @override
  Widget build(BuildContext context) {
    final keyboardInset = MediaQuery.of(context).viewInsets.bottom;

    return Stack(
      children: [
        // خلفية البلور
        Positioned.fill(
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: onRequestClose,
            child: AnimatedBuilder(
              animation: overlayOpacity,
              builder: (context, _) {
                final t = overlayOpacity.value;
                final double blurSigma = lerpDouble(0.0, 3.0, t)!;
                final double overlayAlpha = 0.08 * t;

                return BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaX: blurSigma,
                    sigmaY: blurSigma,
                  ),
                  child: Container(
                    color:
                    AppColor.shadowOpticalColor.withOpacity(overlayAlpha),
                  ),
                );
              },
            ),
          ),
        ),

        // الشيت نفسه
        Align(
          alignment: Alignment.bottomCenter,
          child: AnimatedBuilder(
            animation: sheetOpacity,
            builder: (context, _) {
              return AnimatedPadding(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOut,

                // هذا هو تأثير isScrollControlled 👇
                padding: EdgeInsets.only(
                  bottom: isScrollControlled ? keyboardInset : 0.0,
                  left: 16.w,
                  right: 16.w,
                ),
                child: SlideTransition(
                  position: sheetOffset,
                  child: Opacity(
                    opacity: sheetOpacity.value,
                    child: _InjectedCloseHandler(
                      onRequestClose: onRequestClose,
                      child: sheetChild,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _InjectedCloseHandler extends InheritedWidget {
  final VoidCallback onRequestClose;

  const _InjectedCloseHandler({
    required this.onRequestClose,
    required super.child,
  });

  static _InjectedCloseHandler? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_InjectedCloseHandler>();
  }

  @override
  bool updateShouldNotify(_InjectedCloseHandler oldWidget) {
    return oldWidget.onRequestClose != onRequestClose;
  }
}

VoidCallback useBottomSheetCloser(BuildContext context) {
  final inherited = _InjectedCloseHandler.of(context);
  return inherited?.onRequestClose ??
          () {
        Navigator.of(context).pop();
      };
}
