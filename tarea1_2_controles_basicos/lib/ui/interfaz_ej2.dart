// interfaz_ej2.dart

import 'package:flutter/material.dart';
import '../logic/logica_ej2.dart';

void main() => runApp(CalculadoraFactorialApp());

class CalculadoraFactorialApp extends StatelessWidget {
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
      home: FactorialScreen(),
    );
  }
}

class FactorialScreen extends StatefulWidget {
  @override
  _FactorialScreenState createState() => _FactorialScreenState();
}

class _FactorialScreenState extends State<FactorialScreen> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularFactorial() {
    setState(() {
      _error = '';
      _resultado = '';
      try {
        final numero = int.parse(_controller.text);
        if (numero < 0) {
          throw FormatException("El número debe ser mayor o igual a 0.");
        }
        final factorial = calcularFactorial(numero);
        _resultado = "Factorial de $numero: $factorial";
      } catch (e) {
        _error = e is FormatException
            ? "Por favor, ingrese un número entero positivo."
            : e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Factorial"),
        centerTitle: true,
      ),
      body: Center( // Centra todo el contenido
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta la altura al contenido
            children: [
              SizedBox(
                width: 300, // Reduce el ancho del campo de texto
                child: TextField(
                  controller: _controller,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Ingrese un número",
                    labelStyle: TextStyle(color: Colors.amber),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amberAccent),
                    ),
                    errorText: _error.isEmpty ? null : _error,
                    prefixIcon: Icon(Icons.calculate, color: Colors.amber),
                  ),
                  style: TextStyle(color: Colors.amber),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton.icon(
                onPressed: _calcularFactorial,
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
