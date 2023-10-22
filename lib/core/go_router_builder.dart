import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:rinjani_visitor/page/account_page.dart';
import 'package:rinjani_visitor/page/booking_detail_page.dart';
import 'package:rinjani_visitor/page/detail_page.dart';
import 'package:rinjani_visitor/page/event_detail.dart';
import 'package:rinjani_visitor/page/event_page.dart';
import 'package:rinjani_visitor/page/home_page.dart';
import 'package:rinjani_visitor/page/login_page.dart';
import 'package:rinjani_visitor/page/register_page.dart';
import 'package:rinjani_visitor/page/search_page.dart';
import 'package:rinjani_visitor/page/splash_screen.dart';
import 'package:rinjani_visitor/page/wishlist_page.dart';

part 'go_router_builder.g.dart';

@TypedGoRoute<SplashScreenRoute>(path: '/', routes: [
  TypedGoRoute<LogInRoute>(path: 'logIn'),
  TypedGoRoute<RegisterRoute>(path: 'register'),
  TypedGoRoute<HomeRoute>(
      path: 'home', routes: [TypedGoRoute<SearchRoute>(path: 'search')]),
  TypedGoRoute<ProductDetailRoute>(path: 'product'),
  TypedGoRoute<BookingDetailRoute>(path: "booking"),
  TypedGoRoute<EventRoute>(
      path: 'event', routes: [TypedGoRoute<EventDetailRoute>(path: ":id")]),
  TypedGoRoute<WishlistRoute>(path: 'wishlist'),
  TypedGoRoute<AccountRoute>(path: 'account'),
])
@immutable
class SplashScreenRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashScreen();
  }
}

@immutable
class LogInRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
  }
}

@immutable
class RegisterRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegisterPage();
  }
}

@immutable
class HomeRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@immutable
class SearchRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

@immutable
class EventRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EventPage();
  }
}

@immutable
class EventDetailRoute extends GoRouteData {
  final String id;

  const EventDetailRoute({required this.id});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const EventDetail();
  }
}

@immutable
class WishlistRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WishlistPage();
  }
}


@immutable
class AccountRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AccountPage();
  }
}

// Poducts
@immutable
class ProductDetailRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return DetailPage();
  }
}

@immutable
class BookingDetailRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const BookingDetailPage();
  }
}