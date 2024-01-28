
import 'package:flutter/material.dart';
import 'package:sebha/Models/alhusnaModel.dart';
import 'package:sebha/services/service.dart';

import '../componants/Customcontainer.dart';

class Husna extends StatefulWidget {
  const Husna({super.key});

  @override
  State<Husna> createState() => _HusnaState();
}

class _HusnaState extends State<Husna> {
 late List<HusnaModel> model=[];

  @override
  void initState() {
    super.initState();
    loadModelData();
  }

  Future<void> loadModelData() async {
    Service service = Service();
    model = await service.loadJson();
    setState(() {}); // Trigger a rebuild with the new data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "أسماء الله الحسنى",
          style: TextStyle(
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
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 15),
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            childAspectRatio: 0.75,
          ),
          itemCount: model.length, 
          itemBuilder: (BuildContext context, int index) {
            return Customcontainer(
              meaning: model[index].meaning,
              name: model[index].name,
              transliteration: model[index].transliteration,
            );
          },
        ),
      ),
    );
  }
}
