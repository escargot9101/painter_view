library painter_view;

import 'package:flutter/material.dart';
import 'package:painter_view/src/painter2_mod.dart';

class PainterView extends StatefulWidget {
  PainterView({
    Key key,
    this.controller,
    this.width,
    this.height,
  }) : super(key: key);

  final PainterController controller;
  final double width;
  final double height;

  @override
  createState() => _PainterViewState();
}

class _PainterViewState extends State<PainterView> {
  PainterController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PainterController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ColoredBox(
            color: null,
          ),
        ],
      ),
    );
  }
}