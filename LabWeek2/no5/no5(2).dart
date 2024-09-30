class pet {
   sound() {
    print("suara peliharaan");
  }

   eat() {
    print("makanan peliharaan");
  }
}

class anjing extends pet {
   sound() {
    print("woof, bark, pinjam uang dule");
  }

   eat() {
    print("makanan anjing, tulang, daging");
  }
}

class kucing extends pet {
   sound() {
    print("meow, purr, nya, hiss, goshujin-sama okaeri");
  }

   eat() {
    print("makanan kucing, ikan, daging");
  }
}