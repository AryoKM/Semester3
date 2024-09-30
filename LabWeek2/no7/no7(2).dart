class Vehicle {
  int speed;
  Vehicle(this.speed);
  move() { print('the vehicle is moving.');}
  bool isFast() { return speed > 60;}
}

class Car extends Vehicle {
  Car(int speed) : super(speed);

  move() {
    if (isFast()) {print('the car moves very fast');} else {print('the car moves at a normal speed');}}
}

class Bike extends Vehicle {
  Bike(int speed) : super(speed);
  
  move() {
    if (isFast()) {print('the bike moves very fast');}
      else {print('the bike moves at a normal speed');}
  }
}