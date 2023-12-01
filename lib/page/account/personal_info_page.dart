import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
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

  void _showEditNameDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Edit'),
            content: CupertinoTextField(
              controller: _nameController,
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Save'),
              ),
            ],
          );
        });
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
                      enabled: true,
                      suffix: CupertinoButton(
                        onPressed: () {
                          _showEditNameDialog();
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _emailController,
                      label: 'Email',
                      enabled: false,
                      suffix: CupertinoButton(
                        onPressed: () {},
                        child: const Text(""),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _phoneController,
                      label: 'Phone Number',
                      enabled: false,
                      suffix: CupertinoButton(
                        onPressed: () {},
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _countryController,
                      label: 'Country',
                      enabled: false,
                      suffix: CupertinoButton(
                        onPressed: () {},
                        child: const Text('Edit'),
                      ),
                    ),
                  ],
                ))));
  }
}
