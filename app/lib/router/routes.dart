import 'package:lmn/router/route.dart';

class Routes {
  static Route home = Route(name: 'home', path: '/');
  static Route matches = Route(name: 'matches', path: '/matches', title: 'Find a match');
  static Route welcome = Route(name: 'welcome', path: '/welcome');
}

final List<Route> routes = [];
final List<Route> protectedRoutes = [Routes.home, Routes.matches];
