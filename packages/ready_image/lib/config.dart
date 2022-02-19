import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'ready_image.dart';

typedef HeadersCallBack = Map<String, String> Function(BuildContext context);
typedef ResolveUrlCallBack = String Function(String url);

class ReadyImageConfig extends InheritedWidget {
  const ReadyImageConfig({
    Key? key,
    this.resolveUrl,
    this.imageRenderMethodForWeb,
    this.errorPlaceholder,
    this.loadingPlaceholder,
    this.foregroundDecoration,
    this.decoration,
    this.outerDecoration,
    this.outerPadding,
    this.innerPadding,
    this.fit,
    this.headers,
    this.cacheManager,
    this.disableHero,
    this.forceForegroundRadiusSameAsBackground,
    required Widget child,
  }) : super(key: key, child: child);

  final Uri Function(String path)? resolveUrl;
  final ImageRenderMethodForWeb? imageRenderMethodForWeb;
  final LoadingErrorWidgetBuilder? errorPlaceholder;
  final ProgressIndicatorBuilder? loadingPlaceholder;
  final Decoration? foregroundDecoration;
  final Decoration? decoration;
  final Decoration? outerDecoration;
  final EdgeInsetsGeometry? outerPadding;
  final EdgeInsetsGeometry? innerPadding;
  final BoxFit? fit;
  final HeadersCallBack? headers;
  final BaseCacheManager? cacheManager;
  final bool? disableHero;
  final bool? forceForegroundRadiusSameAsBackground;

  static ReadyImageConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ReadyImageConfig>();
  }

  @override
  bool updateShouldNotify(ReadyImageConfig oldWidget) {
    return resolveUrl == oldWidget.resolveUrl ||
        imageRenderMethodForWeb == oldWidget.imageRenderMethodForWeb ||
        errorPlaceholder == oldWidget.errorPlaceholder ||
        loadingPlaceholder == oldWidget.loadingPlaceholder ||
        foregroundDecoration == oldWidget.foregroundDecoration ||
        decoration == oldWidget.decoration ||
        outerDecoration == oldWidget.outerDecoration ||
        outerPadding == oldWidget.outerPadding ||
        innerPadding == oldWidget.innerPadding ||
        fit == oldWidget.fit ||
        headers == oldWidget.headers ||
        cacheManager == oldWidget.cacheManager ||
        disableHero == oldWidget.disableHero ||
        forceForegroundRadiusSameAsBackground ==
            oldWidget.forceForegroundRadiusSameAsBackground;
  }
}

class ReadyImageDefaults {
  final Uri Function(String path) resolveUrl;
  final ImageRenderMethodForWeb imageRenderMethodForWeb;
  final LoadingErrorWidgetBuilder errorPlaceholder;
  final ProgressIndicatorBuilder loadingPlaceholder;
  final Decoration? foregroundDecoration;
  final Decoration? decoration;
  final Decoration? outerDecoration;
  final EdgeInsetsGeometry? outerPadding;
  final EdgeInsetsGeometry? innerPadding;
  final BoxFit fit;
  final HeadersCallBack headers;
  final BaseCacheManager? cacheManager;
  final bool disableHero;
  final bool forceForegroundRadiusSameAsBackground;

  ReadyImageDefaults({
    required this.resolveUrl,
    required this.imageRenderMethodForWeb,
    required this.errorPlaceholder,
    required this.loadingPlaceholder,
    required this.foregroundDecoration,
    required this.decoration,
    required this.outerDecoration,
    required this.outerPadding,
    required this.innerPadding,
    required this.fit,
    required this.headers,
    required this.cacheManager,
    required this.disableHero,
    required this.forceForegroundRadiusSameAsBackground,
  });

  static Widget _defaultErrorBuilder(
      BuildContext context, String url, dynamic error) {
    return Container(color: Colors.grey[400]);
  }

  static Widget _defaultLoadingBuilder(
      BuildContext context, String url, DownloadProgress progress) {
    return Center(
      child: CircularProgressIndicator(value: progress.progress),
    );
  }

  static Map<String, String> _defaultHeaders(BuildContext context) {
    var language = Localizations.maybeLocaleOf(context)?.languageCode;
    return {if (language != null) "Accept-Language": language};
  }

  static Uri _defaultUrlResolver(String path) {
    return Uri.parse(path);
  }

  static ReadyImageDefaults of(BuildContext context, ReadyImage widget) {
    var config = ReadyImageConfig.of(context);

    return ReadyImageDefaults(
      resolveUrl:
          widget.resolveUrl ?? config?.resolveUrl ?? _defaultUrlResolver,
      imageRenderMethodForWeb: widget.imageRenderMethodForWeb ??
          config?.imageRenderMethodForWeb ??
          ImageRenderMethodForWeb.HtmlImage,
      errorPlaceholder: widget.errorPlaceholder ??
          config?.errorPlaceholder ??
          _defaultErrorBuilder,
      loadingPlaceholder: widget.loadingPlaceholder ??
          config?.loadingPlaceholder ??
          _defaultLoadingBuilder,
      foregroundDecoration:
          widget.foregroundDecoration ?? config?.foregroundDecoration,
      decoration: widget.decoration ?? config?.decoration,
      outerDecoration: widget.outerDecoration ?? config?.outerDecoration,
      outerPadding: widget.outerPadding ?? config?.outerPadding,
      innerPadding: widget.innerPadding ?? config?.innerPadding,
      fit: widget.fit ?? config?.fit ?? BoxFit.contain,
      headers: widget.headers ?? config?.headers ?? _defaultHeaders,
      cacheManager: widget.cacheManager ?? config?.cacheManager,
      disableHero: widget.disableHero ?? config?.disableHero ?? false,
      forceForegroundRadiusSameAsBackground:
          widget.forceForegroundRadiusSameAsBackground ??
              config?.forceForegroundRadiusSameAsBackground ??
              true,
    );
  }
}
