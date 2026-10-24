import 'package:flutter/material.dart';
import 'package:news/API_services/sources_response/Sources.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({
    super.key,
    required this.sources,
    required this.onSourceSelected,
  });

  final List<Sources> sources;
  final void Function(Sources source) onSourceSelected;

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      initialIndex: selectedIndex,
      child: SizedBox(
        height: 50,
        child: TabBar(
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            widget.onSourceSelected(widget.sources[index]);
          },
          tabs: widget.sources.map((e) => Tab(text: e.name)).toList(),
          isScrollable: true,
          labelStyle: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: Theme.of(context).textTheme.titleSmall,
        ),
      ),
    );
  }
}
