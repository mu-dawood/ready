library ready_image;

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import 'config.dart';

export 'package:cached_network_image/cached_network_image.dart';
export 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
export 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ReadyImage extends StatelessWidget {
  final String path;
  final double? width;
  final double? height;
  final Map<String, String>? queryParameters;
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

  const ReadyImage({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.queryParameters,
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
  }) : super(key: key);

  ReadyImageDefaults config(BuildContext context) =>
      ReadyImageDefaults.of(context, this);
  @override
  Widget build(BuildContext context) {
    var p = config(context);
    Widget child;
    if (p.outerDecoration != null || p.outerPadding != null) {
      child = Container(
        clipBehavior: Clip.antiAlias,
        decoration: p.outerDecoration,
        padding: p.outerPadding,
        child: _build(context),
      );
    } else {
      child = _build(context);
    }

    return child;
  }

  Widget _build(BuildContext context) {
    var p = config(context);
    var child = CachedNetworkImage(
      imageUrl: p.resolveUrl(path).toString(),
      width: width,
      height: height,
      imageRenderMethodForWeb: p.imageRenderMethodForWeb,
      httpHeaders: p.headers(context),
      errorWidget: p.errorPlaceholder,
      fit: p.fit,
      cacheManager: p.cacheManager,
      progressIndicatorBuilder: p.loadingPlaceholder,
    );
    var decoration = p.decoration ?? const BoxDecoration();
    var foreground = p.foregroundDecoration;
    var force = p.forceForegroundRadiusSameAsBackground == true;
    if (force && decoration is BoxDecoration && foreground is BoxDecoration) {
      decoration = decoration.copyWith(
          borderRadius: decoration.borderRadius ?? foreground.borderRadius);
      foreground = foreground.copyWith(borderRadius: decoration.borderRadius);
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: decoration,
      foregroundDecoration: foreground,
      padding: p.innerPadding,
      child: child,
    );
  }
}

