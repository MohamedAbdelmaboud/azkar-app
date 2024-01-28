import 'package:flutter/material.dart';
import 'package:sebha/constants/colors.dart';
import '../componants/azkarWidget.dart';

class CustomAzkar extends StatefulWidget {
  const CustomAzkar(
      {super.key, required this.itemCount, required this.startValue, required this.title, required this.model});
  final int itemCount;
  final int startValue;
  final String title;
  final Map<String, dynamic> model;
  @override
  State<CustomAzkar> createState() => _CustomAzkarState();
}

int c = 0;

class _CustomAzkarState extends State<CustomAzkar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.mainColor),
        title:  Text(
         widget.title,
          style: const TextStyle(
            color: Color(0xff6d5c52),
            fontWeight: FontWeight.bold,
            fontFamily: "Questv",
            shadows: [
              Shadow(
                color: Color.fromARGB(66, 125, 127, 129),
                offset: Offset(1.5, 1.5),
              ),
            ],
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body:  Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color(0xff6d5c52),
                        Color(0xff95806b),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 350,
                  height: 130,
                  child: const Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "﷽",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "questv",
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        textAlign: TextAlign.center,
                        "يا أَيُّهَا الَّذِينَ آمَنُوا اذْكُرُوا اللَّهَ ذِكْرًا كَثِيرًا وَسَبِّحُوهُ بُكْرَةً وَأَصِيلًا",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "questv",
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.itemCount,
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider(
                      thickness: 1,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    int itemIndex = index + widget.startValue;
                    int id = ++index;
                    return AzkarWidget(
                        id: id,
                        counter: c,
                        title: widget.model["rows"][itemIndex][1],
                        count: widget.model["rows"][itemIndex][3]);
                  },
                ),
              ),
            ]),
      //0-->index
    );
  }
}
