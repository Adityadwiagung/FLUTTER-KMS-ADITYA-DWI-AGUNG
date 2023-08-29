Future<int> menghitungFaktorial (int faktorial) async {
  await Future.delayed(Duration(seconds: 1));
  int hasil = 1;
  for (int i = 1; i <= faktorial; i++){
    hasil *= i;
  }
  
  return hasil;
}

void main() async {
    int faktorial = 5;

    int jumlahFaktorial = await menghitungFaktorial(faktorial);
    print(jumlahFaktorial);




}
