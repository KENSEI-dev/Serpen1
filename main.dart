import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Widgets Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String _message='Hello Flutter!';
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text('Add Elements Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: <Widget>[
            Image.asset('assets/images/flutter.png'),
            Text(_message, style: Theme.of(context).textTheme.headlineMedium),
            Text('Counter:$_counter',style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height:20),
            ElevatedButton(onPressed: _incrementCounter, child: const Text('Click Me')),
            const SizedBox(height: 10),
            OutlinedButton(onPressed: () {}, child: const Text('Outline Button')),
            const SizedBox(height: 10),
            FilledButton(onPressed: () {}, child: const Text('Filled Button')),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: 'Enter Text')),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: 10, 
                itemBuilder: (context, index) => ListTile(title: Text('Item$index')),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed:_incrementCounter,
        tooltip: 'Increment',
        child:const Icon(Icons.add),
      ),
    );
  }
}