class HeroReadyImage extends StatelessWidget {
  final String tag;
  final ReadyImage child;
  const HeroReadyImage({
    Key? key,
    required this.child,
    required this.tag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var disable = ReadyImageDefaults.of(context, child).disableHero == true;
    if (disable) {
      return child;
    }
    return Hero(
      tag: tag,
      flightShuttleBuilder: _flightShuttleBuilder,
      child: child,
    );
  }

  Widget _flightShuttleBuilder(
    BuildContext flightContext,
    Animation<double> animation,
    HeroFlightDirection flightDirection,
    BuildContext fromHeroContext,
    BuildContext toHeroContext,
  ) {
    var fromImage = (((fromHeroContext.widget as Hero).child as ReadyImage));
    var toImage = (((toHeroContext.widget as Hero).child as ReadyImage));

    var isPush = flightDirection == HeroFlightDirection.push;
    var _animation = Tween(begin: isPush ? 0.0 : 1.0, end: isPush ? 1.0 : 0.0)
        .animate(animation);
    var fromP = fromImage.config(fromHeroContext);
    var toP = toImage.config(toHeroContext);
    var _decorationTween = _animation.drive(
      DecorationTween(
        begin: fromP.decoration ?? const BoxDecoration(),
        end: toP.decoration ?? const BoxDecoration(),
      ),
    );
    var _foregroundDecorationTween = _animation.drive(DecorationTween(
      begin: fromP.foregroundDecoration ?? const BoxDecoration(),
      end: toP.foregroundDecoration ?? const BoxDecoration(),
    ));

    var _wrapperDecorationTween = _animation.drive(
      DecorationTween(
        begin: fromP.outerDecoration ?? const BoxDecoration(),
        end: toP.outerDecoration ?? const BoxDecoration(),
      ),
    );
    var _warperPaddingTween = _animation.drive(
      EdgeInsetsGeometryTween(
          begin: fromP.outerPadding ?? EdgeInsets.zero,
          end: toP.outerPadding ?? EdgeInsets.zero),
    );
    var _innerPaddingTween = _animation.drive(EdgeInsetsGeometryTween(
      begin: fromP.innerPadding ?? EdgeInsets.zero,
      end: toP.innerPadding ?? EdgeInsets.zero,
    ));
    return AnimatedBuilder(
      animation: _animation,
      child: child,
      builder: (BuildContext context, Widget? c) {
        return ReadyImage(
          queryParameters: child.queryParameters,
          resolveUrl: child.resolveUrl,
          imageRenderMethodForWeb: child.imageRenderMethodForWeb,
          errorPlaceholder: child.errorPlaceholder,
          loadingPlaceholder: child.loadingPlaceholder,
          foregroundDecoration: _foregroundDecorationTween.value,
          decoration: _decorationTween.value,
          outerDecoration: _wrapperDecorationTween.value,
          outerPadding: _warperPaddingTween.value,
          innerPadding: _innerPaddingTween.value,
          fit: child.fit,
          headers: child.headers,
          cacheManager: child.cacheManager,
          disableHero: child.disableHero,
          forceForegroundRadiusSameAsBackground:
              child.forceForegroundRadiusSameAsBackground,
          path: child.path,
        );
      },
    );
  }
}

extension ReadyImageExtension on BuildContext {
  DecorationImage readyImageDecoration({
    required String path,
    Uri Function(String path)? resolveUrl,
    ImageRenderMethodForWeb? imageRenderMethodForWeb,
    int? maxHeight,
    int? maxWidth,
    double scale = 1.0,
    String? cacheKey,
    BoxFit? fit,
    HeadersCallBack? headers,
    BaseCacheManager? cacheManager,
    void Function(Object, StackTrace?)? onError,
    ColorFilter? colorFilter,
    AlignmentGeometry alignment = Alignment.center,
    Rect? centerSlice,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    bool matchTextDirection = false,
    double opacity = 1.0,
    FilterQuality filterQuality = FilterQuality.low,
    bool invertColors = false,
    bool isAntiAlias = false,
  }) {
    var config = ReadyImageConfig.of(this);
    return DecorationImage(
      fit: fit ?? config?.fit ?? BoxFit.cover,
      onError: onError,
      colorFilter: colorFilter,
      alignment: alignment,
      centerSlice: centerSlice,
      repeat: repeat,
      opacity: opacity,
      matchTextDirection: matchTextDirection,
      filterQuality: filterQuality,
      invertColors: invertColors,
      isAntiAlias: isAntiAlias,
      image: CachedNetworkImageProvider(
        (resolveUrl ?? config?.resolveUrl)?.call(path).toString() ?? path,
        maxHeight: maxHeight,
        maxWidth: maxWidth,
        scale: scale,
        headers: (headers ?? config?.headers)?.call(this),
        cacheManager: cacheManager ?? config?.cacheManager,
        cacheKey: cacheKey,
        imageRenderMethodForWeb: imageRenderMethodForWeb ??
            config?.imageRenderMethodForWeb ??
            ImageRenderMethodForWeb.HtmlImage,
      ),
    );
  }

  ImageProvider readyImageProvider({
    required String path,
    Uri Function(String path)? resolveUrl,
    ImageRenderMethodForWeb? imageRenderMethodForWeb,
    int? maxHeight,
    int? maxWidth,
    double scale = 1.0,
    String? cacheKey,
    HeadersCallBack? headers,
    BaseCacheManager? cacheManager,
  }) {
    var config = ReadyImageConfig.of(this);
    return CachedNetworkImageProvider(
      (resolveUrl ?? config?.resolveUrl)?.call(path).toString() ?? path,
      maxHeight: maxHeight,
      maxWidth: maxWidth,
      scale: scale,
      headers: (headers ?? config?.headers)?.call(this),
      cacheManager: cacheManager ?? config?.cacheManager,
      cacheKey: cacheKey,
      imageRenderMethodForWeb: imageRenderMethodForWeb ??
          config?.imageRenderMethodForWeb ??
          ImageRenderMethodForWeb.HtmlImage,
    );
  }
}
