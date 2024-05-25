// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class AzkarWidget extends StatefulWidget {
  final String title;
  final int? count;
  final int? id;
  int counter = 0;
  AzkarWidget(
      {super.key,
      this.id,
      required this.title,
       this.count,
      required this.counter});

  @override
  State<AzkarWidget> createState() => _AzkarWidgetState();
}

class _AzkarWidgetState extends State<AzkarWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        color: const Color(0xfff4f4f4),
        child: Column(
          children: [
            ListTile(
              leading: Text(
                "العدد : ${widget.count}",
                style: const TextStyle(
                  fontFamily: "questv",
                  color: Color(0xff6d5c52),
                ),
              ),
              trailing: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xff6d5c52),
                ),
                height: 25,
                width: 25,
                child: Center(
                  child: Text(
                    "${widget.id}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              title: Text(
                widget.title,
                textAlign: TextAlign.center,
                maxLines: 35,
                style: const TextStyle(
                  color: Color(0xff6d5c52),
                  fontFamily: "Questv",
                  shadows: [
                    Shadow(
                      color: Color.fromARGB(66, 125, 127, 129),
                      offset: Offset(1.5, 1.5),
                    ),
                  ],
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10, left: 10),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                widget.count != widget.counter
                    ? Column(
                        children: [
                          FloatingActionButton(
                              heroTag: null,
                            mini: true,
                            onPressed: () {
                              setState(() {
                                widget.counter++;
                              });
                            },
                            backgroundColor: const Color(0xff6d5c52),
                            child: const Icon(
                              Icons.arrow_drop_up_rounded,
                              size: 40,
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.counter}",
                            style: const TextStyle(color: Color(0xff6d5c52)),
                          ),
                        ],
                      )
                    : const Padding(
              padding: EdgeInsets.only(bottom: 10, left: 10),
                      child: Column(
                        children: [
                          Icon(Icons.done_all_sharp,color: Color(0xff6d5c52)),
                          Text("🤎 تم",style:TextStyle(fontFamily: "Questv",color: Color(0xff6d5c52)),)
                        ],
                      ),
                    )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
