import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

AndroidOptions _getAndroidOptions() => const AndroidOptions(
      encryptedSharedPreferences: true,
    );

final secureStorageProvider =
    Provider((ref) => FlutterSecureStorage(aOptions: _getAndroidOptions()));
