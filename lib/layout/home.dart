import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../screens/category_tab.dart';
import '../screens/data_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "Home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image:
              DecorationImage(image: AssetImage("assets/images/pattern.png"))),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: Drawer(),
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
          centerTitle: true,
          shape: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: const Text(
            "News",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: selectedCategory == null
            ? CategoryTab(onClick: onCategoryClicked)
            : DataTab(
                categoryId: selectedCategory!.id,
              ),
      ),
    );
  }

  CategoryModel? selectedCategory;

  onCategoryClicked(category) {
    selectedCategory = category;
    setState(() {});
  }
}
