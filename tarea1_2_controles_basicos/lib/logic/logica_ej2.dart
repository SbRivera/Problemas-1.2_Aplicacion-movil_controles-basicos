// logica_ej2.dart

int calcularFactorial(int numero) {
  if (numero < 0) {
    throw ArgumentError("El número debe ser no negativo.");
  }
  int resultado = 1;
  for (int i = 1; i <= numero; i++) {
    resultado *= i;
  }
  return resultado;
}
