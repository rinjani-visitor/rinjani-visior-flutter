import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData iconName;
  final void Function(String label)? onTap;
  const CategoryItem(
      {super.key, required this.label, required this.iconName, this.onTap});

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
            child: GestureDetector(
              onTap: () => onTap != null ? onTap!(label) : null,
              child: Icon(
                iconName,
                color: primaryColor,
                size: 16,
              ),
            )),
        Text(
          label,
          style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
        )
      ],
    );
  }
}
