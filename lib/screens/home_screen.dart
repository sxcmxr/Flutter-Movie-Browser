import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text(
                'Navigation Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.list),
              title: const Text('Popular Movies'),
              onTap: () {
                Navigator.pushNamed(context, '/list');
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings Screen'),
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to Flutter Movie Browser',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Discover the most popular movies currently trending. '
              'Browse through the list of movies and get detailed information about each one.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 32.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/list');
                },
                child: const Text('Browse Popular Movies'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
