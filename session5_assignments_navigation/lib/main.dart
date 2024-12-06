import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

// Main App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Advanced Navigation App',
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const HomeScreen()),
        GetPage(name: '/details', page: () => const DetailsScreen()),
        GetPage(name: '/dynamic/:id', page: () => const DynamicScreen()),
      ],
      unknownRoute: GetPage(name: '/notfound', page: () => const NotFoundScreen()),
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
      appBar: AppBar(title: const Text('Home')),
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Section 1'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Section 2'),
          BottomNavigationBarItem(icon: Icon(Icons.input), label: 'Input'),
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
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed('/details', arguments: 'Data from Section 1');
        },
        child: const Text('Go to Details Screen'),
      ),
    );
  }
}

class SectionTwoScreen extends StatelessWidget {
  const SectionTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Get.toNamed('/details', arguments: 'Data from Section 2');
        },
        child: const Text('Go to Details Screen'),
      ),
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Enter number of screens'),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              int count = int.tryParse(_controller.text) ?? 0;
              for (int i = 1; i <= count; i++) {
                Get.toNamed('/dynamic/$i');
              }
            },
            child: const Text('Generate Screens'),
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
