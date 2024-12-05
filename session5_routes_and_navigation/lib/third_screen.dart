import 'package:flutter/material.dart';
import 'main.dart';

class ThirdScreen extends StatefulWidget {
  @override
  _ThirdScreenState createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Third Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
          child: Text('Go Back to Second Screen'),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(),
      drawer: CustomDrawer(),
    );
  }
}
