import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  Widget userProfile(String username) {
    return Flexible(
      child: Column(
        children: [
          CircularProfileAvatar(
            //code buat akses file di onTap
            onTap: () {},
            borderColor: mediumGray,
            backgroundColor: lightGray,
            initialsText: const Text('AD'),
            '',

            child: Image.asset('assets/Google.png'),
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
      ),
    );
  }

  Widget information(BuildContext context) {
    return Flexible(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Information',
            style: blackTextStyle.copyWith(fontSize: 20, fontWeight: bold),
          ),
          Column(
            children: [
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/personal-info');
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
              Divider(
                color: blackColor,
              ),
              CupertinoListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/user-setting');
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
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final username =
        ref.read(authRiverpodProvider).asData?.value?.username ?? "User";
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Profile'),
        ),
        SliverToBoxAdapter(
          child: Container(
            width: double.infinity,
            height: 314,
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [userProfile(username), information(context)],
            ),
          ),
        )
      ],
    ));
  }
}
