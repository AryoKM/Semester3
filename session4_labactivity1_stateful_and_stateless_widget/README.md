# session4_labactivity1_stateful_and_stateless_widget

dalam flutter, Widget terbagi menjadi dua yaitu *Stateless Widget* dan *Stateful Widget*. Stateless Widget adalah widget yang tidak dapat berubah setelah dibuat. Dengan begitu, eidget ini cocok digunakan untuk UI yang bersifat statis sperti teks, gambar dsb yang tidak memerlukan interaksi pengguna. Sedangkan stateful widget memiliki status yang dapat berubah selama life cycle nya sehingga cocok digunakan untuk elemen UI yang membutuhkan interaksi atau data dinamis seperti tombol yang menghitung jumlah klik dan tombol input forulir.

Perubahan Data
- Stateless Widget tidak bisa di ubah setelah di buat
- Stateful Widget bisa berubah melalui status internal

State Management
- Stateless Widget tidak memiliki internal state
- Stateful Widget memiliki state yang dikelola dalam widget

Responsif
- Stateless Widget tidak responsif terhadap interaksi
- Stateful Widget responsif terhadap interaksi atau perubahan data

Kinerja
- Stateless Widget lebih ringan karena tidak memerlukan logical state
- Stateful Widegt lebih berat dari pada stateless karena memelihara state
