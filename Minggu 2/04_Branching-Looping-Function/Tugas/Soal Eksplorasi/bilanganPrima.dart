void main() {
  int nilai = 23; 
  
  if (isPrima(nilai)) {
    print("$nilai adalah bilangan prima");
  } 
  else {
    print("$nilai bukan bilangan prima");
  }
}

bool isPrima(int nilai) {
  if (nilai <= 1) {
    return false;
  }
  
  for (int i = 2; i <= nilai / 2; i++) {
    if (nilai % i == 0) {
      return false;
    }
  }
  return true;
}
