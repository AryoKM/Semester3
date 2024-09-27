main() {
  const int jumlahmesincuci = 3;
  const int jumlahpenghuni = 5;

  const double durasiMesinCuci = 2.0;
  const double durasiCuciPenghuni = 1.5;

  double totaljamtersedia = jumlahmesincuci * durasiMesinCuci;

  int ygbisamencuci = (totaljamtersedia / durasiCuciPenghuni).floor();

  if (ygbisamencuci > jumlahpenghuni) { ygbisamencuci = jumlahpenghuni; }

  print('jumlah penghuni yang dapat mencuci dalam sehari: $ygbisamencuci');
}

