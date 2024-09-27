import 'package:lmn/models/route.dart';

class Routes {
  static Route home = Route(name: 'home', path: '/');
  static Route matches = Route(name: 'matches', path: '/matches', title: 'Find a match');
  static Route conversations = Route(name: 'conversations', path: '/conversations', title: 'Messsages');
  static Route chat = Route(name: 'chat', path: '/chat/:conversationId');
  static Route settings = Route(name: 'settings', path: '/settings', title: "Settings");
  static Route profile = Route(name: 'profile', path: '/profile', title: "Profile");

  static Route welcome = Route(name: 'welcome', path: '/welcome');
  static Route profileIntro = Route(name: 'profileIntro', path: '/profile-intro');

  static Route profileUploadPhoto = Route(name: 'profile-upload-photo', path: '/profile-upload-photo');
}

final List<Route> routes = [
  Routes.welcome,
];

final List<Route> protectedRoutes = [
  Routes.home,
  Routes.matches,
  Routes.settings,
  Routes.conversations,
  Routes.chat,
  Routes.profile,
];

final List<Route> onboardingRoutes = [
  Routes.profileIntro,
  Routes.profileUploadPhoto,
];

bool contains(List<Route> routes, String location) {
  if (location.isEmpty || routes.isEmpty) return false;

  for (final route in routes) {
    if (route.path == location) return true;
  }

  return false;
}
