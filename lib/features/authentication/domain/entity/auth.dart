class AuthEntity {
  String? userId;
  String? username;
  String? email;
  String? role;
  String? accessToken;
  String? refreshToken;
  DateTime? accessExpiredAt;
  AuthEntity(
      {this.userId,
      this.username,
      this.email,
      this.role,
      this.accessToken,
      this.refreshToken});

  copyWith({String? accessToken}) {
    this.accessToken = accessToken ?? this.accessToken;
  }

  String toAccessTokenAuthorization() {
    return "Bearer $accessToken";
  }

  String toRefreshTokenAuthorization() {
    return "Bearer $refreshToken";
  }
}
