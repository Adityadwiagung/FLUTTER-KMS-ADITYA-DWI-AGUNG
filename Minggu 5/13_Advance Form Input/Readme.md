Summary: 

3 Hal yang saya pelajari pada materi kali ini yaitu:
1. Date Picker merupakan sebuah widget dimana user dapat memasukkan tanggal. Hal ini dapat berguna ketika user ingin memasukkan tanggal lahir, tiker pemesanan dll. DatePicker memiliki fungsi bawaan ShowDatePicker dan menggunakan library intl serta memiliki tipe data future. Berikut basic Code dari DatePicker:
final selectDate = await showDatePicker(
context: context, 
initialDate: currentDate, 
firstDate: DateTime(1990), 
lastDate: DateTime(currentDate.year + 5)

2.  Color Picer merupakan sebuah widget dimana user dapat memasukkan warna. untuk menggunakan Color Picker harus menggunakan library flutter_colorpicker. Color Picker memiliki 3 varian yang dapat digunakan yaitu BlockPicker, ColorPicker dan SlidePicker.

3. File Picker merupakan widget yang digunaka untuk dapat mengakses storage dan digunakan untuk memilih dan membuka file. File Picker memiliki 2 library yang dapat digunakan yaitu file_picker yaitu untuk membuka akses storage dan memilih file dan kemudian open_file untuk dapat membuka file yang dipilih.