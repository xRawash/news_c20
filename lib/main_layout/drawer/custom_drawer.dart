import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/main_layout/home_screen/home_Screen.dart';

class CustomDrawer extends StatefulWidget {
  CustomDrawer({super.key, required this.onGoToHomeClicked});
  void Function() onGoToHomeClicked;
  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 166,
            width: double.infinity,
            color: ColorsManager.white,
            child: Center(
              child: Text(
                "News App",
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorsManager.black),
              ),
            ),
          ),
          ListTile(
            onTap: () => widget.onGoToHomeClicked(),
            iconColor: ColorsManager.white,
            textColor: ColorsManager.white,
            leading: Icon(Icons.home),
            title: Text(
              "Go To Home",
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          Divider(thickness: 2, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Row(
                  children: [
                    Icon(Icons.format_paint_outlined, color: ColorsManager.white,),
                    SizedBox(width: 16,),
                    Text("Theme", style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                DropdownMenu(
                  initialSelection: "Dark",
                  onSelected: (value) {},
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Dark", label: "Dark"),
                    DropdownMenuEntry(value: "Light", label: "Light"),
                  ],
                ),
              ],
            ),
          ),
          Divider(thickness: 2, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Row(
                  children: [
                    Icon(Icons.language, color: ColorsManager.white,),
                    SizedBox(width: 16,),
                    Text("Language", style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                DropdownMenu(
                  width: double.infinity,
                  initialSelection: "English",
                  onSelected: (value) {},
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "English", label: "English"),
                    DropdownMenuEntry(value: "Arabic", label: "Arabic"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
