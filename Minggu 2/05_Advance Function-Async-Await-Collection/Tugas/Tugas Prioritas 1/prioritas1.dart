Future<List<int>> listKali(List<int> data, int pengali) async {
  List<int> hasil = [];

  for (int i = 0; i < data.length; i++) {
    await Future.delayed(Duration(seconds: 1));
    int multipliedValue = data[i] * pengali;
    hasil.add(multipliedValue);
  }

  return hasil;
}

void main() async {
  List<int> inputData = [5, 2, 4, 3, 6];
  int pengali = 2;

  List<int> hasilKali = await listKali(inputData, pengali);
  print("Multiplied List: $hasilKali");
}
