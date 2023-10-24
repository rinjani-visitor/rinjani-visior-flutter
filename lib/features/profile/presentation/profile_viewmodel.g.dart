// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileViewModelHash() => r'd15631654b8dcbd0d4b378a63b81c38452ddcea3';

/// this profile viewmodel is used to handle profile data like change name, email, etc
/// this will be use profile repository for communicate with backend
///
/// Copied from [ProfileViewModel].
@ProviderFor(ProfileViewModel)
final profileViewModelProvider =
    AutoDisposeNotifierProvider<ProfileViewModel, ProfileModel>.internal(
  ProfileViewModel.new,
  name: r'profileViewModelProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileViewModelHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProfileViewModel = AutoDisposeNotifier<ProfileModel>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
