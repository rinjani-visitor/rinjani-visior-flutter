import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rinjani_visitor/features/authentication/domain/entity/auth_entity.dart';

part 'auth_model.freezed.dart';
part 'auth_model.g.dart';

@freezed
class AuthModel with _$AuthModel {
  const AuthModel._();
  const factory AuthModel(
      {String? userId,
      String? username,
      String? email,
      String? token}) = _AuthModel;
  factory AuthModel.fromJson(Map<String, dynamic> json) =>
      _$AuthModelFromJson(json);
  
  Auth toEntity() => Auth(email: email, userId: userId, username: username, token: token);
}
