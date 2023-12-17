import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'IMGUR_CLIENT_ID')
  static const String imgurClientID = _Env.imgurClientID;
}
