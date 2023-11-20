// Mocks generated by Mockito 5.4.3 from annotations
// in rinjani_visitor/test/features/authentication/presentation/auth_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;

import 'package:mockito/mockito.dart' as _i1;
import 'package:rinjani_visitor/features/authentication/data/auth_repository_impl.dart'
    as _i5;
import 'package:rinjani_visitor/features/authentication/data/source/local.dart'
    as _i2;
import 'package:rinjani_visitor/features/authentication/data/source/remote.dart'
    as _i3;
import 'package:rinjani_visitor/features/authentication/domain/entity/auth.dart'
    as _i4;

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

class _FakeAuth_2 extends _i1.SmartFake implements _i4.Auth {
  _FakeAuth_2(
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
    implements _i5.AuthRepositoryImpl {
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
  _i6.Future<_i4.Auth?> logout() => (super.noSuchMethod(
        Invocation.method(
          #logout,
          [],
        ),
        returnValue: _i6.Future<_i4.Auth?>.value(),
      ) as _i6.Future<_i4.Auth?>);

  @override
  _i6.Future<_i4.Auth> register({
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
        returnValue: _i6.Future<_i4.Auth>.value(_FakeAuth_2(
          this,
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
        )),
      ) as _i6.Future<_i4.Auth>);

  @override
  _i6.Future<_i4.Auth> logIn({
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
        returnValue: _i6.Future<_i4.Auth>.value(_FakeAuth_2(
          this,
          Invocation.method(
            #logIn,
            [],
            {
              #email: email,
              #password: password,
            },
          ),
        )),
      ) as _i6.Future<_i4.Auth>);

  @override
  _i6.Future<_i4.Auth?> getSavedSession() => (super.noSuchMethod(
        Invocation.method(
          #getSavedSession,
          [],
        ),
        returnValue: _i6.Future<_i4.Auth?>.value(),
      ) as _i6.Future<_i4.Auth?>);
}
