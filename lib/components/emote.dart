import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/sprite.dart';

class Emote extends SpriteComponent with HasGameRef {
  Emote({super.size, super.position});

  final _random = Random();

  late final SpriteSheet _spriteSheet;

  @override
  Future onLoad() async {
    super.onLoad();

    final image = await game.images.load('speech_emotes.png');
    _spriteSheet = SpriteSheet(
      image: image,
      srcSize: Vector2.all(16),
    );

    sprite = _spriteSheet.getSprite(0, 0);
    opacity = 0;
  }

  random() {
    sprite = _spriteSheet.getSprite(0, _random.nextInt(9));
    opacity = 1;
    final effect = OpacityEffect.to(
      0,
      EffectController(
        duration: 0.1,
        startDelay: 1,
      ),
    );
    add(effect);
  }
}
