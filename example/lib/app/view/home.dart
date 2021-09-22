import 'dart:math' as math;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final rundom = math.Random();
  late final ValueNotifier<Color> _color;

  @override
  void initState() {
    print('initState');
    super.initState();
    _color = ValueNotifier(Colors.black);
  }

  @override
  void didUpdateWidget(covariant HomePage oldWidget) {
    print('didUpdateWidget');
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final actionTextStyle =
        theme.cupertinoOverrideTheme?.textTheme?.actionTextStyle;
    print(actionTextStyle.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
        actions: [
          GestureDetector(
            child: const Text(
              'Color',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              print('tapped');
              _color.value = Color.fromARGB(
                255,
                rundom.nextInt(255),
                rundom.nextInt(255),
                rundom.nextInt(255),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: DecoratedBox(
                decoration: BoxDecoration(border: Border.all(width: 0.0)),
                child: AspectRatio(
                  aspectRatio: 1.2,
                  child: _Paint(color: _color),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Paint extends StatelessWidget {
  const _Paint({Key? key, this.color}) : super(key: key);

  final ValueNotifier<Color>? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _Painter(color),
      willChange: true,
    );
  }
}

class _Painter extends CustomPainter {
  _Painter([this._color]) : super(repaint: _color);

  final ValueNotifier<Color>? _color;

  @override
  void paint(Canvas canvas, Size size) {
    print(size.toString());
    final paint = Paint()
      ..color = _color?.value ?? Colors.white
      ..blendMode = BlendMode.srcOver;
    // canvas.save();
    canvas.saveLayer(Offset.zero & size, Paint());
    canvas.drawDRRect(
        RRect.fromRectXY(Offset.zero & (size / 2.0), 50.0, 50.0),
        RRect.fromRectXY(
            (size / 2).center(Offset.zero) & (size / 2.0), 50.0, 50.0),
        paint);
    // canvas.drawPaint(paint);
    // canvas.restore();
    // canvas.save();
    // canvas.clipRRect(new RRect.fromRectXY(
    //     (size / 2).center(Offset.zero) & (size / 2.0), 50.0, 50.0));
    // canvas.drawPaint(paint);
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _Painter oldDelegate) {
    final should = oldDelegate._color != _color;
    print('old color: ${oldDelegate._color?.value}, should: $should');
    return should;
  }
}
