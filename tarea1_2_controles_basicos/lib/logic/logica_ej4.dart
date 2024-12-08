Map<int, int> factorizarNumero(int numero) {
  if (numero <= 1) {
    throw ArgumentError("El número debe ser mayor que 1.");
  }

  Map<int, int> factores = {};
  int divisor = 2;

  while (numero > 1) {
    while (numero % divisor == 0) {
      if (factores.containsKey(divisor)) {
        factores[divisor] = factores[divisor]! + 1;
      } else {
        factores[divisor] = 1;
      }
      numero ~/= divisor;
    }
    divisor++;
  }

  return factores;
}
