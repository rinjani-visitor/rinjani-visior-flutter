import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RatingSelector extends StatefulWidget {
  final int rating;
  final int currentRating;
  final Function(int value) onStarTapped;
  const RatingSelector(
      {super.key,
      required this.rating,
      required this.currentRating,
      required this.onStarTapped});

  @override
  State<RatingSelector> createState() => _RatingSelectorState();
}

class _RatingSelectorState extends State<RatingSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.rating, (index) {
        final icon = index + 1 <= widget.currentRating
            ? Icons.star
            : Icons.star_outline_outlined;
        final color = index + 1 <= widget.currentRating
            ? CupertinoColors.systemYellow
            : CupertinoColors.systemGrey;
        return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => widget.onStarTapped(index + 1),
          child: Icon(
            icon,
            color: color,
            size: 48.0,
          ),
        );
      }),
    );
  }
}
