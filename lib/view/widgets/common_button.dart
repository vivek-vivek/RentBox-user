import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rent_ro/controller/Navigation/bottom_navigation_provider.dart';
import 'package:rent_ro/utiles/constants.dart';
import 'package:rent_ro/utiles/colors.dart';

class SelectionCommonButton extends StatelessWidget {
  const SelectionCommonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;
    return Consumer<SelectionCommonButtonProvider>(
      builder: (context, myButtonModel, _) {
        return Container(
          height: 50,
          decoration: BoxDecoration(
            color: myButtonModel.buttonColor,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: TextButton(
            onPressed: () {
              myButtonModel.toggle();
            },
            child: Text(
              'kerala',
              style: TextStyle(
                color: myButtonModel.textColor,
                fontWeight: FontWeight.bold,
                fontSize: respHeight * Constants().commonTextSize,
              ),
            ),
          ),
        );
      },
    );
  }
}

class SubmitCommonButton extends StatelessWidget {
  const SubmitCommonButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final respHeight = MediaQuery.of(context).size.width;

    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: CommonColors.kBlack,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          'Submit',
          style: TextStyle(
            color: CommonColors.kWhite,
            fontWeight: FontWeight.bold,
            fontSize: respHeight * Constants().commonTextSize,
          ),
        ),
      ),
    );
  }
}
