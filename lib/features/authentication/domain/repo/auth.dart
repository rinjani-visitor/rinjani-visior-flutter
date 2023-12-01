import 'dart:io';

import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart';

abstract class AuthRepository {
  Future<AuthEntity?> register(
      {required String username,
      required String email,
      required String country,
      required String phone,
      required String password});

  Future<AuthEntity?> logIn({required String email, required String password});
  Future<AuthDetailEntity?> getUserDetail(String accessToken, String userId);
  Future<void> updateUserDetail(
    String accessToken,
    String userId, {
    String? phoneNumber,
    String? email,
    String? password,
    String? confirmPassword,
  });
  Future<bool?> uploadAvatar(String accessToken, File file);

  Future<String?> resetPassword({required String email});

  Future<AuthEntity?> logout();
  Future<AuthEntity?> getSavedSession();
  Future<AuthEntity?> refresh(AuthEntity? authEntity);
}
