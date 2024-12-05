import 'package:flutter/material.dart';
import 'main.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('First Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: Text('Go back to home screen'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}
