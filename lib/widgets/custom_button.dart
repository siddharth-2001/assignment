import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    final accentColor = HexColor('#5669FF');
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 10,
            backgroundColor: accentColor,
            fixedSize: const Size(300, 62),
            shadowColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 18,
              backgroundColor: Colors.transparent,
            ),
            const Text(
              'BOOK NOW',
              style: TextStyle(
                  fontSize: 18, letterSpacing: 1, fontWeight: FontWeight.w500),
            ),
            CircleAvatar(
              radius: 18,
              backgroundColor: HexColor('#3D56F0'),
              child: const Icon(
                Icons.arrow_forward_sharp,
                color: Colors.white,
                size: 20,
              ),
            )
          ],
        ));
  }
}
