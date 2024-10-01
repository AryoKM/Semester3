class Vehicle {
  int speed;
  Vehicle(this.speed);
  move() { print('kendaraan ini berjalan');}
  bool isFast() { return speed > 60;}
}

class mobil extends Vehicle {
  mobil(int speed) : super(speed);
  move() {if (isFast()) {print('mobil ini berjalan dengan kecepatan yang cepat');} else {print('mobil ini berjalan dengan kecepatan normal');}}}

class motor extends Vehicle {
  motor(int speed) : super(speed);
  move() {if (isFast()) {print('motor ini berjalan dengan kecepatan yang cepat');}else {print('motor ini berjalan dengan kecepatan normal');}}}