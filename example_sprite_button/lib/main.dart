import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(
    GameWidget(
      game: MyGame(),
    ),
  );
}

class MyGame extends FlameGame with HasTappableComponents {
   late SpriteButton button;

  @override
  Future<void> onLoad() async {
    // Carrega a imagem do botão
    final sprite = await loadSprite('button.png');
    final pressedSprite = await loadSprite('button_pressed.png');
    button = SpriteButton(
      sprite: sprite,
      pressedSprite: pressedSprite,
      onPressed: () {  },
      width: 200,
      height: 200,
      label: Text('Teste'),
    );
    add(button);

    final box = NineTileBox(
      path: '',
      tileSize: 16,
      destTileSize: 200,
    );
    box.anchor = Anchor.center;
    add(box);
  }
}
