import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/page/main/home/category/category_explore_page.dart';
import 'package:rinjani_visitor/core/presentation/widget/category_item.dart';

class CategorySelector extends ConsumerWidget {
  const CategorySelector({super.key});

  void _toCategoryPage(BuildContext context, String label, String category) {
    Navigator.push(
        context,
        CupertinoPageRoute(
            builder: (context) => CategoryExplorePage(
                  category: category,
                  title: label,
                )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style: blackTextStyle.copyWith(fontSize: 24, fontWeight: semibold),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CategoryItem(
                label: 'Rinjani',
                iconName: Icons.landscape,
                onTap: (label) => _toCategoryPage(context, label, "rinjani"),
              ),
              CategoryItem(
                label: 'Home Stay',
                iconName: Icons.hotel,
                onTap: (label) => _toCategoryPage(context, label, "homeStay"),
              ),
              CategoryItem(
                label: 'Culture',
                iconName: Icons.self_improvement,
                onTap: (label) => _toCategoryPage(context, label, "culture"),
              ),
              CategoryItem(
                  label: 'Landscape',
                  iconName: Icons.hiking,
                  onTap: (label) =>
                      _toCategoryPage(context, label, "landscape")),
            ],
          )
        ],
      ),
    );
  }
}
