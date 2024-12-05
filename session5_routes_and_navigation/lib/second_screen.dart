import 'package:flutter/material.dart';
import 'main.dart';

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/first');
          },
          child: Text('Go Back to First Screen'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}
