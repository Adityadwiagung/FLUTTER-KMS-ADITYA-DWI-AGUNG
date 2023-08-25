void main (){
  int faktorial = 10;
  int faktorial1 = 40;
  int faktorial2 = 50;

  int n1 = 1;
  for (int i = 1; i <= faktorial; i++){
    n1 *= i;
  }
  print(n1);

  BigInt n2 = BigInt.from(1);
  for (int i = 1; i <= faktorial1; i++){

    n2 *= BigInt.from(i);
  }
  print(n2);

  BigInt n3 = BigInt.from(1);
  for (int i = 1; i <= faktorial2; i++){

    n3 *= BigInt.from(i);
  }
  print(n3);

}