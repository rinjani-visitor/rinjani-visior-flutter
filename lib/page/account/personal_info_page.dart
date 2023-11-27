import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/widget/form/input_field.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth_detail.dart';

class PersonalInfoPage extends ConsumerStatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  ConsumerState<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends ConsumerState<PersonalInfoPage> {
  late final _initState = ref.read(authDetailViewModelProvider);

  late final TextEditingController _nameController =
      TextEditingController(text: _initState.asData?.value?.name ?? "");
  late final TextEditingController _emailController =
      TextEditingController(text: _initState.asData?.value?.email ?? "");
  late final TextEditingController _phoneController =
      TextEditingController(text: _initState.asData?.value?.phoneNumber ?? "");
  late final TextEditingController _countryController =
      TextEditingController(text: _initState.asData?.value?.country ?? "");
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
  Widget build(BuildContext context) {
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
                    InputField(
                      controller: _nameController,
                      label: 'Name',
                      enabled: false,
                    ),
                    InputField(
                      controller: _emailController,
                      label: 'Email',
                      enabled: false,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _phoneController,
                      label: 'Phone Number',
                      enabled: false,
                    ),
                    InputField(
                      controller: _countryController,
                      label: 'Country',
                      enabled: false,
                    ),
                  ],
                ))));
  }
}
