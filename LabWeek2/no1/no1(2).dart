class Siswa {
  String nama;
  int IDsiswa;
  double nilai;

  Siswa(this.nama, this.IDsiswa, this.nilai);

  void present() {
    print('\nnama siswa: $nama\nsiswa ID: $IDsiswa\nnilai: $nilai');
  }

  bool lulus() {
    return nilai >= 70;
  }
}