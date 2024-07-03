import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({
    super.key,
    required this.hintText,
    this.maxLines = 1,
    this.onSaved,
    this.onChanged,
    this.onPressed,
    this.controller,
  });
  final String hintText;
  final int maxLines;
  final Function()? onPressed;
  final Function(String?)? onSaved;
  final Function(String)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This field is required';
        } else {
          return null;
        }
      },
      cursorColor: Colors.white,
      maxLines: maxLines,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: 0.8,
            child: Icon(
              FontAwesomeIcons.magnifyingGlass,
              color: Colors.white,
            ),
          ),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.white,
        ),
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
      ),
    );
  }

  OutlineInputBorder buildBorder([colorBorder]) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(
        color: colorBorder ?? Colors.white,
      ),
    );
  }
}
