import 'package:flutter/material.dart';

import '../helper/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.hint});
  final String hint ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: TextField(
        style: const TextStyle(color: a4),
        decoration: InputDecoration(
          filled:true,
          fillColor: a4.withOpacity(0.1),
          hintText: hint,
          hintStyle: const TextStyle(color: a4),
          prefixIcon: const Icon(Icons.search,color: a4,),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
        ),
      ),
    );
  }
}
