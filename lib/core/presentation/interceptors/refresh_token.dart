import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/data/repository_impl.dart';
import 'package:rinjani_visitor/features/authentication/domain/repo/auth.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';

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
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String? accessToken = authViewModel.getAccessToken();
    options.headers.addAll(<String, String>{'Authorization': "$accessToken"});
    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode != 401) {
      handler.next(err);
      return;
    }
    if (authViewModel.getRefreshToken() == null) {
      handler.next(err);
      return;
    }
    await authViewModel.refresh();
    if (authViewModel.getAccessToken() == null) {
      handler.next(err);
      return;
    }
    // restart the request with new token

    handler.next(err);
  }
}
