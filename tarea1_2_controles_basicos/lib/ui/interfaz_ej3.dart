import 'package:flutter/material.dart';
import '../logic/logica_ej3.dart';

class CalculadoraMCDApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.dark(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
        ),
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.amber),
        ),
      ),
      home: MCDScreen(),
    );
  }
}

class MCDScreen extends StatefulWidget {
  @override
  _MCDScreenState createState() => _MCDScreenState();
}

class _MCDScreenState extends State<MCDScreen> {
  final TextEditingController _numero1Controller = TextEditingController();
  final TextEditingController _numero2Controller = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularMCD() {
    setState(() {
      _error = '';
      _resultado = '';
      try {
        final numero1 = int.parse(_numero1Controller.text);
        final numero2 = int.parse(_numero2Controller.text);

        if (numero1 <= 0 || numero2 <= 0) {
          throw FormatException("Ambos números deben ser positivos.");
        }

        final mcd = calcularMCD(numero1, numero2);
        _resultado = "El MCD de $numero1 y $numero2 es: $mcd";
      } catch (e) {
        _error = e is FormatException
            ? "Por favor, ingrese números enteros positivos."
            : e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de MCD"),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _numero1Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Primer número",
                    labelStyle: TextStyle(color: Colors.amber),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                    errorText: _error.isEmpty ? null : _error,
                    prefixIcon: Icon(Icons.filter_1, color: Colors.amber),
                  ),
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _numero2Controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Segundo número",
                    labelStyle: TextStyle(color: Colors.amber),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                    errorText: _error.isEmpty ? null : _error,
                    prefixIcon: Icon(Icons.filter_2, color: Colors.amber),
                  ),
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _calcularMCD,
                icon: Icon(Icons.play_arrow),
                label: Text("Calcular"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
              ),
              SizedBox(height: 20),
              if (_resultado.isNotEmpty)
                Text(
                  _resultado,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.amberAccent,
                  ),
                  textAlign: TextAlign.center,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
