import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class SpaceShooterGame extends StatefulWidget {
  @override
  _SpaceShooterGameState createState() => _SpaceShooterGameState();
}

class _SpaceShooterGameState extends State<SpaceShooterGame> {
  double playerX = 0; // Player's x position
  double playerY = 0.8; // Player's y position
  List<Bullet> bullets = []; // List to store bullets
  List<Enemy> enemies = []; // List to store enemies
  Timer? gameTimer; // Timer for game updates
  int score = 0; // Player's score
  bool isGameOver = false; // Game over state
  Timer? bulletTimer; // Timer for bullet spawning
  Timer? enemyTimer; // Timer for enemy spawning
  ui.Image? playerImage; // Player image
  ui.Image? enemyImage; // Enemy image

  @override
  void initState() {
    super.initState();
    loadImages();
    spawnEnemies(); // Start spawning enemies immediately
    gameTimer = Timer.periodic(Duration(milliseconds: 16), (timer) {
      updateGame();
    });
    bulletTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      shoot();
    });
    enemyTimer = Timer.periodic(Duration(milliseconds: 700), (timer) {
      spawnEnemies();
    });
  }

  @override
  void dispose() {
    gameTimer?.cancel();
    bulletTimer?.cancel();
    enemyTimer?.cancel();
    super.dispose();
  }

  Future<void> loadImages() async {
    playerImage = await _loadImage('assets/images/player.png');
    enemyImage = await _loadImage('assets/images/enemy.png');
    setState(() {});
  }

  Future<ui.Image> _loadImage(String path) async {
    final ByteData data = await rootBundle.load(path);
    final Uint8List bytes = data.buffer.asUint8List();
    final Completer<ui.Image> completer = Completer();
    ui.instantiateImageCodec(bytes).then((codec) {
      codec.getNextFrame().then((frame) {
        completer.complete(frame.image);
      });
    });
    return completer.future;
  }

  void movePlayer(double delta) {
    if (!isGameOver) {
      setState(() {
        playerX += delta;
        if (playerX < -1) playerX = -1;
        if (playerX > 1) playerX = 1;
      });
    }
  }

  void shoot() {
    if (!isGameOver) {
      setState(() {
        bullets.add(Bullet(playerX, playerY));
      });
    }
  }

  void spawnEnemies() {
    if (!isGameOver) {
      // Generate a random X position within the screen bounds
      double randomX = (1 - 0.1) * (new DateTime.now().millisecondsSinceEpoch % 100) / 100 + 0.1; // Random x positions between 0.1 and 0.9
      enemies.add(Enemy(randomX * 2 - 1, -1)); // Map [0, 1] to [-1, 1]
    }
  }

  void updateGame() {
    if (!isGameOver) {
      setState(() {
        bullets.forEach((bullet) {
          bullet.move();
        });
        bullets.removeWhere((bullet) => bullet.y < -1);

        enemies.forEach((enemy) {
          enemy.move();
        });

        checkCollisions();
        checkGameOver();
      });
    }
  }

  void checkCollisions() {
    for (int i = bullets.length - 1; i >= 0; i--) {
      for (int j = enemies.length - 1; j >= 0; j--) {
        // Check if the enemy is visible (y position should be within the screen bounds)
        if (enemies[j].y >= -1 && enemies[j].y <= 1) {
          if (bullets[i].collidesWith(enemies[j])) {
            setState(() {
              bullets.removeAt(i);
              enemies.removeAt(j);
              score++;
            });
            return; // Exit loop after collision
          }
        }
      }
    }
  }

  void checkGameOver() {
    for (var enemy in enemies) {
      if (enemy.y >= 1) {
        setState(() {
          isGameOver = true;
          bulletTimer?.cancel(); // Stop bullets
          enemyTimer?.cancel(); // Stop enemies
        });
        break;
      }
    }
  }

  void restartGame() {
    setState(() {
      playerX = 0;
      bullets.clear();
      enemies.clear();
      score = 0;
      isGameOver = false;
      spawnEnemies();
      bulletTimer = Timer.periodic(Duration(milliseconds: 300), (timer) {
        shoot();
      });
      enemyTimer = Timer.periodic(Duration(milliseconds: 700), (timer) {
        spawnEnemies();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          CustomPaint(
            painter: GamePainter(bullets, enemies, playerX, playerImage, enemyImage),
            child: Container(),
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: Text(
              'Score: $score',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          if (isGameOver) ...[
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Game Over',
                    style: TextStyle(color: Colors.red, fontSize: 48),
                  ),
                ],
              ),
            ),
          ],
          GestureDetector(
            onHorizontalDragUpdate: (details) {
              movePlayer(details.delta.dx / 100);
            },
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}

class GamePainter extends CustomPainter {
  final List<Bullet> bullets;
  final List<Enemy> enemies;
  final double playerX;
  final ui.Image? playerImage; // Added player image
  final ui.Image? enemyImage; // Added enemy image

  GamePainter(this.bullets, this.enemies, this.playerX, this.playerImage, this.enemyImage);

  @override
  void paint(Canvas canvas, Size size) {
    if (playerImage != null) {
      canvas.drawImageRect(
        playerImage!,
        Rect.fromLTWH(0, 0, playerImage!.width.toDouble(), playerImage!.height.toDouble()),
        Rect.fromLTWH(
          size.width / 2 + playerX * (size.width / 2 - 30) - 15,
          size.height - 100,
          50,
          50,
        ),
        Paint(),
      );
    }

    final bulletPaint = Paint()..color = const Color.fromARGB(255, 255, 0, 0);
    bullets.forEach((bullet) {
      canvas.drawRect(
        Rect.fromLTWH(
          bullet.x * (size.width / 2 - 15) + size.width / 2 - 7.5,
          bullet.y * size.height,
          10,
          25,
        ),
        bulletPaint,
      );
    });

    if (enemyImage != null) {
      enemies.forEach((enemy) {
        canvas.drawImageRect(
          enemyImage!,
          Rect.fromLTWH(0, 0, enemyImage!.width.toDouble(), enemyImage!.height.toDouble()),
          Rect.fromLTWH(
            enemy.x * (size.width / 2 - 30) + size.width / 2 - 15,
            enemy.y * size.height,
            50,
            50,
          ),
          Paint(),
        );
      });
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Bullet {
  double x;
  double y;

  Bullet(this.x, this.y);

  void move() {
    y -= 0.05; // Bullet moves up
  }

  bool collidesWith(Enemy enemy) {
    return x >= enemy.x - 0.15 &&
        x <= enemy.x + 0.15 &&
        y >= enemy.y - 0.05 &&
        y <= enemy.y + 0.05;
  }
}

class Enemy {
  double x;
  double y;

  Enemy(this.x, this.y);

  void move() {
    y += 0.005; // Enemy moves down
  }
}
