import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';

class CategoryItem extends StatefulWidget {
  CategoryItem({
    super.key,
    required this.title,
    required this.categoryImage,
    required this.index,
    required this.onTap,
  });

  String categoryImage;
  String title;
  int index;
  void Function() onTap;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  late bool isEven = widget.index.isEven;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        width: 363,
        height: 199,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: ColorsManager.white,
        ),
        child: Row(
          textDirection: isEven ? TextDirection.ltr : TextDirection.rtl,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: Image.asset(widget.categoryImage,height: double.infinity,fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: 24),
            Padding(
              padding: isEven ? const EdgeInsets.only(right: 16.0) : const EdgeInsets.only(left: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.displayLarge?.copyWith(color: ColorsManager.black),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(84),
                      color: Colors.grey.withOpacity(1),
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 9,
                          ),
                          child: Text(
                            "View All",
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: ColorsManager.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10000),
                            color: ColorsManager.black,
                          ),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: ColorsManager.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
