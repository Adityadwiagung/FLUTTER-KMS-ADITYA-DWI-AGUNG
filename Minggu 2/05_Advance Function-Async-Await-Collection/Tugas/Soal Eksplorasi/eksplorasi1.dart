void main() async {
  List<String> nama = ["agung", "doni", "qonita", "aldi", "doni", "qonita"];
  List<String> namaUnik = [];

  for (String item in nama){
    if(!namaUnik.contains(item)){
      namaUnik.add(item);
    }
  }

  print (nama);
  print(namaUnik);

}