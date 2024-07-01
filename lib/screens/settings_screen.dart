import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/my_provider.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = "settings screen";

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);

    bool val = provider.theme == ThemeMode.light ? false : true;
    return Container(
      decoration:  BoxDecoration(
        color: provider.theme == ThemeMode.light ? Colors.white : const Color(0xff1C1B20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/pattern.png',
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.green,
          shape: const OutlineInputBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          centerTitle: true,
          title: const Text(
            "News App",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Dark Mode",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700,color: provider.theme == ThemeMode.light ? Colors.black : Colors.white),),
              Switch(
                  value: val,
                  onChanged: (v) {
                    if (v) {
                      provider.changeTheme(ThemeMode.dark);
                    } else {
                      provider.changeTheme(ThemeMode.light);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
