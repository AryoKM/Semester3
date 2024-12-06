# session5_assignments_navigation

## cara install dan pemakaian:
1. download folder directory ini dengan menggunakan [website ini](https://download-directory.github.io/) dan extract file yang telah di download
2. buka folder ini dalam IDE (Visual Studio Code, android studio, dsb)
3. dalam terminal, jalankan `flutter pub get` untuk menginstal dependensi yang dibutuhkan
4. dalam terminal yang sama (atau yang baru), jalankan `flutter run` untuk memulai aplikasinya

jika ingin mendownload aplikasi jadinya saja, tekan [link ini](https://cdn.discordapp.com/attachments/676118559612600371/1314696662320414823/app-release.apk?ex=6754b62e&is=675364ae&hm=6162da0ec6729bc4905c6888f43b1e0713c26963df74b9346939706eded7fbd5&)

### **Cara Menggunakan Aplikasi**

1. **Tampilan Utama**
    - Ketika aplikasi dibuka, Anda akan diarahkan ke halaman utama yang memiliki tiga tab di bagian bawah:
        - **First Page**: Menampilkan teks "This is the first page :D".
        - **Second Page**: Menampilkan teks "This is the second page :v".
        - **Dynamic Screen**: Halaman untuk menghasilkan dan menavigasi ke layar dinamis.
        
2. **Navigasi Antara Halaman**
    
    - Gunakan **Bottom Navigation Bar** untuk berpindah di antara tiga halaman utama:
        - **First Page**: Klik ikon rumah.
        - **Second Page**: Klik ikon daftar.
        - **Dynamic Screen**: Klik ikon input.
        
3. **Menggunakan First Page dan Second Page**
    
    - Pada **First Page** dan **Second Page**, terdapat tombol **"Go to Details Screen"**:
        1. Klik tombol tersebut untuk berpindah ke **Details Screen**.
        2. **Details Screen** akan menampilkan teks data yang dikirim dari halaman sebelumnya, seperti _"from page 1 :D"_ atau _"from page 2 :v"_.
    - Di **Details Screen**, klik tombol **"Go Back"** untuk kembali ke halaman sebelumnya.
    
4. **Menggunakan Dynamic Screen**
    
    - Pada **Dynamic Screen**:
        1. Masukkan angka pada kolom input (contoh: "3").
        2. Klik tombol **"Generate Screens"** untuk membuat daftar layar dinamis.
        3. Pilih salah satu layar dari dropdown untuk diarahkan ke halaman dinamis.
    - Halaman dinamis menampilkan teks seperti _"This is dynamic screen X"_ (X adalah angka layar yang dipilih).

### Contoh Penggunaan
    1. Masuk ke aplikasi dan pilih Dynamic Screen di navigasi bawah.
    2. Masukkan angka "2" lalu klik Generate Screens.
    3. Pilih Dynamic Screen 1 dari dropdown untuk membuka layar dinamis pertama.

### Approach
Aplikasi ini di buat menggunakan **GetX** untuk manajemen state dan navigasi. Struktur modularnya memanfaatkan **BottomNavigationBar** untuk navigasi utama, dengan dukungan **named routes** dan parameter dinamis untuk halaman interaktif. State dikelola melalui `StatefulWidget`, memungkinkan input pengguna menghasilkan konten dinamis, Dengan fallback halaman untuk rute yang tidak valid (error handling).

### Challenges
Tantangan yang saya hadapi dalam pembuatan aplikasi ini adalah bagaimana cara mengimplementasikan cara untuk dengan gampang memilih dynamic screen yang telah di generate. Awalnya, saya ingin membuat page terpisah yang digunakan untuk menampilkan semua layar yang telah di generate, tetapi saya mendapatkan bug dimana jika saya kembali, page yang telah di generate tidak dihapuskan dari memori. Setelah beberapakali di utak atik, saya memutuskan untuk membuat dropdown sederhana. Adapula tantangan kecil yang saya hadapi yaitu mengirim data dari screen 1 dan screen 2 ke halaman detail.

### Advanced Features
advanced features yang saya implementasikan adalah tombol menu dropdown sederhana agar user bisa dengan gampang memilih dan menavigasi dynamic screen yang telah di generate oleh hasil inputan.