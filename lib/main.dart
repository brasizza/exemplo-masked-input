import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final moneyMasked = MoneyMaskedTextController(thousandSeparator: '.', precision: 3);
  String digitado = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Digite o peso',
            ),
            TextFormField(
              controller: moneyMasked,
              enableInteractiveSelection: true,
              autovalidateMode: AutovalidateMode.always,
              textAlign: TextAlign.end,
              style: const TextStyle(fontSize: 20),
              keyboardType: const TextInputType.numberWithOptions(decimal: false, signed: false),
              decoration: const InputDecoration(
                hintText: '0,000',
                hintStyle: TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
              ),
            ),
            Text(digitado),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    digitado = moneyMasked.text;
                  });
                },
                child: const Text('Salvar'))
          ],
        ),
      ),
    );
  }
}
