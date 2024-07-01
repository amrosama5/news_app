import 'package:flutter/material.dart';
import 'package:news_app_api/provider/my_provider.dart';
import 'package:provider/provider.dart';

class DrawerTab extends StatelessWidget {
  const DrawerTab({required this.onTap, super.key});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration:   BoxDecoration(
        color: provider.theme == ThemeMode.light ? Colors.white : const Color(0xff1C1B20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/pattern.png',
          ),
        ),
      ),
      child: Column(
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
            child:  Row(
              children:
              [
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.category,
                  size: 35,
                  color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  "Categories",
                  style: TextStyle(color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,fontWeight: FontWeight.bold, fontSize: 22),
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
            child:  Row(
              children:
              [
                const SizedBox(
                  width: 15,
                ),
                Icon(
                  Icons.settings,
                  size: 35,
                  color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,
                ),
                const SizedBox(
                  width: 25,
                ),
                Text(
                  "Settings",
                  style: TextStyle(color: provider.theme == ThemeMode.light ? Colors.black :Colors.white,fontWeight: FontWeight.bold, fontSize: 22),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
