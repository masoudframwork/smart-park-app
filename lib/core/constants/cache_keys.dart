class CacheKeys {
  CacheKeys._internal();

  static final CacheKeys _instance = CacheKeys._internal();

  factory CacheKeys() => _instance;

  final String locale = 'locale';
  final String theme = 'theme';
}
