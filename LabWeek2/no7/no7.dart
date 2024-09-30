import 'dart:io'; import 'no7(2).dart';

main() {
  print('do you want to create a Car or Bike? (Enter "car" or "bike")');
  String? choice = stdin.readLineSync()?.toLowerCase();

  print('enter the speed of the vehicle:');
  int speed = int.parse(stdin.readLineSync()!);

  Vehicle? vehicle;

  if (choice == 'car') {
    vehicle = Car(speed);
  } else if (choice == 'bike') {
    vehicle = Bike(speed);
  } else {
    print('invalid');
    return;
  }

  vehicle.move();
}