import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => GlobalState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counter App uwu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF8aadf4)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class GlobalState extends ChangeNotifier {
  final List<CounterData> _counters = [];

  List<CounterData> get counters => List.unmodifiable(_counters);

  void addCounter() {
    _counters.add(CounterData());
    notifyListeners();
  }

  void removeCounter(int index) {
    _counters.removeAt(index);
    notifyListeners();
  }

  void incrementCounter(int index) {
    _counters[index].value++;
    notifyListeners();
  }

  void decrementCounter(int index) {
    if (_counters[index].value > 0) {
      _counters[index].value--;
      notifyListeners();
    }
  }

  void updateColor(int index, Color color) {
    _counters[index].color = color;
    notifyListeners();
  }

  void updateLabel(int index, String label) {
    _counters[index].label = label;
    notifyListeners();
  }

  void reorderCounters(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) newIndex--;
    final counter = _counters.removeAt(oldIndex);
    _counters.insert(newIndex, counter);
    notifyListeners();
  }
}

class CounterData {
  int value = 0;
  Color color = const Color.fromARGB(255, 183, 189, 248);
  String label = "Counter";
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final globalState = Provider.of<GlobalState>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter uwu'),
        backgroundColor: const Color.fromARGB(255, 183, 189, 248),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  backgroundColor: const Color(0xffcad3f5),
                  title: const Text('Help'),
                  content: const Text('Press [+] button on the bottom right to add counter',
                  style: TextStyle(fontSize: 15),),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            );
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xff24273a),
      body: ReorderableListView.builder(
        onReorder: (oldIndex, newIndex) =>
            globalState.reorderCounters(oldIndex, newIndex),
        itemCount: globalState.counters.length,
        itemBuilder: (context, index) {
          final counter = globalState.counters[index];
          return ListTile(
            key: ValueKey(counter),
            title: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: counter.color),
                    decoration: InputDecoration(
                      hintText: counter.label,
                      hintStyle: TextStyle(color: counter.color),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: counter.color),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: counter.color),
                      ),
                    ),
                    onSubmitted: (text) => globalState.updateLabel(index, text),
                  ),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (Widget child, Animation<double> animation) {
                    return ScaleTransition(child: child, scale: animation);
                  },
                  child: Text(
                    counter.value.toString(),
                    key: ValueKey<int>(counter.value),
                    style: TextStyle(color: counter.color, fontSize: 18),
                  ),
                ),
              ],
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.add, color: counter.color),
                  onPressed: () => globalState.incrementCounter(index),
                ),
                IconButton(
                  icon: Icon(Icons.remove, color: counter.color),
                  onPressed: () => globalState.decrementCounter(index),
                ),
                IconButton(
                  icon: Icon(Icons.color_lens, color: counter.color),
                  onPressed: () => _pickColor(context, counter.color, (color) {
                    if (color != null) globalState.updateColor(index, color);
                  }),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: counter.color),
                  onPressed: () => globalState.removeCounter(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: globalState.addCounter,
        child: const Icon(Icons.add),
      ),
    );
  }

  void _pickColor(BuildContext context, Color initialColor,
      ValueChanged<Color?> onColorSelected) {
    showDialog(
      context: context,
      builder: (context) {
        Color selectedColor = initialColor;
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 202, 211, 245),
          title: const Text('Pick a Color'), titleTextStyle: const TextStyle(color: Color(0xff24273a), fontSize: 30),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: initialColor,
              onColorChanged: (color) => selectedColor = color,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel', style: TextStyle(color: Color(0xff24273a), fontSize: 20)),
            ),
            TextButton(
              onPressed: () {
                onColorSelected(selectedColor);
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: TextStyle(color: Color(0xff24273a), fontSize: 20)),
            ),
          ],
        );
      },
    );
  }
}
