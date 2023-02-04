import 'package:flutter/material.dart';

class LocationSelectionBottomSheet extends StatelessWidget {
  const LocationSelectionBottomSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Colors.amber,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (context, index) => const Text("data"),
          ),
        );
      },
    );
  }
}
