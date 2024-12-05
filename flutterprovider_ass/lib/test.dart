// import 'package:flutter/material.dart';

// void main() {
//   runApp(const VoucherApp());
// }

// class VoucherApp extends StatelessWidget {
//   const VoucherApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: VoucherPage(),
//     );
//   }
// }

// class VoucherPage extends StatefulWidget {
//   const VoucherPage({super.key});

//   @override
//   _VoucherPageState createState() => _VoucherPageState();
// }

// class _VoucherPageState extends State<VoucherPage> {
//   final List<String> _vouchers = [];

//   void _addVoucher() {
//     setState(() {
//       _vouchers.add("Voucher #${_vouchers.length + 1}");
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Voucher Page"),
//       ),
//       body: Column(
//         children: [
//           Expanded(
//             child: _vouchers.isEmpty
//                 ? const Center(
//                     child: Text(
//                       "No vouchers added.",
//                       style: TextStyle(fontSize: 18, color: Colors.grey),
//                     ),
//                   )
//                 : ListView.builder(
//                     itemCount: _vouchers.length,
//                     itemBuilder: (context, index) {
//                       return Card(
//                         margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
//                         child: ListTile(
//                           leading: const Icon(Icons.card_giftcard, color: Colors.blue),
//                           title: Text(_vouchers[index]),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: ElevatedButton(
//               onPressed: _addVoucher,
//               style: ElevatedButton.styleFrom(
//                 padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                 textStyle: const TextStyle(fontSize: 16),
//               ),
//               child: const Text("Add Voucher"),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
