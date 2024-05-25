import 'package:flutter/material.dart';
import 'package:sebha/core/themes/app_colors.dart';

class CustomInkWell extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const CustomInkWell({
    required this.ontap,
    required this.text,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: ontap,
        child: Container(
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 231, 206, 182),
                offset: Offset(1, 3),
              ),
            ],
            border: Border.all(color: AppColors.gradientColor, width: 0.5),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: 130,
          height: 80,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              textAlign: TextAlign.center,
              text,
              style: const TextStyle(
                color: AppColors.transliterationColor,
                fontFamily: "questv",
                fontSize: 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
