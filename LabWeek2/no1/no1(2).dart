class Siswa {
  String nama;
  int IDsiswa;
  double nilai;

  Siswa(this.nama, this.IDsiswa, this.nilai);

  void present() {
    print('\nnama siswa: $nama');
    print('siswa ID: $IDsiswa');
    print('nilai: $nilai');
  }

  bool lulus() {
    return nilai >= 70;
  }
}