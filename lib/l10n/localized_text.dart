import 'package:smart/l10n/app_locale.dart';

String localizedText({
  required String ar,
  required String en,
}) {
  final isArabic = AppLocale.shared.isArabic();
  return isArabic ? ar : en;
}

extension AppLocaleX on AppLocale {
  String tr({required String ar, required String en}) => isArabic() ? ar : en;
}
