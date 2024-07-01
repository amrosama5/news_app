import 'package:flutter/material.dart';
import 'package:news_app_api/screens/drawer_tab.dart';

import '../screens/category_screen.dart';
import '../screens/data_tab.dart';
import '../models/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = "HomeScreen";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  CategoryModel? categoryModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
          )),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          drawer: Drawer(
            child: DrawerTab(
              onTap: onDrawerClicked,
            ),
          ),
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
          body: categoryModel == null
              ? CategoryScreen(onTap: onClick)
              : DataTab(
                  categorySearch: categoryModel!.id,
                )),
    );
  }

  onClick(categoryModel) {
    this.categoryModel = categoryModel;
    setState(() {});
  }

  onDrawerClicked(val) {
    if (val == 1) {
      categoryModel = null;
      Navigator.pop(context);
      setState(() {});
    } else if (val == 2) {}
  }
}
