import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(varName: 'IMGURL_CLIENT_ID')
  static const String imgurlClientID = _Env.imgurlClientID;
}
