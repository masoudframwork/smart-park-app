// lib/widgets/bb_svg.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// A resilient SVG widget that accepts either:
///  - Network URL (http/https)
///  - Asset path (e.g., assets/icons/foo.svg)
/// Optional: a fallback asset if network load fails.
class SvgImageWidget extends StatelessWidget {
  const SvgImageWidget(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.alignment = Alignment.center,
    this.colorFilter,
    this.placeholder,
    this.errorWidget,
    this.headers,
    this.fallbackAsset, // used if a network fetch fails
    this.semanticsLabel,
    this.color,
    this.matchTextDirection = false,
  });

  final String src;
  final double? width;
  final double? height;
  final Color? color;
  final BoxFit fit;
  final AlignmentGeometry alignment;
  final ColorFilter? colorFilter;
  final Widget? placeholder;
  final Widget? errorWidget;
  final Map<String, String>? headers;
  final String? fallbackAsset;
  final String? semanticsLabel;
  final bool matchTextDirection;

  bool get _isNetwork {
    final uri = Uri.tryParse(src);
    return uri != null && (uri.scheme == 'http' || uri.scheme == 'https');
  }

  @override
  Widget build(BuildContext context) {
    if (_isNetwork) {
      // Manual fetch -> SvgPicture.string so we can handle errors/fallbacks cleanly.
      return FutureBuilder<String>(
        future: _loadNetworkSvg(src, headers),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return _wrapSize(placeholder ?? _defaultPlaceholder(context));
          }
          if (snap.hasError || !snap.hasData || (snap.data?.isEmpty ?? true)) {
            if (fallbackAsset != null) {
              return _asset(fallbackAsset!);
            }
            return _wrapSize(errorWidget ?? _defaultError(context));
          }
          return _string(snap.data!);
        },
      );
    } else if (src.startsWith('data:image/svg+xml')) {
      // Data URI
      final content = src.split(',').skip(1).join(',');
      final decoded = Uri.decodeComponent(content);
      return _string(decoded);
    } else if (src.startsWith('memory://')) {
      // Optional: allow passing raw bytes via a registry you own; example stub.
      final bytes = _MemorySvgRegistry.get(src); // Uint8List?
      if (bytes == null) {
        return _wrapSize(errorWidget ?? _defaultError(context));
      }
      return _memory(bytes);
    } else {
      // Asset
      return _asset(src);
    }
  }

  // ---- Builders ----
  Widget _asset(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: colorFilter,
      semanticsLabel: semanticsLabel,
      matchTextDirection: matchTextDirection,
      color: color,
    );
  }

  Widget _string(String svg) {
    return SvgPicture.string(
      svg,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: colorFilter,
      semanticsLabel: semanticsLabel,
      matchTextDirection: matchTextDirection,
    );
  }

  Widget _memory(Uint8List bytes) {
    return SvgPicture.memory(
      bytes,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      colorFilter: colorFilter,
      semanticsLabel: semanticsLabel,
      matchTextDirection: matchTextDirection,
    );
  }

  Widget _wrapSize(Widget child) => SizedBox(
    width: width,
    height: height,
    child: Center(child: child),
  );

  Widget _defaultPlaceholder(BuildContext context) => SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 2),
  );

  Widget _defaultError(BuildContext context) =>
      Icon(Icons.broken_image_outlined, size: (width ?? height ?? 24) * 0.6);

  // ---- Network loader without extra deps (no http package needed) ----
  Future<String> _loadNetworkSvg(
    String url,
    Map<String, String>? headers,
  ) async {
    final bundle = NetworkAssetBundle(Uri.parse(url));
    final byteData = await bundle.load(url); // throws on error
    return String.fromCharCodes(byteData.buffer.asUint8List());
  }
}

/// Optional tiny registry for memory:// scheme (if you ever need it).
class _MemorySvgRegistry {
  static final Map<String, Uint8List> _store = {};
  static Uint8List? get(String key) => _store[key];
}
