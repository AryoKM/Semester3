import 'dart:io';
import 'dart:async';

final Map<String, List<String>> asciiLetters = {
  'H': [
    '▇   ▇',
    '▇   ▇',
    '▇▇▇▇▇',
    '▇   ▇',
    '▇   ▇',
  ],
  'B': [
    '▇▇▇▇ ',
    '▇   ▇',
    '▇▇▇▇ ',
    '▇   ▇',
    '▇▇▇▇ ',
  ],
  'D': [
    '▇▇▇▇ ',
    '▇   ▇',
    '▇   ▇',
    '▇   ▇',
    '▇▇▇▇ ',
  ],
  'A': [
    '  ▇  ',
    ' ▇ ▇ ',
    '▇   ▇',
    '▇▇▇▇▇',
    '▇   ▇',
  ],
  'P': [
    '▇▇▇▇▇',
    '▇   ▇',
    '▇▇▇▇ ',
    '▇    ',
    '▇    ',
  ],
  'K': [
    '▇   ▇',
    '▇ ▇  ',
    '▇▇   ',
    '▇ ▇  ',
    '▇   ▇',
  ],
  'N': [
    '▇   ▇',
    '▇▇  ▇',
    '▇ ▇ ▇',
    '▇  ▇▇',
    '▇   ▇',
  ],
  'O': [
    ' ▇▇▇ ',
    '▇   ▇',
    '▇   ▇',
    '▇   ▇',
    ' ▇▇▇ ',
  ],
  ' ':[
    '     ',
    '     ',
    '     ',
    '     ',
    '     ',
  ]
};

 clearScreen() {
  stdout.write('\x1b[2J\x1b[H');
}

 moveCursor(int x, int y) {
  stdout.write('\x1b[${y};${x}H');
}

Future<void> animateAsciiArt(String text) async {
  List<String> lines = List.filled(5, '');

  for (var char in text.split('')) {
    if (asciiLetters.containsKey(char)) {
      List<String> asciiLetter = asciiLetters[char]!;
      for (int i = 0; i < asciiLetter.length; i++) {
        lines[i] += asciiLetter[i] + ' ';
      }
    }
  }

  int height = stdout.terminalLines;
  int width = stdout.terminalColumns;
  int startRow = height - 5;
  int targetRow = (height ~/ 2) - (lines.length ~/ 2);

  for (int row = startRow; row > targetRow; row--) {
    clearScreen();
    for (int i = 0; i < lines.length; i++) {
      int centerX = (width ~/ 2) - (lines[i].length ~/ 2);
      moveCursor(centerX, row + i);
      stdout.writeln(lines[i]);
    }
    await Future.delayed(Duration(milliseconds: 300));
  }
}