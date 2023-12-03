import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/main.dart';

final refreshTokenInterceptor = Provider(
  (ref) => RefreshTokenInterceptor(
    authViewModel: ref.read(authViewModelProvider.notifier),
  ),
);

class RefreshTokenInterceptor extends QueuedInterceptorsWrapper {
  final AuthViewModel authViewModel;

  RefreshTokenInterceptor(
      {super.onRequest,
      super.onResponse,
      super.onError,
      required this.authViewModel});

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authViewModel.isAccessTokenIsNotExpired) {
      final String? accessToken = authViewModel.getAccessToken();
      options.headers.addAll(<String, String>{'Authorization': "$accessToken"});
      handler.next(options);
    } else {
      await authViewModel.refresh();
      if (authViewModel.getAccessToken() == null) {
        handler.next(options);
        return;
      }
    }
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      authViewModel.logOut();
      navigatorKey.currentState?.popUntil(ModalRoute.withName("/login"));
    }
    handler.next(err);
  }
}
