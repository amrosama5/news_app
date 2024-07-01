import 'package:flutter/material.dart';

class DrawerTab extends StatelessWidget {
  const DrawerTab({required this.onTap, super.key});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 150,
          color: Colors.green,
          child: const Center(
            child: Text(
              "News App!",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            onTap(1);
          },
          child: const Row(
            children: [
              Icon(
                Icons.category,
                size: 35,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Categories",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        InkWell(
          onTap: () {
            onTap(2);
          },
          child: const Row(
            children: [
              Icon(
                Icons.settings,
                size: 35,
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                "Settings",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
