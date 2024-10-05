import 'dart:io';
import 'color.dart' as color;
import 'main.dart' as main;

final Map<String, List<String>> fireworkFrame = {
  '1': [
    '       ▇       ',
    '      ▇ ▇      ',
    '     ▇ ▇ ▇     ',
    '      ▇ ▇      ',
    '       ▇       ',
  ],
  '2': [
    '       ▇       ',
    '     ▇ ▇ ▇     ',
    '   ▇ ▇ ▇ ▇ ▇   ',
    '     ▇ ▇ ▇     ',
    '       ▇       ',
  ],
  '3': [
    '        ▇        ',
    '      ▇ ▇ ▇      ',
    '   ▇ ▇ ▇ ▇ ▇ ▇   ',
    ' ▇ ▇ ▇ ▇ ▇ ▇ ▇ ▇ ',
    '   ▇ ▇ ▇ ▇ ▇ ▇   ',
    '      ▇ ▇ ▇      ',
    '        ▇     ',

  ],
};

 moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

 printFireworkFrame(
    String frameKey, int centerX, int centerY, colorSelects) {
  List<String> frame = fireworkFrame[frameKey] ?? [];
  String bgColor =
      color.getBackgroundColor(colorSelects[1]);
  String fontColor =
      frameKey == '2' ? color.RESET + colorSelects[1] : bgColor + color.BLACK;
  if (frameKey == '2') bgColor = color.RESET;
  for (var i = 0; i < frame.length; i++) {
    moveTo(centerY - (frame.length ~/ 2) + i, centerX - (frame[i].length ~/ 2));
    String line = frame[i];
    for (var char in line.split('')) {
      if (char == ' ') {
        stdout.write(bgColor +
            ' ' +
            color.RESET);
      } else {
        stdout.write(
            fontColor + char + color.RESET);
      }
    }
  }
}

 clearScreen() {
  stdout.write('\x1B[2J\x1B[0;0H');
}

 changeBackground(String colorSelect) {
  print(color.getBackgroundColor(colorSelect));
  clearScreen();
}

Future<void> kembangApi(centerX, centerY, colorSelects) async {
  String fontColor = colorSelects[1];
  clearScreen();
  for (int i = 1; i <= fireworkFrame.length; i++) {
    if (i % 2 == 0) {
      changeBackground(color.BLACK);
    } else {
      changeBackground(fontColor);
    }
    printFireworkFrame(i.toString(), centerX, centerY, colorSelects);
    await main.delay(150);
    clearScreen();
  }
}