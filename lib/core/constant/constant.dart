enum RouteMap {
  root,
  welcome,
  home,
  event,
  wishlist,
  profile,
  search,
}

enum Language { system, enUS, enCK, idID }

enum ConstantProps {
  apiUrl,
}

const Map<ConstantProps, dynamic> constant = {
  ConstantProps.apiUrl: "http://localhost"
};
