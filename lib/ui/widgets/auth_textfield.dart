import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AuthTextfield extends StatelessWidget {
  AuthTextfield({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
          color: const Color(0xfffdfdfd),
          borderRadius: BorderRadius.circular(35),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            )
          ]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xff939393),
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
