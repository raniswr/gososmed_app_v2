import 'dart:math';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gososmed_app/core/constant/colors.dart';

class AppImage extends StatefulWidget {
  final String? url;
  final String? asset;
  final String? svg;
  final IconData? icon;
  final BoxFit fit;
  final Widget? loading;
  final Widget? failed;
  final int? cacheSize;
  final BoxShape? shape;
  final BoxBorder? border;
  final BorderRadius? borderRadius;
  final Clip clipBehavior;
  final double? width;
  final double? height;
  final Color? color;
  final Color? backgroundColor;
  final double? ratioImage;
  const AppImage(
      {Key? key,
      this.url,
      this.asset,
      this.svg,
      this.icon,
      this.border,
      this.shape,
      this.borderRadius,
      this.clipBehavior = Clip.antiAlias,
      this.fit = BoxFit.contain,
      this.loading,
      this.failed,
      this.width,
      this.height,
      this.cacheSize,
      this.color,
      this.backgroundColor,
      this.ratioImage})
      : super(key: key);

  @override
  AppImageState createState() => AppImageState();
}

class AppImageState extends State<AppImage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 500), lowerBound: 0.0, upperBound: 1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.url != null) {
      return ExtendedImage.network(
        widget.url!,
        fit: widget.fit,
        compressionRatio: widget.ratioImage,
        maxBytes: widget.cacheSize,
        cache: true,
        border: widget.border,
        shape: widget.shape,
        borderRadius: widget.borderRadius,
        width: widget.width,
        height: widget.height,
        color: widget.color,
        loadStateChanged: (ExtendedImageState state) {
          switch (state.extendedImageLoadState) {
            case LoadState.loading:
              _controller.reset();
              final progressSize = getProgressSize();
              return Container(
                  color: AppColors.grayDark,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: progressSize,
                        height: progressSize,
                        child: const CircularProgressIndicator(strokeWidth: 2),
                      )
                    ],
                  ));
            case LoadState.completed:
              _controller.forward();

              ///if you don't want override completed widget
              ///please return null or state.completedWidget
              //return null;
              //return state.completedWidget;
              return FadeTransition(
                opacity: _controller,
                child: ExtendedRawImage(
                  image: state.extendedImageInfo?.image,
                  fit: widget.fit,
                  width: widget.width,
                  height: widget.height,
                  color: widget.color,
                ),
              );
            case LoadState.failed:
              _controller.reset();
              //remove memory cached
              state.imageProvider.evict();
              return Container(color: AppColors.grayDark);
          }
        },
      );
    } else if (widget.asset != null) {
      return ExtendedImage.asset(
        widget.asset!,
        fit: widget.fit,
        border: widget.border,
        shape: widget.shape,
        borderRadius: widget.borderRadius,
        width: widget.width,
        height: widget.height,
        color: widget.color,
      );
    } else if (widget.icon != null) {
      return _buildIcon();
    } else {
      return _buildSvg();
    }
  }

  _buildIcon() {
    Widget current = Container(
      width: widget.width,
      height: widget.height,
      color: widget.backgroundColor ?? Colors.white,
      child: Icon(
        widget.icon,
        color: widget.color,
      ),
    );
    return _buildMisc(current);
  }

  _buildSvg() {
    Widget current = widget.svg == null
        ? Container(
            width: widget.width,
            height: widget.height,
            color: Colors.white,
            child: SvgPicture.asset(
              "Assets.takePicture",
              width: widget.width,
              height: widget.height,
              color: widget.color,
            ))
        : SvgPicture.asset(
            widget.svg!,
            width: widget.width,
            height: widget.height,
            color: widget.color,
          );
    return _buildMisc(current);
  }

  _buildMisc(Widget current) {
    if (widget.shape != null) {
      switch (widget.shape!) {
        case BoxShape.circle:
          current = ClipOval(
            clipBehavior: widget.clipBehavior,
            child: current,
          );
          break;
        case BoxShape.rectangle:
          if (widget.borderRadius != null) {
            current = ClipRRect(
              borderRadius: widget.borderRadius,
              clipBehavior: widget.clipBehavior,
              child: current,
            );
          }
          break;
      }
    }
    if (widget.border != null) {
      current = CustomPaint(
        foregroundPainter: ExtendedImageBorderPainter(borderRadius: widget.borderRadius, border: widget.border, shape: widget.shape ?? BoxShape.rectangle),
        size: widget.width != null && widget.height != null ? Size(widget.width!, widget.height!) : Size.zero,
        child: current,
      );
    }
    return current;
  }

  double getProgressSize() {
    final width = widget.width ?? 0;
    final height = widget.height ?? width;
    if (width != 0 || height != 0) {
      final lowest = min(width, height);
      return (lowest / 2).floorToDouble();
    }
    return 20;
  }
}
