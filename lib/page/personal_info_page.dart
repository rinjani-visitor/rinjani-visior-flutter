import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/profile/presentation/profile_view_model.dart';
import 'package:rinjani_visitor/theme/theme.dart';

class PersonalInfoPage extends ConsumerWidget {
  const PersonalInfoPage({Key? key}) : super(key: key);

  Widget userInfo(String label, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$label',
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(bottom: 8),
                height: 43,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(smallRadius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$info',
                    ),
                  ],
                ))
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoPageScaffold(
        backgroundColor: backgroundColor,
        navigationBar: const CupertinoNavigationBar(
          middle: Text('Personal Information'),
        ),
        child: SafeArea(
            child: Container(
                margin: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    userInfo(
                        'Username', ref.read(profileViewModelProvider).name),
                    userInfo('Email', ref.read(profileViewModelProvider).email),
                    userInfo('Phone number',
                        ref.read(profileViewModelProvider).phoneNumber),
                    userInfo('Birth date',
                        ref.read(profileViewModelProvider).birthDate),
                  ],
                ))));
  }
}
