import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyObject(count: 0);
  }
}

class MyObject extends State<CounterPage> {
  int count;
  int n = 0; // Declare n at the class level

  MyObject({
    required this.count,
  });

  void incrementCounter() {
    setState(() {
      count++;
    });
  }

  void decrementCounter() {
    setState(() {
      count--;
    });
  }

  void resetCounter() {
    setState(() {
      count = 0;
    });
  }

  void showCounterValue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Counter Value'),
          content: Text('The current value of count is $count'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void square() {
    setState(() {
      count = count * count;
    });
  }

  int power(int ex) {
    int result1 = 1;
    for (int i = 0; i < ex; i++) {
      result1 *= count;
    }
    return result1;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Counter page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Count',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            count.toString(),
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  n = int.tryParse(value) ?? 0;
                });
              },
              decoration: InputDecoration(labelText: 'Enter n'),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              int result = power(n);
              setState(() {
                count = result;
              });
            },
            child: const Text('Calculate Power'),
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: incrementCounter,
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: decrementCounter,
            child: const Icon(Icons.remove),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: resetCounter,
            child: const Icon(Icons.refresh),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () => showCounterValue(context),
            child: const Icon(Icons.info),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: square,
            child: const Text('Square'),
          ),
          const SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              int result = power(3); // có thể thay đổi giá trị
              print('Power result: $result');
            },
            child: const Text('Power'),
          ),
        ],
      ),
    );
  }
}
