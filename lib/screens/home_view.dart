import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:sebha/core/themes/app_colors.dart';
import 'package:sebha/screens/husna_view.dart';
import 'package:sebha/widgets/CustomInkWell.dart';
import 'package:sebha/widgets/custom_azkar_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/azkar_service.dart';
import 'sebha_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final player = AudioPlayer();
  @override
  void initState() {
    checkFirst().then((value) {
      if (value) {
        player.play(AssetSource("sound/sound.mp3"));
        savePref();
      }
    });

    loadModelData();
    super.initState();
  }

  Future<bool> checkFirst() async {
    final pref = await SharedPreferences.getInstance();
    var isFirst = pref.getBool("isFirst") ?? true;
    return isFirst;
  }

  void savePref() async {
    final pref = await SharedPreferences.getInstance();
    await pref.setBool("isFirst", false);
  }

  late Map<String, dynamic> model;
  Future loadModelData() async {
    AzkarService service = AzkarService();
    model = await service.loadazkar();
    setState(() {}); // Trigger a rebuild with the new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffe2e0e1),
        centerTitle: true,
        title: const Text(
          'مُســــــــــلم',
          style: TextStyle(
            color: AppColors.mainColor,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kufam',
            shadows: [
              Shadow(
                color: Color.fromARGB(66, 61, 50, 82),
                offset: Offset(2, 2),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          const HomeContainer(),
          const SizedBox(
            height: 50,
          ),
          CustomInkWell(
            ontap: () {
              player.stop();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SebhaView(),
                  ));
            },
            text: "التسبيح",
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInkWell(
                    ontap: () {
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomAzkar(
                              itemCount: 30,
                              startValue: 31,
                              title: 'أذكار المساء',
                              model: model,
                            ),
                          ));
                    },
                    text: "أذكار المساء"),
                CustomInkWell(
                    ontap: () {
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomAzkar(
                              model: model,
                              itemCount: 31,
                              startValue: 0,
                              title: 'أذكار الصباح',
                            ),
                          ));
                    },
                    text: "أذكار الصباح")
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInkWell(
                    ontap: () {
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HusnaView(),
                          ));
                    },
                    text: "أسماء الله الحسنى"),
                CustomInkWell(
                    ontap: () {
                      player.stop();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomAzkar(
                              model: model,
                              itemCount: 8,
                              startValue: 61,
                              title: "الأذكار بعد الصلاة",
                            ),
                          ));
                    },
                    text: "الأذكار بعد الصلاة"),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomInkWell(
                  ontap: () {
                    player.stop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomAzkar(
                              model: model,
                              itemCount: 1,
                              startValue: 69,
                              title: "دعاء صلاة الاستخارة"),
                        ));
                  },
                  text: "دعاء صلاة الاستخارة",
                ),
                CustomInkWell(
                  ontap: () {
                    player.stop();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomAzkar(
                              model: model,
                              itemCount: 13,
                              startValue: 70,
                              title: "أذكار النوم"),
                        ));
                  },
                  text: "أذكار النوم",
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            AppColors.mainColor,
            AppColors.mainColor.withOpacity(0.7),
          ],
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "﷽",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Kufam",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Gap(15),
            Text(
              textAlign: TextAlign.center,
              "وَاذْكُر رَّبَّكَ إِذَا نَسِيتَ وَقُلْ عَسَىٰ أَن يَهْدِيَنِ رَبِّي لِأَقْرَبَ مِنْ هَٰذَا رَشَدًا",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "Amiri",
                fontSize: 13,
              ),
            ),
            Gap(15),
          ],
        ),
      ),
    );
  }
}
