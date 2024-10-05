import 'color.dart' as color;
import 'firework.dart' as firework;
import 'text.dart' as hbd_ano;
import 'dart:async';
import 'dart:math';

import 'dart:io';

getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

 printCoords(String text, int width, int height) {
  int screenHeight = getScreenSize()[1];

  int centerX = width;

  int centerY = screenHeight - height;

  stdout.write('\x1B[${centerY};${centerX}H');

  stdout.write(text);

  stdout.write('\x1B[${screenHeight};0H');
}

 clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

int random(int min, int max) {
  return min + Random().nextInt(max - min);
}

int randomMax(int max) {
  return Random().nextInt(max);
}

 main() async {
  clearScreen();
  String text = "▇";
  stdout.write("Masukkan Jumlah kembang Api: ");
  int? jumlahKembangApi = (int.parse(stdin.readLineSync()!));
  jumlahKembangApi = jumlahKembangApi < 1 ? 1 : jumlahKembangApi;

  clearScreen();
  for (int j = 0; j < jumlahKembangApi; j++) {
    int minHeight = getScreenSize()[1] ~/ 5;
    int minWidth = getScreenSize()[0] ~/ 5;
    int randomX = random(minWidth, getScreenSize()[0] - minWidth);
    int randomY = random(minHeight, getScreenSize()[1] - minHeight);
    List<String> randomColor = color.getRandomColor();
    if (j == 0) {
      randomX = getScreenSize()[0] ~/ 2;
      randomY = getScreenSize()[1] ~/ 2;
    }
    for (int i = 0; i < randomY; i++) {
      printCoords(randomColor[0] + text + color.RESET, randomX, i);
      await delay(100);
      clearScreen();
    }
    await firework.kembangApi(randomX, getScreenSize()[1]-randomY, randomColor);
  }
  clearScreen();

  await hbd_ano.animateAsciiArt("HBD PAK ANO");
  firework.moveTo(getScreenSize()[0], getScreenSize()[1]);
}
// made with gibe framework™