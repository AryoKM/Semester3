import 'package:flutter/material.dart';
void main() => runApp(const TrailblazerApp());

class TrailblazerApp extends StatelessWidget {
  const TrailblazerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: AppBarExample(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AppBarExample extends StatelessWidget {
  const AppBarExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            const Color.fromARGB(255, 24, 25, 38), // Changed app bar color
        leading: IconButton(
          icon: const Icon(Icons.menu,
              color: Color.fromARGB(
                  255, 202, 211, 245)), // Changed menu icon color
          tooltip: 'Menu',
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.home),
                        title: Text('Home'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.info),
                        title: Text('About'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        title: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child:
                  Image.asset('assets/logo.png', fit: BoxFit.cover, height: 30),
            ),
            const Text('Astral Express Crew',
                style: TextStyle(color: Color.fromARGB(255, 202, 211, 245), fontSize: 17, fontFamily: 'DINPro')),
          ],
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 202, 211, 245),
            ),
            tooltip: 'Search',
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('This is a snackbar idek what this is')));
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.tune,
              color: Color.fromARGB(255, 202, 211, 245),
            ),
            tooltip: 'Go to the next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute<void>(
                builder: (BuildContext context) {
                  return Scaffold(
                    appBar: AppBar(
                      backgroundColor: Colors.blueGrey, // Changed app bar color
                      title: const Text('Next page'),
                    ),
                    body: const Center(
                      child: Text(
                        'This is the next page',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  );
                },
              ));
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(30.0),
        color:
            const Color.fromARGB(255, 36, 39, 58), // Changed background color
        child: GridView.count(
          crossAxisCount: 2,
          children: [
            Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: Stelle'),
                          ),
                          body: const Center(
                            child: 
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                radius: 75,
                                backgroundImage: AssetImage('assets/stelle.png'),
                              ),
                              SizedBox(height: 20),
                              Text(
                                'Stelle',
                                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.purple),
                              ),
                              SizedBox(height: 15),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 32),
                                child: Text(
                                  'I like my baseball bat',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20, color: Colors.purple),
                                ),
                              ),
                            ],
                          ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/stelle.png'),
                ),
              ),
            ),
                        Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: March 7th'),
                          ),
                          body: const Center(
                            child: Text(
                              'coming soon: information about March 7th',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/march.png'),
                ),
              ),
            ),
                        Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: Dan Heng'),
                          ),
                          body: const Center(
                            child: Text(
                              'coming soon: information about Dan Heng',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/danheng.png'),
                ),
              ),
            ),
                        Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: Himeko'),
                          ),
                          body: const Center(
                            child: Text(
                              'coming soon: information about Himeko',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/himeko.png'),
                ),
              ),
            ),
                        Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: Welt'),
                          ),
                          body: const Center(
                            child: Text(
                              'coming soon: information about Welt',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/welt.png'),
                ),
              ),
            ),
                        Card(
              margin: const EdgeInsets.all(15.0),
              color: const Color.fromARGB(
                  255, 73, 77, 100), // Changed background color of the card
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute<void>(
                      builder: (BuildContext context) {
                        return Scaffold(
                          appBar: AppBar(
                            backgroundColor:
                                const Color.fromARGB(255, 183, 189, 248), // Changed app bar color
                            title: const Text('Member Details: Pompom'),
                          ),
                          body: const Center(
                            child: Text(
                              'coming soon: information about Pompom',
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        );
                      },
                    ));
                  },
                  child: Image.asset('assets/pompom.png'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
