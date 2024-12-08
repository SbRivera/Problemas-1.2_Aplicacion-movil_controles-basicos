class GeneradorAscii {
  /// Genera una lista de mapas con el código y el carácter ASCII correspondiente.
  List<Map<String, dynamic>> generarTablaAscii({required int inicio, required int fin}) {
    List<Map<String, dynamic>> tablaAscii = [];
    for (int i = inicio; i <= fin; i++) {
      tablaAscii.add({'codigo': i, 'caracter': String.fromCharCode(i)});
    }
    return tablaAscii;
  }
}
