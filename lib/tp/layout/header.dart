import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final String? label;
  final Icon? icon;

  const HeaderButton({super.key, this.label, this.icon});

  Widget getButtonType() {
    if (icon != null) {
      return IconButton(
        color: Colors.white,
        icon: icon!,
        onPressed: () {},
          );
    }
    return TextButton(
      onPressed: () {},
      child: Text(
        label ?? '',
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getButtonType();
  }
}


class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.teal,
          borderRadius: BorderRadius.circular(100)
        ),
        padding: EdgeInsets.symmetric(vertical: 25),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            HeaderButton(icon: Icon(Icons.edit)),
            HeaderButton(icon: Icon(Icons.home_filled)),
            HeaderButton(icon: Icon(Icons.search)),
          ],
        ),
      ),
    );
  }
}
