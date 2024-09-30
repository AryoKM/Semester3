class ubahtemp {
  double _celsius = 0;
  double get celsius => _celsius;

  set celsius(double value) { _celsius = value; }

  double get fahrenheit => (_celsius * 9/5) + 32;
  double get kelvin => _celsius + 273.15;
  double get reaumur => _celsius * 0.8;
}