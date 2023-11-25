// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _RemoteOrderSource implements RemoteOrderSource {
  _RemoteOrderSource(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://test.rinjanivisitor.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<BookingResponse> uploadBankPayment(
    String token, {
    required String bookingId,
    required String bankName,
    required String bankAccountName,
    required String bankAccountNumber,
    required File imageProofTransfer,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'bookingId',
      bookingId,
    ));
    _data.fields.add(MapEntry(
      'bankName',
      bankName,
    ));
    _data.fields.add(MapEntry(
      'bankAccountName',
      bankAccountName,
    ));
    _data.fields.add(MapEntry(
      'bankAccountNumber',
      bankAccountNumber,
    ));
    _data.files.add(MapEntry(
      'imageProofTransfer',
      MultipartFile.fromFileSync(
        imageProofTransfer.path,
        filename: imageProofTransfer.path.split(Platform.pathSeparator).last,
        contentType: MediaType.parse('image/jpg'),
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/payment/bank',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<BookingResponse> uploadWisePayment(
    String token, {
    required String bookingId,
    required String wiseEmail,
    required String wiseAccountName,
    required File imageProofTransfer,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final _data = FormData();
    _data.fields.add(MapEntry(
      'bookingId',
      bookingId,
    ));
    _data.fields.add(MapEntry(
      'wiseEmail',
      wiseEmail,
    ));
    _data.fields.add(MapEntry(
      'wiseAccountName',
      wiseAccountName,
    ));
    _data.files.add(MapEntry(
      'imageProofTransfer',
      MultipartFile.fromFileSync(
        imageProofTransfer.path,
        filename: imageProofTransfer.path.split(Platform.pathSeparator).last,
        contentType: MediaType.parse('image/jpg'),
      ),
    ));
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<BookingResponse>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'multipart/form-data',
    )
            .compose(
              _dio.options,
              '/api/payment/wise',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = BookingResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderResponse> getOrders(
    String token,
    String userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/order',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = OrderResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<OrderResponse> cancelOrder(
    String token,
    String orderId,
    String userId,
  ) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'userId': userId};
    final _headers = <String, dynamic>{r'Authorization': token};
    _headers.removeWhere((k, v) => v == null);
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<OrderResponse>(Options(
      method: 'PATCH',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/api/order/${orderId}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = OrderResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
