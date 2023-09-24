import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rinjani_visitor/features/secure_storage/presentation/secure_storage_riverpod.dart';

class AuthLocalSource {
  // ignore: constant_identifier_names
  static const TOKEN_KEY = "token_key";
  final FlutterSecureStorage storage;

  AuthLocalSource({required this.storage});

  static final provider = Provider(
      (ref) => AuthLocalSource(storage: ref.read(secureStorageProvider)));

  void saveToken(String token) async {
    await storage.write(key: AuthLocalSource.TOKEN_KEY, value: token);
  }

  Future<String> getToken() async {
    return await storage.read(key: AuthLocalSource.TOKEN_KEY) ?? "";
  }
}
