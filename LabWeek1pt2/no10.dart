void main() {
  List<String> nasabah = ['Nasabah A', 'Nasabah B', 'Nasabah C', 'Nasabah D', 'Nasabah E'];
  for (int i = 0; i < nasabah.length; i++) {
    if (i % 2 == 0) {
      print('${nasabah[i]} dilayani di Loket 1');
    }
    else {
      print('${nasabah[i]} dilayani di Loket 2');
    }
  }
}
