import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/page/category_explore_page.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  const CategoryItem({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(bottom: 6),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mediumGray,
                border: Border.all(color: lightGray)),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) =>
                            CategoryExplorePage(title: '$label')));
              },
              icon: Icon(Icons.landscape),
              iconSize: 32,
              color: primaryColor,
            )),
        Text(
          '$label',
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        )
      ],
    );
  }
}
