// Copyright 2021 Hiroki Murakami. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:ui' as ui;

import 'package:flutter/widgets.dart';
import 'package:paint_view/src/paint_controller.dart';

class PaintView extends StatefulWidget {
  const PaintView({
    Key? key,
    required this.paintController,
  }) : super(key: key);

  final PaintController paintController;

  @override
  _PaintViewState createState() => _PaintViewState();
}

class _PaintViewState extends State<PaintView> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _PaintViewPainter(repaint: widget.paintController),
    );
  }
}

class _PaintViewPainter extends CustomPainter {
  const _PaintViewPainter({required PaintController repaint})
      : super(repaint: repaint);

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
  }

  @override
  bool shouldRepaint(covariant _PaintViewPainter oldDelegate) {
    // TODO: implement shouldRepaint
    throw UnimplementedError();
  }
}

extension on Paint {
  Paint copyWith({
    bool? isAntiAlias,
    Color? color,
    BlendMode? blendMode,
    PaintingStyle? style,
    double? strokeWidth,
    StrokeCap? strokeCap,
    StrokeJoin? strokeJoin,
    double? strokeMiterLimit,
    MaskFilter? maskFilter,
    FilterQuality? filterQuality,
    Shader? shader,
    ColorFilter? colorFilter,
    ui.ImageFilter? imageFilter,
  }) =>
      Paint()
        ..isAntiAlias = isAntiAlias ?? this.isAntiAlias
        ..color = color ?? this.color
        ..blendMode = blendMode ?? this.blendMode
        ..style = style ?? this.style
        ..strokeWidth = strokeWidth ?? this.strokeWidth
        ..strokeCap = strokeCap ?? this.strokeCap
        ..strokeJoin = strokeJoin ?? this.strokeJoin
        ..strokeMiterLimit = strokeMiterLimit ?? this.strokeMiterLimit
        ..maskFilter = maskFilter ?? this.maskFilter
        ..filterQuality = filterQuality ?? this.filterQuality
        ..shader = shader ?? this.shader
        ..colorFilter = colorFilter ?? this.colorFilter
        ..imageFilter = imageFilter ?? this.imageFilter;
}
