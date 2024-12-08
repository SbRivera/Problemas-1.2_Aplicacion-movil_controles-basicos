import 'package:flutter/material.dart';
import 'ui/interfaz_ej1.dart'; // Ejercicio 1
import 'ui/interfaz_ej2.dart'; // Ejercicio 2
import 'ui/interfaz_ej3.dart'; // Ejercicio 3
import 'ui/interfaz_ej4.dart'; // Ejercicio 4
import 'ui/interfaz_ej5.dart'; // Ejercicio 5

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;

  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.yellow[700],
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.yellow[700],
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
        textTheme: const TextTheme(),
        buttonTheme: ButtonThemeData(buttonColor: Colors.yellow[700]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow[700]),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.amber[700],
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: TextStyle(color: Colors.yellow[700], fontSize: 20),
        ),
        textTheme: TextTheme(),
        buttonTheme: ButtonThemeData(buttonColor: Colors.amber[700]),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.amber[700]),
        ),
      ),
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
        isDarkMode: _isDarkMode,
        toggleDarkMode: _toggleDarkMode,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleDarkMode;

  const HomeScreen({Key? key, required this.isDarkMode, required this.toggleDarkMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("EJERCICIOS", textAlign: TextAlign.center),
        automaticallyImplyLeading: false, // Para evitar el icono de regresar
        centerTitle: true, // Centra el título en la AppBar
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PantallaAscii(inicio: 32, fin: 255, itemsPorPagina: 10)),
                ),
                child: Text("Ejercicio 1 - Tabla ASCII"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  minimumSize: Size(300, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FactorialScreen()),
                ),
                child: Text("Ejercicio 2 - Factorial"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  minimumSize: Size(300, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MCDScreen()),
                ),
                child: Text("Ejercicio 3 - MCD"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  minimumSize: Size(300, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FactorizacionScreen()),
                ),
                child: Text("Ejercicio 4 - Factorización"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  minimumSize: Size(300, 50),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PrimoScreen()),
                ),
                child: Text("Ejercicio 5 - Números Primos"),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black, backgroundColor: Colors.amber,
                  minimumSize: Size(300, 50),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IconButton(
          icon: Icon(
            isDarkMode ? Icons.light_mode : Icons.dark_mode,
            size: 40,
          ),
          onPressed: toggleDarkMode,
          color: isDarkMode ? Colors.yellow[700] : Colors.black,
        ),
      ),
    );
  }
}
