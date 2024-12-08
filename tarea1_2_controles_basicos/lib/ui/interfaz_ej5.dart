import 'package:flutter/material.dart';
import '../logic/logica_ej5.dart';
void main() => runApp(PrimoApp());

class PrimoApp extends StatelessWidget {
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
      home: PrimoScreen(),
    );
  }
}

class PrimoScreen extends StatefulWidget {
  @override
  _PrimoScreenState createState() => _PrimoScreenState();
}

class _PrimoScreenState extends State<PrimoScreen> {
  final TextEditingController _controller = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcularPrimo() {
    setState(() {
      _error = '';
      _resultado = '';
      try {
        final numero = int.parse(_controller.text);
        final esNumeroPrimo = esPrimo(numero);
        _resultado = esNumeroPrimo
            ? "El número $numero es primo."
            : "El número $numero no es primo.";
      } catch (e) {
        _error = e is FormatException
            ? "Por favor, ingrese un número entero entre 3 y 32767."
            : e.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verificar Número Primo"),
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
                onPressed: _calcularPrimo,
                icon: Icon(Icons.play_arrow),
                label: Text("Verificar"),
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
