class Buku {
  var id;
  String judul;
  String penerbit;
  double harga;
  String kategori;

  Buku(this.id, this.judul, this.penerbit, this.harga, this.kategori);
  
}

class TokoBuku {
  List<Buku> bukuToko = [];

  void addBook(var id, String judul, String penerbit, double harga, String kategori){
    Buku newBook = Buku(id, judul, penerbit, harga, kategori);
    bukuToko.add(newBook);
    print("Buku $judul berhasil ditambahkan");
  }

  void removeBuku(var id){
    int hapusBuku = -1;
    for (int i = 0; i < bukuToko.length; i++) {
      if (bukuToko[i].id == id) {
        hapusBuku = i;
        break;
      }
    }

    if (hapusBuku != -1) {
      String hapusJudul = bukuToko[hapusBuku].judul;
      bukuToko.removeAt(hapusBuku);
      print('Buku berhasil dihapus: $hapusJudul');
    } else {
      print('Buku dengan ID $id tidak ditemukan.');
    }
  }

  void getBuku(){
    if(bukuToko.isEmpty){
      print("Buku Kosong");
    }else{
      for(var buku in bukuToko){
        print("${buku.id}: ${buku.judul} ${buku.penerbit} ${buku.kategori} ${buku.harga}");
      }
    }
  }
}

void main (){
  var tokoBuku = TokoBuku();

  tokoBuku.addBook("A1", "Complete Flutter 2023", "Alterra", 20000, "Programming");
  tokoBuku.addBook("A2", 'Become master in UI/UX ', 'Alterra', 50000, 'Programming');

  tokoBuku.getBuku();

  tokoBuku.removeBuku("A1");

  tokoBuku.getBuku();

}