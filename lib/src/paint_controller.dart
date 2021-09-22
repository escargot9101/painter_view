// Copyright 2021 Hiroki Murakami. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PaintController extends ChangeNotifier {
  PaintController({
    Color paintColor = Colors.black,
  }) : _paintColor = paintColor;

  // @formatter:off
  final eraseMode = _EraseMode();

  final canUndo = _BoolNotifier();
  void undo() {}

  final canRedo = _BoolNotifier();
  void redo() {}

  Color _paintColor;
  Color get paintColor => _paintColor;
  set paintColor(Color value) {
    if (value != _paintColor) {
      _paintColor = value;
      notifyListeners();
    }
  }

  // @formatter:on
}

class _BoolNotifier extends ChangeNotifier {
  _BoolNotifier([this.__value = false]);

  bool __value;

  bool get value => __value;

  set _value(bool value) {
    __value = value;
  }
}

class _EraseMode extends ChangeNotifier {
  _EraseMode([this._enable = false]);

  bool _enable;

  bool get enable => _enable;

  set enable(bool value) {
    _enable = value;
    notifyListeners();
  }

  void toggle() {
    _enable = !_enable;
  }
}
