import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/core/presentation/theme/theme.dart';
import 'package:rinjani_visitor/core/presentation/widget/button/primary_button.dart';
import 'package:rinjani_visitor/core/presentation/widget/form/input_field.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';
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

  bool get _isChanged =>
      _nameController.text != _initState.asData?.value?.name ||
      _phoneController.text != _initState.asData?.value?.phoneNumber ||
      _countryController.text != _initState.asData?.value?.country;
  void _setTextControllers(AuthDetailEntity? authDetail) {
    _nameController.text = authDetail?.name ?? "";
    _emailController.text = authDetail?.email ?? "";
    _phoneController.text = authDetail?.phoneNumber ?? "";
    _countryController.text = authDetail?.country ?? "";
  }

  void _showEditNameDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Edit'),
            content: CupertinoTextField(
              controller: _nameController,
              padding: const EdgeInsets.all(8),
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

  void _showEditPhoneNumberDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Edit'),
            content: CupertinoTextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.send,
              padding: const EdgeInsets.all(8),
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

  void _showEditCountryDialog() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('Edit'),
            content: CupertinoTextField(
              controller: _countryController,
              readOnly: true,
              onTap: () {
                showCountryPicker(
                    context: context,
                    showSearch: false,
                    onSelect: (country) {
                      _countryController.text = country.name;
                    });
              },
              padding: const EdgeInsets.all(8),
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
    state.whenData((data) {
      _setTextControllers(data);
    });
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGrey6,
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
                      readOnly: true,
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
                      readOnly: true,
                      suffix: CupertinoButton(
                        onPressed: () {
                          _showEditPhoneNumberDialog();
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    InputField(
                      controller: _countryController,
                      label: 'Country',
                      readOnly: true,
                      suffix: CupertinoButton(
                        onPressed: () {
                          _showEditCountryDialog();
                        },
                        child: const Text('Edit'),
                      ),
                    ),
                    _isChanged
                        ? PrimaryButton(
                            isLoading: state is AsyncLoading,
                            onPressed: () {
                              ref
                                  .read(authDetailViewModelProvider.notifier)
                                  .updateUserDetail(
                                    name: _nameController.text,
                                    phoneNumber: _phoneController.text,
                                    country: _countryController.text,
                                  );
                            },
                            child: const Text('Save'),
                          )
                        : const SizedBox.shrink(),
                  ],
                ))));
  }
}
