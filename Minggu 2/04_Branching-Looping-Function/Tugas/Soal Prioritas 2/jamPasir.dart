void main (){
int tinggi = 6;

  for (int i = tinggi; i >= 1; i--){
  print(" " * (tinggi - i) + "*" * (2 * i - 1));
  } 
  for (int i = 2; i <= tinggi; i++){
  print(" " * (tinggi - i) + "*" * (2 * i - 1));
  } 
}