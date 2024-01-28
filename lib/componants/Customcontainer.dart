import 'package:flutter/material.dart';

class Customcontainer extends StatelessWidget {
  final String name;
  final String transliteration;
  final String meaning;
  const Customcontainer(
      {super.key, required this.name,
      required this.transliteration,
      required this.meaning});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xfff4f4f4),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 233, 233, 233), offset: Offset(3, 3)),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      width: 180,
      height: 230,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            name,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Questv",
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Color(0xff6d5c52),
                shadows: [
                  Shadow(
                      color: Color.fromARGB(255, 165, 165, 165),
                      offset: Offset(1, 2))
                ]),
          ),
          Text(
            transliteration,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Questv", fontSize: 15, color: Color(0xff888888)),
          ),
          Text(
            meaning,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: "Questv", fontSize: 12, color: Color(0xff95806b)),
          )
        ],
      ),
    );
  }
}
