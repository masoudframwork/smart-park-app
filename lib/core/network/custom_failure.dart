class CustomFailure implements Exception {
  final String message;
  final int? code;

  CustomFailure(this.message, {this.code});

  @override
  String toString() => 'CustomFailure($code): $message';
}
