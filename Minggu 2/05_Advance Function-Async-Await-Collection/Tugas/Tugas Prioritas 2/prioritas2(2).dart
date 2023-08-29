void main(){
  List<int> nilai = [7, 5, 3, 5, 2, 1];
  double sum = 0;

  for(int i = 0; i < nilai.length; i++){
    sum += nilai[i] / nilai.length;
  }
  int bilanganBulat = sum.ceil();

  print(bilanganBulat);
}

