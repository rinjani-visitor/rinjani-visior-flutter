import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/auth_view_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class AccountPage extends ConsumerWidget {
  const AccountPage({Key? key}) : super(key: key);

  Widget userProfile(String username) {
    return Flexible(
      child: Column(
        children: [
          CircularProfileAvatar(
            //code buat akses file di onTap
            onTap: () {},

            child: Image.asset('assets/Google.png'),
            borderColor: mediumGray,
            backgroundColor: lightGray,
            initialsText: Text('AD'),
            '',
          ),
          SizedBox(
            height: 8,
          ),
          //username dari user
          Text(
            'Username',
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
                padding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.person,
                  color: blackColor,
                ),
                title: Text('Personal Information'),
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
                padding: EdgeInsets.all(0),
                leading: Icon(
                  Icons.settings,
                  color: blackColor,
                ),
                title: Text('Account settings'),
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
        ref.read(authViewModelProvider).asData?.value.username ?? "User";
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
            margin: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [userProfile(username), information(context)],
            ),
          ),
        )
      ],
    ));
  }
}
