import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final kInterText = GoogleFonts.inter(
  color: Colors.white,
  fontSize: 20,
  fontWeight: FontWeight.normal,
);

Widget button({
  String buttonTxt,
  VoidCallback onTap,
  Color buttonColor,
  Color txtColor,
  double txtSize,
}) {
  return ElevatedButton(
    onPressed: onTap,
    style: ButtonStyle(
      elevation: MaterialStateProperty.all(10),
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
    ),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 20),
      child: Text(
        buttonTxt,
        style: kInterText.copyWith(
          fontSize: txtSize,
          color: txtColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
