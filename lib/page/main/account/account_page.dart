import 'dart:io';
import 'dart:developer' as developer;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/services/camera_service.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';

class AccountPage extends ConsumerStatefulWidget {
  const AccountPage({super.key});

  @override
  ConsumerState<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends ConsumerState<AccountPage> {
  void uploadAvatar(BuildContext context, File? file) {
    if (file == null) return;
    ref.read(authDetailViewModelProvider.notifier).uploadAvatar(file);
    Navigator.pop(context);
  }

  void showOptions() {
    final camNotifier = ref.read(cameraServiceProvider.notifier);
    showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
              cancelButton: CupertinoActionSheetAction(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("Cancel")),
              actions: [
                CupertinoActionSheetAction(
                  onPressed: () async {
                    uploadAvatar(context, await camNotifier.openCamera());
                  },
                  child: const Text('Take a photo'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () async {
                    uploadAvatar(context, await camNotifier.openImagePicker());
                  },
                  child: const Text('Choose from gallery'),
                ),
              ],
            ));
  }

  Widget avatar(String username, String imgUrl) {
    developer.log(imgUrl, name: runtimeType.toString());
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        GestureDetector(
          onTap: () => showOptions(),
          child: CircleAvatar(
            backgroundColor: lightGray,
            radius: 80,
            backgroundImage: CachedNetworkImageProvider(imgUrl),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        //username dari user
        Text(
          username,
          style: blackTextStyle.copyWith(fontSize: 24, fontWeight: bold),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final userDetail = ref.watch(authDetailViewModelProvider);
    return CupertinoPageScaffold(
        child: RefreshIndicator.adaptive(
            onRefresh: () async {
              await ref.read(authDetailViewModelProvider.notifier).refresh();
            },
            child: userDetail.when(
                data: (data) => CustomScrollView(
                      slivers: [
                        const CupertinoSliverNavigationBar(
                          largeTitle: Text('Account'),
                        ),
                        SliverToBoxAdapter(
                          child: avatar(
                              userDetail.asData?.value?.name ?? "User",
                              userDetail.asData?.value?.profileImg ?? ""),
                        ),
                        SliverToBoxAdapter(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 16.0, horizontal: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Information',
                                  style: blackTextStyle.copyWith(
                                      fontSize: heading4, fontWeight: bold),
                                ),
                                CupertinoListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/personal');
                                  },
                                  padding: const EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.person,
                                    color: blackColor,
                                  ),
                                  title: const Text('Personal Information'),
                                  trailing: Icon(
                                    Icons.chevron_right,
                                    color: blackColor,
                                    size: 32,
                                  ),
                                ),
                                CupertinoListTile(
                                  onTap: () {
                                    Navigator.pushNamed(context, '/settings');
                                  },
                                  padding: const EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.settings,
                                    color: blackColor,
                                  ),
                                  title: const Text('Account settings'),
                                  trailing: Icon(
                                    Icons.chevron_right,
                                    color: blackColor,
                                    size: 32,
                                  ),
                                ),
                                CupertinoListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/booking/history');
                                  },
                                  padding: const EdgeInsets.all(0),
                                  leading: Icon(
                                    Icons.history,
                                    color: blackColor,
                                  ),
                                  title: const Text('Booking History'),
                                  trailing: Icon(
                                    Icons.chevron_right,
                                    color: blackColor,
                                    size: 32,
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                error: (error, _) => Center(
                      child: Text("error $error"),
                    ),
                loading: () => const Center(
                      child: CupertinoActivityIndicator(),
                    ))));
  }
}
