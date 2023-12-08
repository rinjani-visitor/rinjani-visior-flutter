import 'package:flutter/cupertino.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final IconData iconName;
  final void Function(String label)? onTap;
  const CategoryItem(
      {super.key, required this.label, required this.iconName, this.onTap});

  void _onTapHandler() {
    if (onTap == null) return;
    onTap!(label);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTapHandler,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: mediumGray,
                border: Border.all(color: CupertinoColors.systemGrey5)),
            child: Icon(
              iconName,
              color: primaryColor,
              size: 32,
            ),
          ),
          Text(
            label,
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
