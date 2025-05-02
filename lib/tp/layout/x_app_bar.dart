import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class XAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const XAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title ?? "",
        style: GoogleFonts.yatraOne(
            fontSize: 50,
            fontWeight: FontWeight.w600,
          ),),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
    // AppBar().preferredSize.height
    kToolbarHeight
  );
}