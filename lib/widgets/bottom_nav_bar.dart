import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../helper/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.onTapFirstItem, required this.onTapSecItem, required this.onTapThirdItem});
  final void Function() onTapFirstItem;
  final void Function() onTapSecItem;
  final void Function() onTapThirdItem;

  @override
  Widget build(BuildContext context) {
    return  Positioned(
      bottom: 15,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 80,
            width: 350,
            color: a1.withOpacity(0.6),
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: onTapFirstItem,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(

                            FontAwesomeIcons.houseChimney,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapSecItem,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.film,
                            color: Colors.white,
                            size: 30,

                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 4,
                        //   backgroundColor: screenIndex == 1
                        //       ? a6
                        //       : Colors.transparent,
                        // ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: onTapThirdItem,
                    child: const Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.0),
                          child: Icon(
                            FontAwesomeIcons.photoFilm,
                            color: Colors.white,
                            size: 30,

                          ),
                        ),
                        // CircleAvatar(
                        //   radius: 4,
                        //   backgroundColor: screenIndex == 2
                        //       ? a6
                        //       : Colors.transparent,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
