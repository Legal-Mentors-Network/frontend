import 'package:lmn/router/route.dart';

class Routes {
  static Route home = Route(name: 'home', path: '/');
  static Route matches = Route(name: 'matches', path: '/matches', title: 'Find a match');
  static Route conversations = Route(name: 'conversations', path: '/conversations', title: 'Messsages');
  static Route chat = Route(name: 'chat', path: '/chat/:conversationId');
  static Route settings = Route(name: 'settings', path: '/settings', title: "Settings");
}

final List<Route> routes = [];

final List<Route> protectedRoutes = [
  Routes.home,
  Routes.matches,
  Routes.settings,
  Routes.conversations,
  Routes.chat,
];
