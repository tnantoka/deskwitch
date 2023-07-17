import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

import 'components/witch.dart';
import 'components/emote.dart';

class MainGame extends FlameGame with TapCallbacks {
  final _containerSize = Vector2(100, 150);
  final _random = Random();

  late final Witch _witch;
  late final Emote _emote;

  @override
  Future onLoad() async {
    super.onLoad();

    final container = PositionComponent(
      size: _containerSize,
      position: size * 0.5 - _containerSize * 0.5,
    );
    await add(container);

    await container.add(
      _emote = Emote(
        size: Vector2.all(_containerSize.x * 0.5),
        position: Vector2(_containerSize.x * 0.25, 0),
      ),
    );
    await container.add(
      _witch = Witch(
        size: Vector2.all(_containerSize.x),
        position: Vector2(0, _containerSize.y - _containerSize.x),
      ),
    );
  }

  @override
  Color backgroundColor() {
    return Colors.transparent;
  }

  @override
  void onTapDown(TapDownEvent event) {
    super.onTapDown(event);

    if (_random.nextInt(2) == 0) {
      _witch.random();
    } else {
      _emote.random();
    }
  }
}
