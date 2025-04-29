import 'package:flutter/material.dart';

class FooterButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const FooterButton({super.key, required this.label, this.isActive = false});

  Color getColor(){
    return isActive ? Color(0xFF58B0F0) : Colors.grey;
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(color: getColor(), fontSize: 20),
        ));
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FooterButton(label: "Fil", isActive: true),
          FooterButton(label: "Notification"),
          FooterButton(label: "Message"),
          FooterButton(label: "Moi"),
        ],
      ),
    );
  }
}
