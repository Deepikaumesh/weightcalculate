import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:bmi/constants/app_constants.dart';

class RightBar extends StatelessWidget {
  final double barwidth;
  const RightBar({Key? key, required this.barwidth}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: 25,
          height: barwidth,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),

              ),
              color: Colors.teal.shade400,

          ),
        )

      ],
    );
  }
}
