// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'go_router_builder.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashScreenRoute,
    ];

RouteBase get $splashScreenRoute => GoRouteData.$route(
      path: '/',
      factory: $SplashScreenRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'logIn',
          factory: $LogInRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'register',
          factory: $RegisterRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'home',
          factory: $HomeRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: 'search',
              factory: $SearchRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'product',
          factory: $ProductDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'booking',
          factory: $BookingDetailRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'event',
          factory: $EventRouteExtension._fromState,
          routes: [
            GoRouteData.$route(
              path: ':id',
              factory: $EventDetailRouteExtension._fromState,
            ),
          ],
        ),
        GoRouteData.$route(
          path: 'wishlist',
          factory: $WishlistRouteExtension._fromState,
        ),
        GoRouteData.$route(
          path: 'account',
          factory: $AccountRouteExtension._fromState,
        ),
      ],
    );

extension $SplashScreenRouteExtension on SplashScreenRoute {
  static SplashScreenRoute _fromState(GoRouterState state) =>
      SplashScreenRoute();

  String get location => GoRouteData.$location(
        '/',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $LogInRouteExtension on LogInRoute {
  static LogInRoute _fromState(GoRouterState state) => LogInRoute();

  String get location => GoRouteData.$location(
        '/logIn',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $RegisterRouteExtension on RegisterRoute {
  static RegisterRoute _fromState(GoRouterState state) => RegisterRoute();

  String get location => GoRouteData.$location(
        '/register',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $HomeRouteExtension on HomeRoute {
  static HomeRoute _fromState(GoRouterState state) => HomeRoute();

  String get location => GoRouteData.$location(
        '/home',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $SearchRouteExtension on SearchRoute {
  static SearchRoute _fromState(GoRouterState state) => SearchRoute();

  String get location => GoRouteData.$location(
        '/home/search',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $ProductDetailRouteExtension on ProductDetailRoute {
  static ProductDetailRoute _fromState(GoRouterState state) =>
      ProductDetailRoute();

  String get location => GoRouteData.$location(
        '/product',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $BookingDetailRouteExtension on BookingDetailRoute {
  static BookingDetailRoute _fromState(GoRouterState state) =>
      BookingDetailRoute();

  String get location => GoRouteData.$location(
        '/booking',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EventRouteExtension on EventRoute {
  static EventRoute _fromState(GoRouterState state) => EventRoute();

  String get location => GoRouteData.$location(
        '/event',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $EventDetailRouteExtension on EventDetailRoute {
  static EventDetailRoute _fromState(GoRouterState state) => EventDetailRoute(
        id: state.pathParameters['id']!,
      );

  String get location => GoRouteData.$location(
        '/event/${Uri.encodeComponent(id)}',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $WishlistRouteExtension on WishlistRoute {
  static WishlistRoute _fromState(GoRouterState state) => WishlistRoute();

  String get location => GoRouteData.$location(
        '/wishlist',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $AccountRouteExtension on AccountRoute {
  static AccountRoute _fromState(GoRouterState state) => AccountRoute();

  String get location => GoRouteData.$location(
        '/account',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
