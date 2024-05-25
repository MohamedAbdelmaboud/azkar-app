// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sebha/widgets/CustomColumn.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/themes/app_colors.dart';

class SebhaView extends StatefulWidget {
  const SebhaView({super.key});
  @override
  State<SebhaView> createState() => _SebhaViewState();
}

class _SebhaViewState extends State<SebhaView> {
  CustomColumn buildCustomColumn({
    required String title,
    required String description,
    required int index,
  }) {
    return CustomColumn(
      title: title,
      description: description,
      borderPercent: allborder[index],
      points: allpoints[index],
      fun1: () => resetPointsAndBorder(index),
      fun2: () => incrementPointsAndBorder(index),
    );
  }

  int points = 0;
  double borderPercent = 0.0;
  PageController pageController = PageController(viewportFraction: 0.88);
  List<int> allpoints = [0, 0, 0, 0, 0, 0, 0, 0];
  List<double> allborder = [0, 0, 0, 0, 0, 0, 0, 0];
  int total = 0;
  //functions
  savepref() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('totalScore', total);
  }

  loadTotalScore() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      total = prefs.getInt('totalScore') ?? 0;
    });
  }

  void showTotal() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(1),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.white.withOpacity(0.8),
          title: const Text(
            'عدد التسبيحات الكلي',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.mainColor,
              fontFamily: "questv",
            ),
          ),
          content: Text(
            '$total',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 150, 121, 89),
              fontFamily: "questv",
            ),
          ),
          actions: [
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(99),
                    side: const BorderSide(
                        color: AppColors.gradientColor, width: 1.5)),
                onPressed: () {
                  Navigator.of(context).pop();
                  total = 0;
                  savepref();
                },
                child: const Text(
                  'جديد',
                  style: TextStyle(
                    color: AppColors.mainColor,
                    fontFamily: "questv",
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _celebrate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          backgroundColor: Colors.white.withOpacity(0.8),
          title: const Text(
            '🤎 جُزيتَ الجنة ',
            style: TextStyle(
              color: AppColors.mainColor,
              fontFamily: "questv",
            ),
          ),
          content: const Text(
            "و جـزاك اللـــه خيـر الجـزاء ونـور دربـك ",
            style: TextStyle(
              color: AppColors.mainColor,
              fontFamily: "questv",
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  for (int i = 0; i < allpoints.length; i++) {
                    allpoints[i] = 0;
                    allborder[i] = 0;
                  }
                });
                Navigator.of(context).pop();
              },
              child: const Text(
                'هيا لنفوز بمزيد من الحسنات',
                style: TextStyle(
                  color: AppColors.gradientColor,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  fontFamily: "questv",
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void resetPointsAndBorder(int index) {
    setState(() {
      allpoints[index] = 0;
      allborder[index] = 0;
    });
  }

  void incrementPointsAndBorder(int index) {
    setState(() {
      allpoints[index]++;
      total++;
      allborder[index] += 0.01;
      savepref();
      if (allpoints[index] == 100) {
        //max value ---> out
        allborder[index] = 0;
        allpoints[index] = 0;
        _celebrate();
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loadTotalScore();
  }

  @override
  Widget build(BuildContext context) {
    List<CustomColumn> customColumns = [
      buildCustomColumn(
        title: "سُبْحَانَ اللَّهِ",
        description: "يكتب له ألف حسنة أو يحط عنه ألف خطيئة",
        index: 0,
      ),
      buildCustomColumn(
        title: "أَسْتَغْفِرُ اللَّهَ",
        description:
            "قالَ النَّبيُّ صلَّى اللَّهُ عليْهِ وسلَّمَ إنِّي لأستغفرُ اللَّهَ في اليومِ سبعينَ مرَّةً",
        index: 1,
      ),
      buildCustomColumn(
        title: "الْحَمْدُ لِلَّهِ",
        description: "قال النبي ﷺ: أفضل الدعاء الحمد لله",
        index: 2,
      ),
      buildCustomColumn(
        title: "اللَّهُم صَلِّ وَسَلِم وبارك عَلَى سَيّدِنَا محمد",
        description: "من صلى على حين يصبح وحين يمسى ادركته شفاعتي يوم القيامة.",
        index: 3,
      ),
      buildCustomColumn(
        title: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ",
        description:
            "حُطَّتْ خَطَايَاهُ وَإِنْ كَانَتْ مِثْلَ زَبَدِ الْبَحْرِ",
        index: 4,
      ),
      buildCustomColumn(
        title: "سُبْحَانَ اللَّهِ وَبِحَمْدِهِ ، سُبْحَانَ اللَّهِ الْعَظِيمِ",
        description:
            "ثَقِيلَتَانِ فِي الْمِيزَانِ حَبِيبَتَانِ إِلَى الرَّحْمَٰنِ",
        index: 5,
      ),
      buildCustomColumn(
        title: "سُبْحَانَ اللهِ العظيم وبحمدِهِ",
        description: "غرست له نخلة في الجنة",
        index: 6,
      ),
      buildCustomColumn(
        title: "لا حَوْلَ وَلا قُوَّةَ إِلَّا بِاللهِ",
        description: "كنز من كنوز الجنة",
        index: 7,
      ),
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.arrow_back,
                color: AppColors.mainColor,
              )),
          actions: [
            Row(
              children: [
                Text("total :",
                    style: GoogleFonts.acme(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        const Shadow(
                          color: Color.fromARGB(66, 61, 50, 82),
                          offset: Offset(2, 2),
                        ),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: IconButton(
                    onPressed: () {
                      showTotal();
                    },
                    icon: const Icon(
                      Icons.analytics_outlined,
                      size: 35,
                    ),
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
          // elevation: 0.0,
          backgroundColor: const Color(0xffc3bfb6).withOpacity(0.7),
          centerTitle: true,
          title: const Text(
            "التسبيح",
            style: TextStyle(
              color: AppColors.mainColor,
              fontWeight: FontWeight.bold,
              shadows: [
                Shadow(
                  color: Color.fromARGB(66, 61, 50, 82),
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),
        ),
        body: Stack(
          // Use a Stack to layer widgets
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/sebha.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Center(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 10),
                  child: PageView.builder(
                    controller: pageController,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: customColumns.length,
                    itemBuilder: (BuildContext context, int index) {
                      return customColumns[index];
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
