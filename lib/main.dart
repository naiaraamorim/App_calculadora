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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calculadora'),
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
  TextEditingController controllerTx1 = TextEditingController();
  TextEditingController controllerTx2 = TextEditingController();
  double num1 = 0, num2 = 0, res = 0;
  String resultadoCalc = '';

  void doAdicao() {
    setState(() {
      num1 = double.parse(controllerTx1.text);
      num2 = double.parse(controllerTx2.text);
      res = num1 + num2;
    });
  }

  void doSubtracao() {
    setState(() {
      num1 = double.parse(controllerTx1.text);
      num2 = double.parse(controllerTx2.text);
      res = num1 - num2;
    });
  }

  void doMultiplica() {
    setState(() {
      num1 = double.parse(controllerTx1.text);
      num2 = double.parse(controllerTx2.text);
      res = num1 * num2;
    });
  }

  void doDivisao() {
    setState(() {
      num1 = double.parse(controllerTx1.text);
      num2 = double.parse(controllerTx2.text);
      res = num1 / num2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 80, left: 80),
              child: TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Este campo é obrigatório';
                    }
                    return null;
                  },
                  controller: controllerTx1,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                      labelText: 'Valor 1',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 80, left: 80, top: 10),
              child: TextFormField(
                  controller: controllerTx2,
                  keyboardType: const TextInputType.numberWithOptions(),
                  decoration: const InputDecoration(
                      labelText: 'Valor 2',
                      contentPadding: EdgeInsets.all(8),
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('+'),
                    onPressed: () {
                      doAdicao();
                    },
                  ),
                  ElevatedButton(
                    child: Text('-'),
                    onPressed: () {
                      doSubtracao();
                    },
                  ),
                  ElevatedButton(
                    child: Text('*'),
                    onPressed: () {
                      doMultiplica();
                    },
                  ),
                  ElevatedButton(
                    child: Text('/'),
                    onPressed: () {
                      doDivisao();
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    controllerTx1.text = '';
                    controllerTx2.text = '';
                    res = 0;
                  });
                },
                child: const Text('Limpar')),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Text(
                '$res',
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
