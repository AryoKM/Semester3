import 'dart:async';
import 'dart:io';
import 'dart:math';

class Point {
  int x, y;
  Point(this.x, this.y);

  bool operator ==(other) => other is Point && x == other.x && y == other.y;
  int get hashCode => x * 31 + y;
}

class SnakeGame {
  List<Point> snake = [Point(5, 5)];
  Point direction = Point(1, 0); // ke kanan
  Point food = Point(0, 0); // inisialisasi
  int width, height;

  SnakeGame(this.width, this.height) {
    spawnFood();
  }

  spawnFood() {
    final random = Random();
    do {
      food = Point(random.nextInt(width), random.nextInt(height));
    } while (snake.contains(food));
  }

  changeDirection(String input) {
    if (input == 'w' && direction != Point(0, 1)) direction = Point(0, -1);
    if (input == 's' && direction != Point(0, -1)) direction = Point(0, 1);
    if (input == 'a' && direction != Point(1, 0)) direction = Point(-1, 0);
    if (input == 'd' && direction != Point(-1, 0)) direction = Point(1, 0);
  }

  update() {
    final newHead = Point(
      (snake.first.x + direction.x) % width,
      (snake.first.y + direction.y) % height,
    );

    if (newHead.x < 0) newHead.x = width - 1;
    if (newHead.y < 0) newHead.y = height - 1;

    if (snake.contains(newHead)) { // program berhentai klo tabrak diri sendiri
      print("Game Over!");
      exit(0);
    }

    snake.insert(0, newHead);
    if (newHead == food) {
      spawnFood();
    } else {
      snake.removeLast();
    }

    if (snake.length == width-4 * height-2) { // sengaja spy nd aneh tampilan di terminal
      print("Congratulations! You filled the terminal.");
      exit(0);
    }
  }

  draw() {
    final buffer = StringBuffer();
    for (int y = 0; y < height; y++) {
      for (int x = 0; x < width; x++) {
        if (snake.contains(Point(x, y))) {
          buffer.write('◼'); // badan
        } else if (food == Point(x, y)) {
          buffer.write('◉'); // makanan
        } else {
          buffer.write(' '); // empty canvas like my head 24/7
        }
      }
      buffer.writeln();
    }
    print(buffer.toString());
  }

  start() {
    Timer.periodic(Duration(milliseconds: 150), (timer) {
      update();
      draw();
    });

    stdin.echoMode = false;
    stdin.lineMode = false;
    stdin.listen((event) {
      changeDirection(String.fromCharCode(event.first));
    });
  }
}

main() {
  final width = stdout.terminalColumns-4;
  final height = stdout.terminalLines-2;
  final game = SnakeGame(width, height);
  game.start();
}