import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class ReviewCardWidget extends StatelessWidget {
  final String name;
  final String? avatarUrl;
  final String createdTime;
  final String message;
  const ReviewCardWidget(
      {super.key,
      required this.name,
      required this.createdTime,
      required this.message,
      this.avatarUrl});

  Widget avatar({double radius = 16.0}) {
    final finalRadius = radius;
    return CachedNetworkImage(
      imageUrl: avatarUrl ?? "",
      placeholder: (context, url) => CircleAvatar(
        backgroundColor: CupertinoColors.systemGrey5,
        radius: finalRadius,
      ),
      imageBuilder: (context, imageProvider) => CircleAvatar(
        radius: finalRadius,
        backgroundImage: imageProvider,
      ),
      errorWidget: (context, url, error) => CircleAvatar(
        radius: finalRadius,
        backgroundColor: CupertinoColors.systemGrey5,
        child: const Icon(
          CupertinoIcons.person,
          color: CupertinoColors.systemGrey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 198,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
          border: Border.all(color: blackColor),
          borderRadius: BorderRadius.circular(bigRadius)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: blackTextStyle.copyWith(
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            children: [
              avatar(),
              const SizedBox(
                width: 4,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: blackTextStyle.copyWith(
                          fontSize: 16, fontWeight: semibold),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      createdTime,
                      style: grayTextStyle.copyWith(fontSize: 10),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
