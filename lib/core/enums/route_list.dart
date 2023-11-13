enum RouteLocation {
  splashScreen,
  login,
  register,
  home,
  search,
  about,
  contact,
  settings,
}

extension RouteLocationExtension on RouteLocation {
  String get route {
    switch (this) {
      case RouteLocation.home:
        return '/';
      case RouteLocation.about:
        return '/about';
      case RouteLocation.contact:
        return '/contact';
      case RouteLocation.settings:
        return '/settings';
      default:
        return "";
    }
  }
}
