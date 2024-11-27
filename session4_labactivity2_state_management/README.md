# session4_labactivity1_state_management
(previously lab activity 2)

pada aplikasi Flutter yang lebih besar, pengelolahan status seluruh aplikasi seperti *user authentication*, *shopping carts*, dan state management lainnya penting untuk pemeliharaan, skalabilitas, dan performa. Penggunaan state management secara efektif bisa membantu memecahkan masalah yang disebabkan oleh interaksi UI yang kompleks dan aliran data yang saling bergantung satu dengan yang lain.

keuntungan menggunakan state management antara lain; meningkatkan efisiensi dengan mengurangi redundansi, menignkatkan skalabilitas dengan mempermudah penambahan fitur baru tanpa harus banyak mengubah atau merombak struktur aplikasi, dan *global management* yang lebih teroganisir untuk hal seperti *user authentication* dan *shopping cart*

### contoh:
- menyimpan status login user dengan state management seperti provider atau riverpod yang menyimpan informasi pada aplikasi apakah user sudah pernah login atau belum, sehingga tidak perlu memeriksa status login secara manal di setiap layar
- mengelola daftar barang yang di tambahkan dalam sebuah *shopping cart* sehingga setiap layar (seperti katalog produk atau checkout) bisa dengan mudah mengakses data yang sama.

dengan mengutilisasikan state management dengan optimal, aplikasi yang dibuat bisa menjadi lebih efisien dan mudah dikelola.
