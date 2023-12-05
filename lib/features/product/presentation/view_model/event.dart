import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rinjani_visitor/features/authentication/presentation/view_model/auth.dart';
import 'package:rinjani_visitor/features/product/data/repository_impl.dart';
import 'package:rinjani_visitor/features/product/domain/entity/product.dart';

final eventViewModelProvider =
    AsyncNotifierProvider<EventViewModel, List<ProductEntity>>(
        EventViewModel.new);

class EventViewModel extends AsyncNotifier<List<ProductEntity>> {
  AuthViewModel get authData => ref.read(authViewModelProvider.notifier);
  @override
  FutureOr<List<ProductEntity>> build() async {
    final data = await ref.read(productRepositoryProvider).getProducts(
          authData.getAccessToken()!,
          category: "event",
        );
    return data;
  }
}
