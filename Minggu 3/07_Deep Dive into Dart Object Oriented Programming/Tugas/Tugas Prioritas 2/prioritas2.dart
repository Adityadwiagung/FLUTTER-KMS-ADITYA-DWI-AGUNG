class Matematika{

  int hasil() {
    return 0; 
  }
}

class KelipatanPersektuanTerkecil extends Matematika {
  int kpk(int nilai1, int nilai2) {
  int max;
  if (nilai1 > nilai2) {
    max = nilai1;
  } else {
    max = nilai2;
  }
    while (true) {
      if (max % nilai1 == 0 && max % nilai2 == 0) {
        return max;
      }
      max++;
    }
  }

  @override
  int hasil() {
    int hasilKPK = kpk(2, 5); // Ganti angka sesuai kebutuhan
    return hasilKPK;
  }
}

class FaktorPersekutuanTerbesar extends Matematika {
int fpb(int nilai1, int nilai2) {
    while (nilai2 != 0) {
      int temp = nilai2;
      nilai2 = nilai1 % nilai2;
      nilai1 = temp;
    }
    return nilai1;
  }

  @override
  int hasil() {
    int hasilFPB = fpb(9, 15); // Ganti angka sesuai kebutuhan
    return hasilFPB;
  }

}

void main() {
  Matematika operator = KelipatanPersektuanTerkecil();
  print(operator.hasil());

  operator = FaktorPersekutuanTerbesar();
  print(operator.hasil());
}
