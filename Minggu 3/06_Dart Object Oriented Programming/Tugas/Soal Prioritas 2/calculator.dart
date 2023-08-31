class Calculator{
  double Penjumlahan(double bilangan1, double bilangan2) {
    return bilangan1 + bilangan2;
  }

  double Pengurangan(double bilangan1, double bilangan2) {
    return bilangan1 - bilangan2;
  }

  double Perkalian(double bilangan1, double bilangan2) {
    return bilangan1 * bilangan2;
  }

  double Pembagian(double bilangan1, double bilangan2) {
    return bilangan1 / bilangan2;
  }
}

void main (){
  double angka1 = 2;
  double angka2 = 4;
  Calculator calculator = Calculator();

  print("$angka1 + $angka2 = ${calculator.Penjumlahan(angka1, angka2)}");
  print("$angka1 - $angka2 = ${calculator.Pengurangan(angka1, angka2)}");
  print("$angka1 x $angka2 = ${calculator.Perkalian(angka1, angka2)}");
  print("$angka1 / $angka2 = ${calculator.Pembagian(angka1, angka2)}");

}

