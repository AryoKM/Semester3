import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeScreen(),
        '/first': (context) => FirstScreen(),
        '/second': (context) => SecondScreen(),
        '/third': (context) => ThirdScreen(),
      },
      initialRoute: '/',
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Text('Session 5 : Lab Activity - Routes & Navigation'),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}

class CustomBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home, color: Colors.red), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.green), label: 'First'),
        BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.blue), label: 'Second'),
        BottomNavigationBarItem(icon: Icon(Icons.layers, color: Colors.yellow), label: 'Third'),
      ],
      onTap: (index) {
        if (index == 0) {
          Navigator.of(context).popUntil((route) => route.isFirst);
        } else if (index == 1) {
          Navigator.pushNamed(context, '/first');
        } else if (index == 2) {
          Navigator.pushNamed(context, '/second');
        } else if (index == 3) {
          Navigator.pushNamed(context, '/third');
        }
      },
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text('Navigation Drawer', style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: Text('Home Screen'),
            onTap: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          ),
          ListTile(
            title: Text('First Screen'),
            onTap: () {
              Navigator.pushNamed(context, '/first');
            },
          ),
          ListTile(
            title: Text('Second Screen'),
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
          ListTile(
            title: Text('Third Screen'),
            onTap: () {
              Navigator.pushNamed(context, '/third');
            },
          ),
        ],
      ),
    );
  }
}
