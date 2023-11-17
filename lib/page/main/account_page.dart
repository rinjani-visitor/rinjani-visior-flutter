import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  Widget header(String username) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        CircleAvatar(
          backgroundColor: lightGray,
          radius: 80,
          backgroundImage: const AssetImage('assets/booking-success.png'),
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
  Widget build(BuildContext context, WidgetRef ref) {
    final username =
        ref.read(authRiverpodProvider).asData?.value?.username ?? "User";
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Account'),
        ),
        SliverToBoxAdapter(
          child: header(username),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
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
                    Navigator.pushNamed(context, '/booking/history');
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
    ));
  }
}
