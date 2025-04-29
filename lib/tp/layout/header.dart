import 'package:flutter/material.dart';

class HeaderButton extends StatelessWidget {
  final String label;

  const HeaderButton({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ));
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF58B0F0),
      padding: EdgeInsets.symmetric(vertical: 25),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          HeaderButton(label: "Nouveau"),
          HeaderButton(label: "Accueil"),
          HeaderButton(label: "Rechercher"),
        ],
      ),
    );
  }
}
