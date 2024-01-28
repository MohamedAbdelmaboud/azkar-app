import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:sebha/constants/colors.dart';

class CustomColumn extends StatelessWidget {
  final String title;
  final String description;
  final double borderPercent;
  final int points;
  final void Function() fun1;
  final void Function() fun2;

  const CustomColumn({
    super.key,
    required this.title,
    required this.description,
    required this.borderPercent,
    required this.points,
    required this.fun1,
    required this.fun2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  MyColors.mainColor,
                  MyColors.mainColor.withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            width: 320,
            height: 180,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "questv",
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 2.0),
                  child: Divider(
                    color: Colors.white,
                    thickness: 1,
                    indent: 50,
                    endIndent: 50,
                  ),
                ),
                Text(
                  textAlign: TextAlign.center,
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontFamily: "questv",
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: CircularPercentIndicator(
              radius: 110,
              percent: borderPercent,
              lineWidth: 15,
              center: Text(
                "$points",
                style: const TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              progressColor: MyColors.mainColor,
              backgroundColor:
                  MyColors.mainColor.withOpacity(0.5),
              circularStrokeCap: CircularStrokeCap.round,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: SizedBox(
                    width: 80,
                    height: 80,
                    child: ElevatedButton(
                      onPressed: fun1,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:  MyColors.mainColor
                            .withOpacity(0.5),
                        //shadowColor: Colors.brown,
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(99),
                        ),
                      ),
                      child: const Text(
                        "إعادة التسبيح",
                        style: TextStyle(
                          fontFamily: "questv",
                          fontSize: 12,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 90,
                  height: 90,
                  child: ElevatedButton(
                    onPressed: fun2,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.mainColor,
                      shadowColor: Colors.brown,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.circular(99),
                      ),
                    ),
                    child: const Text(
                      "سبح",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: "questv",
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
