import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/profile/domain/profile_model.dart';

final profileViewModelProvider =
    StateNotifierProvider<ProfileViewModel, ProfileEntity>(
        (ref) => ProfileViewModel());

/// this profile viewmodel is used to handle profile data like change name, email, etc
/// this will be use profile repository for communicate with backend
class ProfileViewModel extends StateNotifier<ProfileEntity> {
  ProfileViewModel()
      : super(
            ProfileEntity(name: "", email: "", birthDate: "", phoneNumber: ""));

  void changeName(String name) {
    state.name = name;
  }

  void changeEmail(String email) {
    state.email = email;
  }
}
