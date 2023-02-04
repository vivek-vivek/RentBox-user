// ignore_for_file: must_be_immutable

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import 'package:provider/provider.dart';
import 'package:rent_ro/controller/location/location_provider.dart';
import 'package:rent_ro/utiles/colors.dart';
import 'package:rent_ro/view/screens/location_screen.dart';
import 'package:rent_ro/view/widgets/common_app_bar.dart';

import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final resHeight = MediaQuery.of(context).size.width;
    String selectedValueDrop = dropOffavailableTime[0];

    String selectedValuePick = pickupAvailableTime.isEmpty
        ? dropOffavailableTime[0]
        : pickupAvailableTime[0];
    final localProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: CommonColors.kBlack,
      appBar: PreferredSize(
        preferredSize: Size(resHeight, resHeight),
        child: CommonAppBar(
          resHeight: resHeight,
          context: context,
          title: 'Filter',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(resHeight * 0.05),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CommonColors.green,
                      width: resHeight * 0.005,
                    ),
                    color: CommonColors.kWhite,
                    borderRadius: BorderRadius.circular(resHeight * 0.03),
                  ),
                  height: resHeight * 0.15,
                  width: resHeight * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        localProvider.startDateController.text.isEmpty
                            ? "Pick date"
                            : localProvider.startDateController.text,
                        style: GoogleFonts.truculenta(
                            color: CommonColors.kBlack,
                            fontSize: resHeight * 0.04),
                      ),
                      Text(
                        localProvider.startTimeController.text.isEmpty
                            ? "Pickup time"
                            : localProvider.startTimeController.text,
                        style: GoogleFonts.truculenta(
                            color: CommonColors.kBlack,
                            fontSize: resHeight * 0.040),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.arrow_forward_rounded,
                    size: resHeight * 0.06, color: CommonColors.kWhite),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CommonColors.green,
                      width: resHeight * 0.005,
                    ),
                    color: CommonColors.kWhite,
                    borderRadius: BorderRadius.circular(resHeight * 0.03),
                  ),
                  height: resHeight * 0.15,
                  width: resHeight * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        localProvider.endDateController.text.isEmpty
                            ? "Dropoff date"
                            : localProvider.endDateController.text,
                        style: GoogleFonts.truculenta(
                            color: CommonColors.kBlack,
                            fontSize: resHeight * 0.04),
                      ),
                      Text(
                        localProvider.endTimeController.text.isEmpty
                            ? "Dropoff time"
                            : localProvider.endTimeController.text,
                        style: GoogleFonts.truculenta(
                            color: CommonColors.kBlack,
                            fontSize: resHeight * 0.037),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: resHeight * 0.05),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: resHeight * 0.04),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: CommonColors.kGrey,
                    width: resHeight * 0.005,
                  ),
                  color: CommonColors.kWhite,
                  backgroundBlendMode: BlendMode.darken,
                  borderRadius: BorderRadius.circular(resHeight * 0.03),
                ),
                height: resHeight * 0.1,
                width: resHeight * 1,
                child: Padding(
                  padding: EdgeInsets.only(top: resHeight * 0.035),
                  child: TextFormField(
                    onTap: () {
                      Provider.of<LocationProvider>(context, listen: false)
                          .getLocationResponse(context);
                      (Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LocationScreen(),
                      )));
                    },
                    controller: Provider.of<LocationProvider>(context)
                        .locationNameController,
                    style: const TextStyle(color: CommonColors.kWhite),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Click here to select location",
                      hintStyle: GoogleFonts.truculenta(
                          color: Colors.white, fontSize: resHeight * 0.05),
                    ),
                    readOnly: true,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            SizedBox(height: resHeight * 0.06),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: CommonColors.green,
                  width: resHeight * 0.005,
                ),
                color: CommonColors.kWhite,
                borderRadius: BorderRadius.circular(resHeight * 0.03),
              ),
              child: SfDateRangePicker(
                maxDate: DateTime.now().add(const Duration(days: 60)),
                minDate: DateTime.now().add(const Duration(days: 1)),
                initialDisplayDate: DateTime.now(),
                rangeSelectionColor: CommonColors.lighGreen,
                selectionColor: CommonColors.green,
                extendableRangeSelectionDirection:
                    ExtendableRangeSelectionDirection.both,
                headerHeight: resHeight * 0.2,
                startRangeSelectionColor: CommonColors.kBlack,
                endRangeSelectionColor: CommonColors.kBlack,
                viewSpacing: 3,
                selectionMode: DateRangePickerSelectionMode.extendableRange,
                onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                  final tomorrow = DateTime.now().add(const Duration(days: 2));
                  final String startDate = DateFormat('yyyy/MMMM/dd')
                      .format(args.value.startDate ?? DateTime.now());
                  final endDate = DateFormat('yyyy/MMMM/dd')
                      .format(args.value.endDate ?? tomorrow)
                      .toString();

                  Provider.of<LocationProvider>(context, listen: false)
                      .setStartDate(startDate);
                  Provider.of<LocationProvider>(context, listen: false)
                      .setEndDate(endDate);
                  log(args.value.startDate.toString());
                  log(DateTime.now().month.toString());
                  double currentTime =
                      DateTime.now().hour + ((DateTime.now().minute) / 60);

                  DateTime dateTime1 =
                      DateTime.parse(args.value.startDate.toString());
                  DateTime dateTime2 =
                      DateTime.parse(DateTime.now().toString());
                  String dateOnly1 =
                      "${dateTime1.year}-${dateTime1.month.toString().padLeft(2, '0')}-${dateTime1.day.toString().padLeft(2, '0')}";
                  String dateOnly2 =
                      "${dateTime2.year}-${dateTime2.month.toString().padLeft(2, '0')}-${dateTime2.day.toString().padLeft(2, '0')}";

                  if (dateOnly1 == dateOnly2) {
                    pickupAvailableTime.clear();
                    for (int i = DateTime.now().hour; i <= 17; i++) {
                      int hour = i % 12;
                      if (hour == 0) {
                        hour = 12;
                      }
                      String hourStr = hour.toString().padLeft(2, '0');
                      String time = '$hourStr.00 AM';
                      if (i >= 12) {
                        time = '$hourStr.00 PM';
                      }
                      if (i + (0 / 60) > currentTime ||
                          (i == DateTime.now().hour &&
                              (DateTime.now().minute) == 0)) {
                        pickupAvailableTime.add(time);
                      }
                    }
                  }
                },
              ),
            ),
            SizedBox(
              height: resHeight * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Pickup Time",
                    style: GoogleFonts.truculenta(
                        color: CommonColors.kWhite, fontSize: resHeight * 0.04),
                  ),
                  SizedBox(width: resHeight * 0.06),
                  Text(
                    "Dropoff Time",
                    style: GoogleFonts.truculenta(
                        color: CommonColors.kWhite, fontSize: resHeight * 0.04),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CommonColors.green,
                      width: resHeight * 0.005,
                    ),
                    color: CommonColors.kWhite,
                    borderRadius: BorderRadius.circular(resHeight * 0.03),
                  ),
                  height: resHeight * 0.12,
                  width: resHeight * 0.4,
                  child: Center(
                    child: DropdownButton<String>(
                      style: const TextStyle(color: CommonColors.kBlack),
                      value: Provider.of<LocationProvider>(context)
                              .startTimeController
                              .text
                              .isEmpty
                          ? selectedValuePick
                          : Provider.of<LocationProvider>(context)
                              .startTimeController
                              .text,
                      items: (pickupAvailableTime.isEmpty
                              ? emptyArray
                              : pickupAvailableTime)
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value.isEmpty ? emptyArray[0] : value,
                          child: SizedBox(
                            child: Padding(
                                padding: EdgeInsets.only(left: resHeight * 0.1),
                                child: Text(
                                  value,
                                  style: GoogleFonts.truculenta(
                                    color: CommonColors.kBlack,
                                    fontSize: resHeight * 0.04,
                                  ),
                                )),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        Provider.of<LocationProvider>(context, listen: false)
                            .setStartTime(newValue.toString());
                      },
                      dropdownColor: CommonColors.kWhite,
                      borderRadius: BorderRadius.circular(resHeight * 0.03),
                      underline: const SizedBox(),
                      alignment: Alignment.topLeft,
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: CommonColors.green,
                      width: resHeight * 0.005,
                    ),
                    color: CommonColors.kWhite,
                    borderRadius: BorderRadius.circular(resHeight * 0.03),
                  ),
                  height: resHeight * 0.12,
                  width: resHeight * 0.4,
                  child: Center(
                    child: DropdownButton<String>(
                      hint: const Text('Dropof time'),
                      style: const TextStyle(color: CommonColors.kBlack),
                      value: Provider.of<LocationProvider>(context)
                              .endTimeController
                              .text
                              .isEmpty
                          ? selectedValueDrop
                          : Provider.of<LocationProvider>(context)
                              .endTimeController
                              .text,
                      items: dropOffavailableTime.map((String value) {
                        return DropdownMenuItem<String>(
                          value:
                              value.isEmpty ? dropOffavailableTime[0] : value,
                          child: SizedBox(
                            child: Padding(
                                padding: EdgeInsets.only(left: resHeight * 0.1),
                                child: Text(
                                  value,
                                  style: GoogleFonts.truculenta(
                                      color: CommonColors.kBlack,
                                      fontSize: resHeight * 0.04),
                                )),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        Provider.of<LocationProvider>(context, listen: false)
                            .setEndTime(newValue.toString());
                      },
                      dropdownColor: CommonColors.kWhite,
                      borderRadius: BorderRadius.circular(resHeight * 0.03),
                      underline: const SizedBox(),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: resHeight * 0.07),
            GestureDetector(
              onTap: () => Provider.of<LocationProvider>(context, listen: false)
                  .validation(context),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  border: Border.all(
                    color: CommonColors.kGrey,
                    width: resHeight * 0.005,
                  ),
                  backgroundBlendMode: BlendMode.darken,
                  borderRadius: BorderRadius.circular(resHeight * 0.03),
                ),
                height: resHeight * 0.15,
                width: resHeight,
                child: Center(
                  child: Text(
                    "Search",
                    style: GoogleFonts.truculenta(
                        color: Colors.white, fontSize: resHeight * 0.05),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // List<String> availableTime = ['Date'];
  List<String> dropOffavailableTime = [
    '10.00 AM',
    '11.00 AM',
    '12.00 PM',
    '01.00 PM',
    '02.00 PM',
    '03.00 PM',
    '04.00 PM',
    '05.00 PM '
  ];
  List<String> pickupAvailableTime = [
    '10.00 AM',
    '11.00 AM',
    '12.00 PM',
    '01.00 PM',
    '02.00 PM',
    '03.00 PM',
    '04.00 PM',
    '05.00 PM '
  ];
  List<String> emptyArray = ['Time not available'];
  void generateAvailableTime() {}
}

// void selectDate(args, context) {
//   if (args.value.startDate != null && args.value.endDate != null) {
//     if (args.value.startDate.difference(args.value.endDate).inDays >= 0) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         DialogeMessages()
//             .commonSnackBar(text: 'select atleast one daay of difference!'),
//       );
//       args.value.endDate = args.value.startDate.add(const Duration(days: 1));
//     }
//   }
// }


// date  range selection
/*
final startDate = DateFormat('dd, MMMM yyyy')
                      .format(args.value.startDate)
                      .toString();
                  final endDate = DateFormat('dd, MMMM yyyy')
                      .format(args.value.endDate)
                      .toString();
*/