import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  final String hintText;
  final TextEditingController textEditingController;

  const CustomSearchBar({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: Color.fromRGBO(218, 99, 23, 1),
        ),
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.transparent)),
        border: InputBorder.none,
        filled: true,
        fillColor: const Color.fromRGBO(249, 168, 77, 1),
      ),
    );
  }
}
