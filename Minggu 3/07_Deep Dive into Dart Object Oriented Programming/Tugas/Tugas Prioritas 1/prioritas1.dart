class BangunRuang{
  int panjang;
  int lebar;
  int tinggi;

  BangunRuang(this.panjang, this.lebar, this.tinggi);

  int Volume() {
    return 0; 
  }
}

class Kubus extends BangunRuang {
  int sisi;

  Kubus(this.sisi) : super(sisi, sisi, sisi);

  @override
  int Volume() {
    return sisi * sisi * sisi;
  }
}

class Balok extends BangunRuang {
  Balok(int panjang, int lebar, int tinggi) : super(panjang, lebar, tinggi);

  @override
  int  Volume() {
    return panjang * lebar * tinggi;
  }
}

void main() {
  BangunRuang bangun1 = Kubus(5); 
  BangunRuang bangun2 = Balok(3, 4, 5); 

  print(bangun1.Volume());
  print(bangun2.Volume());
}