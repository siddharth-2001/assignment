import 'dart:ui';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  Widget? leading;
  Widget? trailing;
  Widget? bottom;
  double sigma;
  double opacity;
  Color titleColor;
  CustomAppBar(
      {super.key,
      required this.title,
      this.leading,
      this.trailing,
      this.sigma = 10,
      this.titleColor = Colors.black,
      this.bottom,
      this.opacity = 0.7});

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    final screenPadding = MediaQuery.of(context).viewPadding;

    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: sigma, sigmaY: sigma, tileMode: TileMode.decal),
        child: Container(
          height:
              bottom == null ? screenPadding.top + 56 : screenPadding.top + 108,
          width: screen.width,
          padding: EdgeInsets.only(
              left: 20, right: 20, top: screenPadding.top, bottom: 8),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(opacity),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (leading != null) leading!,
                      if (leading != null)
                        const SizedBox(
                          width: 10,
                        ),
                      Text(
                        title,
                        style: TextStyle(
                            color: titleColor,
                            fontSize: 26,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
              if (bottom != null)
                const SizedBox(
                  height: 20,
                ),
              if (bottom != null) bottom!,
            ],
          ),
        ),
      ),
    );
  }
}
