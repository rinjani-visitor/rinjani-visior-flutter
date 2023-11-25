import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';

class PersonalInfoPage extends ConsumerWidget {
  const PersonalInfoPage({super.key});

  Widget userInfo(String label, String info) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style:
                  blackTextStyle.copyWith(fontSize: 16, fontWeight: semibold),
            ),
            const SizedBox(
              height: 8,
            ),
            Container(
                width: double.infinity,
                padding: const EdgeInsets.all(8),
                margin: const EdgeInsets.only(bottom: 8),
                height: 43,
                decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(smallRadius)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      info,
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
    final state = ref.watch(authDetailViewModelProvider);
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
                    userInfo('Username', state.asData?.value?.name ?? ""),
                    userInfo('Email', state.asData?.value?.email ?? ""),
                    userInfo(
                        'Phone number', state.asData?.value?.phoneNumber ?? ""),
                    userInfo('Country', state.asData?.value?.country ?? ""),
                  ],
                ))));
  }
}
