import 'package:flutter/material.dart';

import '../helper/colors.dart';

class CustomToggle extends StatefulWidget {
  const CustomToggle({super.key, required this.width, required this.height});
  static String id = 'Test';
  final double width;
  final double height;

  @override
  State<CustomToggle> createState() => _CustomToggleState();
}

class _CustomToggleState extends State<CustomToggle> {
  bool pressedOnMovies = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      decoration:  BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(130),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                pressedOnMovies = !pressedOnMovies ;
              });
            },
            child: Container(
              width: widget.width/2,
              height: widget.height,
              decoration:  BoxDecoration(
                color:pressedOnMovies ?a6:Colors.white,
                borderRadius: BorderRadius.circular(130),
              ),
              child:  Center(child: Text('Movies',style: TextStyle(color:pressedOnMovies? Colors.white:a6,fontWeight: FontWeight.w700,fontSize: 20),)),
            ),
          ),
          InkWell(
            onTap: (){
              setState(() {
                pressedOnMovies = !pressedOnMovies ;
              });
            },
            child: Container(
              width: widget.width/2,
              height: widget.height,
              decoration:  BoxDecoration(
                color:!pressedOnMovies ?a6:Colors.white,
                borderRadius: BorderRadius.circular(130),
              ),
              child:  Center(child: Text('Tv Shows',style: TextStyle(color:!pressedOnMovies? Colors.white:a6,fontWeight: FontWeight.w700,fontSize: 20),)),
            ),
          ),
        ],
      ),
    );
  }
}
