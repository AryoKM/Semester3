main() {
  const int konsumsichat = 1;
  const int konsumsivideo = 2;
  const int konsumsigame = 3;

  const int durasichat = 60;
  const int durasivideo = 30;
  const int durasigame = 45;

  int baterichat = (durasichat ~/ 5) * konsumsichat;
  int baterivideo = (durasivideo ~/ 5) * konsumsivideo;
  int baterigame = (durasigame ~/ 5) * konsumsigame;

  int totalkonsumsi = baterichat + baterivideo + baterigame;

  int sisabateri = 100 - totalkonsumsi;

  print("baterai yang tersisa: $sisabateri%");
}
