Summary:

Ada beberapa point yang saya pelajari pada materi kali ini yaitu:
1. Terdapat 2 tipe child yaitu Single Child Layout atau bisa di sebut child dan Multiple Child Layout atau yang disebut children.
Contoh dari single child layout ada Container yang berfungsi untuk membuat semuah box yang membungkus widget lain dan memiliki margin padding dan border.

2. Contoh dari single child layout ada Container yang berfungsi untuk membuat semuah box yang membungkus widget lain dan memiliki margin padding dan border.
lalu ada center yang fungsinya juga sama yaitu membuat sebuah box untuk membungkus widget lain dan menempatkannya pada posisi tengah
lalu ada juga sizebox yang juga membungkus widget lain yang hanya dapat mengatur lebar dan tingginya tidak seperti container yang memiliki margin dan padding

3. Contoh dari Multi Child Layout atau children yaitu Column yang mengatur widget children secara vertikal
lalu ada Row yang fungsinya mirip dengan Column tetapi ini secara horizontal
Selanjutnya ada ListView dimana listview ini dapat mengatur suatu posisi baik secara vertikal maupun horizontal. Terdapat beberapa jenis ListView yaitu ListView standar, lalu ada ListVie.builder yang hanya membangun item yang terlihat di layar dan cocok untuk suatu data yang dinamis dan panjang dan juga ListView.separated yang sama evisiennya dengan listview builder dan dapat memisahkan item dengan widget divider, serta ada ListView.custom yang memberi lebih banyak kontrol pada item yang ada pada listview
Selanjutnya ada GridView dimana gridview ini mengatur widget dalam bentuk galeri seperit kotak kotak. Gridview juga memiliki macamnya yaitu ada GridView.count yang dapat mengatur langsung berapa banyak jumalh grid yang diinginkan pada crossAxisCount, contoh crossAxisCount: 2. Lalu ada juga GridView.builder yang dapat digunnakan jika kita memiliki daftar item yang panjang dan dinamis dalam bentuk grid. Selanjutnya ada GridView.extent yang memungkinkan kita untuk membuat tampilan grid dengan lebar dan tinggi yang sama. dan terakhir terdapat GridView.custom yang memberi lebih banyak kontrol aats bagaimana tampilan grid yang diinginkan
