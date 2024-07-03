import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMeassage});
  final String errMeassage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMeassage,
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
