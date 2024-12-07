import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Session 5 Assignments - Navigation',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/details', page: () => const DetailsScreen()),
        GetPage(name: '/dynamic/:id', page: () => const DynamicScreen()),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => const NotFoundScreen()), // just in case ada error
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const SectionOneScreen(),
    const SectionTwoScreen(),
    InputScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Session 5 Assignment')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'First Page'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Second Page'),
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Dynamic Screen'),
        ],
      ),
    );
  }
}

class SectionOneScreen extends StatelessWidget {
  const SectionOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is the first page :D'),
          ElevatedButton(
        onPressed: () {
          Get.toNamed('/details', arguments: 'from page 1 :D');
        },
            child: const Text('Go to Details Screen'),
          ),
        ],
      ),
    );
  }
}

class SectionTwoScreen extends StatelessWidget {
  const SectionTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('This is the second page :v'),
          ElevatedButton(
        onPressed: () {
          Get.toNamed('/details', arguments: 'from page 2 :v');
        },
            child: const Text('Go to Details Screen'),
          ),
        ],
      ),
    );
  }
}

class InputScreen extends StatefulWidget {
  InputScreen({super.key});

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController _controller = TextEditingController();
  List<int> _generatedScreens = [];

  void _generateScreens() {
    int count = int.tryParse(_controller.text) ?? 0;
    if (count > 500) { // supaya tidak lag kalau terlalu banyak
      count = 500;
    }
    setState(() {
      _generatedScreens = List<int>.generate(count, (i) => i + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter number of screens (max 500)'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generateScreens,
            child: const Text('Generate Screens'),
          ),
          const SizedBox(height: 20),
          if (_generatedScreens.isNotEmpty)
            DropdownButton<int>(
              hint: const Text('Select a screen'),
              items: _generatedScreens.map((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('Dynamic Screen $value'),
                );
              }).toList(),
              onChanged: (int? value) {
                if (value != null) {
                  Get.toNamed('/dynamic/$value');
                }
              },
            ),
        ],
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Get.arguments ?? 'No data provided';
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Passed Data: $data'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back();
              },
              child: const Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}

class DynamicScreen extends StatelessWidget {
  const DynamicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.parameters['id'];
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Screen $id')),
      body: Center(
        child: Text('This is dynamic screen $id'),
      ),
    );
  }
}

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Not Found')),
      body: const Center(
        child: Text('Page not found'),
      ),
    );
  }
}