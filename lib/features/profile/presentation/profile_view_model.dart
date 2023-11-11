import 'package:rinjani_visitor/features/profile/domain/profile_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_view_model.g.dart';

/// this profile viewmodel is used to handle profile data like change name, email, etc
/// this will be use profile repository for communicate with backend
@Riverpod()
class ProfileViewModel extends _$ProfileViewModel {
  @override
  ProfileModel build() {
    //TODO: need to wait for backend team before define this profile entity
    return ProfileModel(name: "", email: "", birthDate: "", phoneNumber: "");
  }

  void changeName(String name) {
    state.name = name;
  }

  void changeEmail(String email) {
    state.email = email;
  }
}
