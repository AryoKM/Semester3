# session5_routes_and_navigation

kode di atas adalah aplikasi Flutter sederhana yang menggunakan navigation routes untuk berpindah layar

## **Cara Install:**
- tekan link di bawah ini untuk download aplikasi:
https://cdn.discordapp.com/attachments/676118559612600371/1314402251124637817/app-release.apk?ex=6753a3fd&is=6752527d&hm=81ee3f3e02f3085f79e4abc18b1fd32494d578e1995c99cf7121317b965255e1&
(atau dengan mendownload repository ini dan menggunakan `flutter run` di terminal)

### **1. Struktur Dasar Aplikasi**
- **main Function**: Fungsi utama aplikasi yang menjalankan aplikasi melalui runApp(const MyApp()).

- **MyApp** Class: Ini adalah root dari aplikasi, menggunakan widget MaterialApp. Atribut utama:

- **routes**: Mendefinisikan peta rute untuk navigasi layar (dari nama rute ke widget layar yang sesuai).
	- initialRoute: Menentukan rute awal aplikasi (/, yang merujuk ke HomeScreen).

### **2. Navigasi dengan Routes**
aplikasi ini mendefinisikan 4 layar utama:
- **HomeScreen**
- **FirstScreen**
- **SecondScreen**
- **ThirdScreen**

Navigasi antar layar dilakukan menggunakan `Navigator.PushNamed()`, contoh:
```
Navigator.pushNamed(context, '/first');
```
Navigasi kembali dilakukan menggunakan:
```
Navigator.of(context).popUntil((route) => route.isFirst);
```

### **3. HomeScreen**
- **AppBar**: menampilkan judul "Home Screen"
- **Drawer**: Menu navigasi samping (`CustomDrawer`) untuk akses cepat ke layar lain.
- **BottomNavigationBar**: Navigasi di bawah layar (`CustomBottomNavigationBar`) dengan ikon dan label untuk masing-masing layar.

### **4. Custom Widgets**
#### **CustomBottomNavigationBar**
- Digunakan di semua layar untuk menampilkan bar navigasi di bawah.
- Menangani navigasi sesuai dengan tombol yang diklik:
    - Tombol pertama: Menuju `FirstScreen`.
    - Tombol kedua: Menuju `SecondScreen`.
    - Tombol ketiga: Menuju `ThirdScreen`.

#### CustomDrawer
- Menu samping yang memberikan daftar navigasi ke layar:
    - Home Screen
    - First Screen
    - Second Screen
    - Third Screen
- Setiap item menggunakan `Navigator.pushNamed` untuk berpindah ke layar tertentu.

### 5. Layar Individual (Screens)

Setiap layar (`FirstScreen`, `SecondScreen`, `ThirdScreen`) memiliki elemen berikut:
- **AppBar**:
    - Berjudul sesuai nama layar.
    - Tombol home di sudut kanan atas untuk kembali ke layar utama (`HomeScreen`).
- **Body**:
    - Tombol untuk navigasi ke layar lain.
- **CustomBottomNavigationBar** dan **CustomDrawer**:
    - Sama seperti di `HomeScreen`, untuk konsistensi navigasi.

### 6. Cara Navigasi
Pengguna dapat berpindah antar layar dengan:
- **BottomNavigationBar**: Tombol di bagian bawah layar.
- **Drawer**: Menu navigasi samping.
- **Tombol di layar utama**: Navigasi antar layar dengan tombol di tengah layar.
