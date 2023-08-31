class Hewan {
  var berat = 0;
}

class Mobil {
  var kapasitas;
  List<Hewan> muatan = [];

  int jumlahMuatan() {
    int total = 0;
    for (var hewan in muatan) {
      total += hewan.berat;
    }
    return total;
  }

  void tambahaMuatan(Hewan hewan){
    if (jumlahMuatan() + hewan.berat > kapasitas) {
      print("Kapasitas Mobil Penuh");
    } else {
      muatan.add(hewan);
      print("Menambahkan Hewan");
    }
  }
}

void main (){
  Hewan banteng = Hewan();
  banteng.berat = 7;
  Hewan sapi = Hewan();
  sapi.berat = 5;
  Hewan ayam = Hewan();
  ayam.berat = 2;

  Mobil mobil = Mobil();
  mobil.kapasitas = 15;
  mobil.tambahaMuatan(sapi);
  mobil.tambahaMuatan(banteng);
  mobil.tambahaMuatan(ayam);
  mobil.tambahaMuatan(sapi);
}

