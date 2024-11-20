import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Browser App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const BrowserPage(title: 'Navegador Web'),
    );
  }
}

class BrowserPage extends StatelessWidget {
  const BrowserPage({super.key, required this.title});
  final String title;

  Future<void> _launchURL(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Escolha um site para abrir:',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _launchURL('https://osidosos.com.br'),
                child: const Text('Abrir Os Idosos'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _launchURL('https://google.com'),
                child: const Text('Abrir Google'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => _launchURL('https://flutter.dev'),
                child: const Text('Abrir Flutter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
