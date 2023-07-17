import 'dart:async';

import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/witch.dart';

class MainGame extends FlameGame {
  final containerSize = Vector2(100, 150);

  @override
  Future onLoad() async {
    super.onLoad();

    await add(
      Witch(size: Vector2.all(containerSize.x)),
    );
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }
}
