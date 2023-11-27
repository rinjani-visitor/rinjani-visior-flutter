// Mocks generated by Mockito 5.4.3 from annotations
// in rinjani_visitor/test/features/authentication/presentation/auth_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;
import 'dart:io' as _i8;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rinjani_visitor/features/authentication/data/repo.dart' as _i4;
import 'package:rinjani_visitor/features/authentication/data/source/local.dart'
    as _i2;
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart'
    as _i3;
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart'
    as _i6;
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_detail.dart'
    as _i7;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAuthLocalSource_0 extends _i1.SmartFake
    implements _i2.AuthLocalSource {
  _FakeAuthLocalSource_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAuthRemoteSource_1 extends _i1.SmartFake
    implements _i3.AuthRemoteSource {
  _FakeAuthRemoteSource_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AuthRepositoryImpl].
///
/// See the documentation for Mockito's code generation for more information.
class MockAuthRepositoryImpl extends _i1.Mock
    implements _i4.AuthRepositoryImpl {
  MockAuthRepositoryImpl() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AuthLocalSource get localSource => (super.noSuchMethod(
        Invocation.getter(#localSource),
        returnValue: _FakeAuthLocalSource_0(
          this,
          Invocation.getter(#localSource),
        ),
      ) as _i2.AuthLocalSource);

  @override
  _i3.AuthRemoteSource get remoteSource => (super.noSuchMethod(
        Invocation.getter(#remoteSource),
        returnValue: _FakeAuthRemoteSource_1(
          this,
          Invocation.getter(#remoteSource),
        ),
      ) as _i3.AuthRemoteSource);

  @override
  _i5.Future<_i6.AuthEntity?> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i5.Future<_i6.AuthEntity?>.value(),
      ) as _i5.Future<_i6.AuthEntity?>);

  @override
  _i5.Future<_i6.AuthEntity?> register({
    required String? username,
    required String? email,
    required String? country,
    required String? phone,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #register,
          [],
          {
            #username: username,
            #email: email,
            #country: country,
            #phone: phone,
            #password: password,
          },
        ),
        returnValue: _i5.Future<_i6.AuthEntity?>.value(),
      ) as _i5.Future<_i6.AuthEntity?>);

  @override
  _i5.Future<_i6.AuthEntity?> logIn({
    required String? email,
    required String? password,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #logIn,
          [],
          {
            #email: email,
            #password: password,
          },
        ),
        returnValue: _i5.Future<_i6.AuthEntity?>.value(),
      ) as _i5.Future<_i6.AuthEntity?>);

  @override
  _i5.Future<_i6.AuthEntity?> getSavedSession() => (super.noSuchMethod(
        Invocation.method(
          #getSavedSession,
          [],
        ),
        returnValue: _i5.Future<_i6.AuthEntity?>.value(),
      ) as _i5.Future<_i6.AuthEntity?>);

  @override
  _i5.Future<_i6.AuthEntity?> refresh(_i6.AuthEntity? entity) =>
      (super.noSuchMethod(
        Invocation.method(
          #refresh,
          [entity],
        ),
        returnValue: _i5.Future<_i6.AuthEntity?>.value(),
      ) as _i5.Future<_i6.AuthEntity?>);

  @override
  _i5.Future<_i7.AuthDetailEntity?> getUserDetail(
    String? accessToken,
    String? userId,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getUserDetail,
          [
            accessToken,
            userId,
          ],
        ),
        returnValue: _i5.Future<_i7.AuthDetailEntity?>.value(),
      ) as _i5.Future<_i7.AuthDetailEntity?>);

  @override
  _i5.Future<String?> resetPassword({required String? email}) =>
      (super.noSuchMethod(
        Invocation.method(
          #resetPassword,
          [],
          {#email: email},
        ),
        returnValue: _i5.Future<String?>.value(),
      ) as _i5.Future<String?>);

  @override
  _i5.Future<bool?> uploadAvatar(
    String? accessToken,
    _i8.File? file,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #uploadAvatar,
          [
            accessToken,
            file,
          ],
        ),
        returnValue: _i5.Future<bool?>.value(),
      ) as _i5.Future<bool?>);

  @override
  _i5.Future<void> updateUserDetail(
    String? accessToken,
    String? userId, {
    String? phoneNumber,
    String? password,
    String? confirmPassword,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateUserDetail,
          [
            accessToken,
            userId,
          ],
          {
            #phoneNumber: phoneNumber,
            #password: password,
            #confirmPassword: confirmPassword,
          },
        ),
        returnValue: _i5.Future<void>.value(),
        returnValueForMissingStub: _i5.Future<void>.value(),
      ) as _i5.Future<void>);
}
