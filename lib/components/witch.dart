import 'dart:async';
import 'dart:math';
import 'dart:ui' as ui;

import 'package:flame/components.dart';

class Witch extends SpriteAnimationComponent with HasGameRef {
  Witch({super.size, super.position})
      : super(
          anchor: Anchor.topCenter,
        );

  final _random = Random();

  late final ui.Image _idleImage;
  late final ui.Image _runningImage;
  late final ui.Image _groundRecoveryImage;
  late final ui.Image _fallingImage;
  late final ui.Image _hurtImage;
  late final ui.Image _castingSpellAerialImage;
  late final ui.Image _castingSpellRepeatingImage;
  late final ui.Image _castingSpellImage;
  late final ui.Image _jumpingImage;
  late final ui.Image _duckingImage;

  @override
  Future onLoad() async {
    super.onLoad();

    position.x = size.x * 0.5;
    flipHorizontally();

    _idleImage = await game.images.load('idle.png');
    _runningImage = await game.images.load('running.png');
    _groundRecoveryImage = await game.images.load('ground_recovery.png');
    _fallingImage = await game.images.load('falling.png');
    _hurtImage = await game.images.load('hurt.png');
    _castingSpellAerialImage =
        await game.images.load('casting_spell_aerial.png');
    _castingSpellRepeatingImage =
        await game.images.load('casting_spell_repeating.png');
    _castingSpellImage = await game.images.load('casting_spell.png');
    _jumpingImage = await game.images.load('jumping.png');
    _duckingImage = await game.images.load('ducking.png');

    _idle();
  }

  random() {
    switch (_random.nextInt(7)) {
      case 0:
        _jump();
        break;
      case 1:
        _run();
        break;
      case 2:
        _hurt();
        break;
      case 3:
        _castSpellAerial();
        break;
      case 4:
        _castSpellRepeating();
        break;
      case 5:
        _castSpell();
        break;
      case 6:
        _duck();
        break;
    }
  }

  SpriteAnimation _createAnimation(
      ui.Image image, int amount, double stepTime, bool loop) {
    return SpriteAnimation.fromFrameData(
      image,
      SpriteAnimationData.sequenced(
        textureSize: Vector2.all(32),
        stepTime: stepTime,
        amount: amount,
        loop: loop,
      ),
    );
  }

  _idle() {
    animation = _createAnimation(_idleImage, 5, 0.2, true);
  }

  _jump() async {
    final jumping = _createAnimation(_jumpingImage, 1, 0.2, false);
    final falling = _createAnimation(_fallingImage, 2, 0.1, false);
    final groundRecovery =
        _createAnimation(_groundRecoveryImage, 3, 0.1, false);

    animation = SpriteAnimation(
      [jumping.frames, falling.frames, groundRecovery.frames]
          .expand((frames) => frames)
          .toList(),
      loop: false,
    );
    await animationTicker?.completed;
    _idle();
  }

  _hurt() async {
    animation = _createAnimation(_hurtImage, 2, 0.2, false);
    await animationTicker?.completed;
    _idle();
  }

  _run() async {
    final running = _createAnimation(_runningImage, 6, 0.1, false);

    animation = SpriteAnimation(
      [running.frames, running.frames].expand((frames) => frames).toList(),
      loop: false,
    );
    await animationTicker?.completed;
    _idle();
  }

  _castSpellAerial() async {
    animation = _createAnimation(_castingSpellAerialImage, 4, 0.1, false);
    await animationTicker?.completed;
    _idle();
  }

  _castSpellRepeating() async {
    final castingSpellRepeating =
        _createAnimation(_castingSpellRepeatingImage, 4, 0.2, false);

    animation = SpriteAnimation(
      [castingSpellRepeating.frames, castingSpellRepeating.frames]
          .expand((frames) => frames)
          .toList(),
      loop: false,
    );
    await animationTicker?.completed;
    _idle();
  }

  _castSpell() async {
    animation = _createAnimation(_castingSpellImage, 4, 0.2, false);
    await animationTicker?.completed;
    _idle();
  }

  _duck() async {
    animation = _createAnimation(_duckingImage, 1, 0.4, false);
    await animationTicker?.completed;
    _idle();
  }
}
