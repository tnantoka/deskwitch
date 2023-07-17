import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class MainGame extends FlameGame {
  @override
  Future onLoad() async {
    super.onLoad();

    await add(
      CircleComponent(
        radius: 50,
        paint: Paint()..color = Colors.red,
      ),
    );
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }
}
