// import 'package:bottom_picker/bottom_picker.dart';
// import 'package:bottom_picker/resources/arrays.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:provider/provider.dart';
// import 'package:rent_ro/controller/provider/home_provider.dart';
// import 'package:rent_ro/utiles/colors.dart';

// class CommonDateTime {
//   void openDropeDatePicker(BuildContext context, String title) {
//     BottomPicker.date(
//       backgroundColor: CommonColors.amber,
//       title: title,
//       dateOrder: DatePickerDateOrder.dmy,
//       pickerTextStyle: const TextStyle(
//         color: Color.fromARGB(255, 0, 0, 0),
//         fontWeight: FontWeight.bold,
//         fontSize: 12,
//       ),
//       titleStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//         color: CommonColors.kWhite,
//       ),
//       onSubmit: (index) {
//         final String date = DateFormat.MMMMd().format(index).toString();
//         // Provider.of<HomeProvider>(context, listen: false)
//         //     .setDroeDateHint(date, index);
//       },
//       bottomPickerTheme: BottomPickerTheme.orange,
//     ).show(context);
//   }

//   void openPickDatePicker(BuildContext context, String title) {
//     BottomPicker.date(
//       backgroundColor: CommonColors.amber,
//       title: title,
//       dateOrder: DatePickerDateOrder.dmy,
//       pickerTextStyle: const TextStyle(
//         color: Color.fromARGB(255, 0, 0, 0),
//         fontWeight: FontWeight.bold,
//         fontSize: 12,
//       ),
//       titleStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//         color: CommonColors.kWhite,
//       ),
//       onSubmit: (index) {
//         final String date = DateFormat.MMMMd().format(index).toString();

//         // Provider.of<HomeProvider>(context, listen: false)
//         //     .setPickDateHint(date, index);
//       },
//       bottomPickerTheme: BottomPickerTheme.orange,
//     ).show(context);
//   }

//   void openTimePicker(BuildContext context) {
//     BottomPicker.time(
//       title: 'Set your time',
//       titleStyle: const TextStyle(
//         fontWeight: FontWeight.bold,
//         fontSize: 15,
//         color: Colors.amber,
//       ),
//       onSubmit: (index) {},
//       onClose: () {},
//       bottomPickerTheme: BottomPickerTheme.orange,
//       use24hFormat: true,
//     ).show(context);
//   }
// }
