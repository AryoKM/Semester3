import 'dart:async'; import 'dart:io'; import 'dart:math';

// ANSI Color codes for Windows CMD in Dart
const String RESET = '\x1B[0m'; // Reset all styles
const Map<String, String> COLORS = {
  'BLACK': '\x1B[30m',
  'RED': '\x1B[31m',
  'GREEN': '\x1B[32m',
  'YELLOW': '\x1B[33m',
  'BLUE': '\x1B[34m',
  'MAGENTA': '\x1B[35m',
  'CYAN': '\x1B[36m',
  'WHITE': '\x1B[37m',
  'BRIGHT_BLACK': '\x1B[90m',
  'BRIGHT_RED': '\x1B[91m',
  'BRIGHT_GREEN': '\x1B[92m',
  'BRIGHT_YELLOW': '\x1B[93m',
  'BRIGHT_BLUE': '\x1B[94m',
  'BRIGHT_MAGENTA': '\x1B[95m',
  'BRIGHT_CYAN': '\x1B[96m',
  'BRIGHT_WHITE': '\x1B[97m',
};

String getRandomColor(String exception) {
  final availableColors = COLORS.values.toList()
    ..remove(exception);
  return availableColors[Random().nextInt(availableColors.length)];
}

class Node {
  String data;
  Node? next;

  Node(this.data);
}

Future<void> delay(int milliseconds) async {
  await Future.delayed(Duration(milliseconds: milliseconds));
}

moveTo(int row, int col) {
  stdout.write('\x1B[${row};${col}H');
}

List<int> getScreenSize() {
  return [stdout.terminalColumns, stdout.terminalLines];
}

clearScreen() {
  print("\x1B[2J\x1B[0;0H");
}

traverseAndPrint(Node head) {
  int index = 1;
  Node? currentNode = head;

  while (currentNode != null) {
    stdout.writeln('$index. ${currentNode.data}');
    currentNode = currentNode.next;
    index++;
  }
}

Node insertNodeAtPosition(Node head, Node newNode, int position) {
  if (position == 1) {
    newNode.next = head;
    return newNode;
  }

  Node? currentNode = head;
  int index = 1;

  while (currentNode != null && index < position - 1) {
    currentNode = currentNode.next;
    index++;
  }

  newNode.next = currentNode?.next;
  if (currentNode != null) {
    currentNode.next = newNode;
  }

  return head;
}

Node swapNode(Node head, int pos1, int pos2) {
  if (pos1 == pos2) return head;

  Node? prevNode1;
  Node? node1 = head;
  int index = 1;

  while (node1 != null && index < pos1) {
    prevNode1 = node1;
    node1 = node1.next;
    index++;
  }

  Node? prevNode2;
  Node? node2 = head;
  index = 1;

  while (node2 != null && index < pos2) {
    prevNode2 = node2;
    node2 = node2.next;
    index++;
  }

  if (node1 == null || node2 == null) return head;

  if (prevNode1 != null) {
    prevNode1.next = node2;
  } else {
    head = node2;
  }

  if (prevNode2 != null) {
    prevNode2.next = node1;
  } else {
    head = node1;
  }

  final temp = node1.next;
  node1.next = node2.next;
  node2.next = temp;

  return head;
}

Node deleteNode(Node head, int position) {
  if (position == 1) {
    return head.next ?? head;
  }

  Node? currentNode = head;
  Node? prevNode;
  int index = 1;

  while (currentNode != null && index < position) {
    prevNode = currentNode;
    currentNode = currentNode.next;
    index++;
  }

  if (prevNode != null && currentNode != null) {
    prevNode.next = currentNode.next;
  }

  return head;
}

Node activateLoop(Node head) {
  Node? currentNode = head;
  while (currentNode?.next != null) {
    currentNode = currentNode?.next;
  }
  currentNode?.next = head;
  return head;
}

Node craft(String text) {
  final pattern = RegExp(r"^\s+$");
  Node head = Node(text.isNotEmpty ? text[0] : "?");

  if (!pattern.hasMatch(text)) {
    for (int i = 1; i < text.length; i++) {
      if (!pattern.hasMatch(head.data)) {
        if (!pattern.hasMatch(text[i])) {
          head = insertNodeAtPosition(head, Node(text[i]), 0);
        }
      } else {
        head = Node(text[i]);
      }
    }
  } else {
    head = Node("?");
  }

  return activateLoop(head);
}

main() async {
  try {
    int delayDuration = 5;
    clearScreen();
    moveTo(0, 0);
    String name = "Aryo"; // Hardcoded name
    Node head = craft(name);
    clearScreen();
    moveTo(0, 0);
    int ulang = 10; // Hardcoded number of repetitions
    clearScreen();
    String selectedColor = RESET;
    List<int> screenSize = getScreenSize();

    while (ulang > 0) {
      Node? node = head;
      stdout.write(selectedColor);

      for (int j = 1; j <= screenSize[1]; j++) {
        for (int i = j % 2 == 0 ? screenSize[0] : 1;
            j % 2 == 0 ? i > 0 : i <= screenSize[0];
            j % 2 == 0 ? i-- : i++) {
          moveTo(j, i);
          stdout.write(node?.data);
          node = node?.next;
          await delay(delayDuration);
        }
      }

      selectedColor = getRandomColor(selectedColor);
      ulang--;
    }

  } catch (_) {

  }
}
