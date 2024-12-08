bool esPrimo(int numero) {
  if (numero < 3 || numero > 32767) {
    throw ArgumentError("El número debe estar entre 3 y 32767.");
  }

  for (int i = 2; i <= numero ~/ 2; i++) {
    if (numero % i == 0) {
      return false;
    }
  }
  return true;
}
