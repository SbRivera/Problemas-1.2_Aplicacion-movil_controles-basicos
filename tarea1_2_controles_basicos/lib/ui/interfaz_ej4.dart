import 'package:flutter/material.dart';
import '../logic/logica_ej4.dart';

void main() => runApp(FactorizacionApp());

class FactorizacionApp extends StatelessWidget {
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
      home: FactorizacionScreen(),
    );
  }
}

class FactorizacionScreen extends StatefulWidget {
  @override
  _FactorizacionScreenState createState() => _FactorizacionScreenState();
}

class _FactorizacionScreenState extends State<FactorizacionScreen> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularFactorizacion() {
    setState(() {
      _error = '';
      _resultado = '';
      try {
        final numero = int.parse(_controller.text);
        if (numero <= 1) {
          throw FormatException("El número debe ser mayor que 1.");
        }

        final factores = factorizarNumero(numero);
        String resultadoTemp = '';
        factores.forEach((factor, potencia) {
          resultadoTemp += "$factor elevado a la potencia $potencia\n";
        });
        _resultado = resultadoTemp;
      } catch (e) {
        _error = e is FormatException
            ? "Por favor, ingrese un número entero positivo mayor a 1."
            : e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Factorización de Número"),
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
                onPressed: _calcularFactorizacion,
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
