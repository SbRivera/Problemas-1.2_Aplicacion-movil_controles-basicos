import 'package:flutter/material.dart';
import '../logic/logica_ej1.dart';

class PantallaAscii extends StatefulWidget {
  final int inicio;
  final int fin;
  final int itemsPorPagina;

  const PantallaAscii({
    Key? key,
    required this.inicio,
    required this.fin,
    required this.itemsPorPagina,
  }) : super(key: key);

  @override
  _PantallaAsciiState createState() => _PantallaAsciiState();
}

class _PantallaAsciiState extends State<PantallaAscii> {
  final GeneradorAscii _generadorAscii = GeneradorAscii();
  int _paginaActual = 0;
  late List<Map<String, dynamic>> _tablaAscii;

  @override
  void initState() {
    super.initState();
    _tablaAscii = _generadorAscii.generarTablaAscii(
      inicio: widget.inicio,
      fin: widget.fin,
    );
  }

  void _paginaSiguiente() {
    setState(() {
      if ((_paginaActual + 1) * widget.itemsPorPagina < _tablaAscii.length) {
        _paginaActual++;
      }
    });
  }

  void _paginaAnterior() {
    setState(() {
      if (_paginaActual > 0) {
        _paginaActual--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    int indiceInicio = _paginaActual * widget.itemsPorPagina;
    int indiceFin = indiceInicio + widget.itemsPorPagina;
    List<Map<String, dynamic>> elementosPaginaActual = _tablaAscii.sublist(
      indiceInicio,
      indiceFin > _tablaAscii.length ? _tablaAscii.length : indiceFin,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Tabla ASCII'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.amber, // Fondo oscuro
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: elementosPaginaActual.length,
                itemBuilder: (context, index) {
                  final elemento = elementosPaginaActual[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
                    elevation: 2,
                    child: ListTile(
                      title: Text(
                        'Código: ${elemento['codigo']} - Carácter: ${elemento['caracter']}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.amber, // Texto en color amarillo en modo oscuro
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: _paginaAnterior,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white30,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                  child: Text('Anterior', style: TextStyle(fontSize: 16)),
                ),
                Text(
                  'Página ${_paginaActual + 1}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                ElevatedButton(
                  onPressed: _paginaSiguiente,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white30,
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                  ),
                  child: Text('Siguiente', style: TextStyle(fontSize: 16)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
