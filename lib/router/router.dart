import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/layouts/main_layout.dart';
import 'package:lmn/models/go_route_partial.dart';
import 'package:lmn/router/go_routes.dart';
import 'package:lmn/router/routes.dart';
import 'package:lmn/state/auth.dart';

final routerProvider = Provider((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    redirect: (context, state) {
      final authenticatedUser = ref.watch(auth);
      final location = state.uri.toString();

      if (authenticatedUser.isLoading) return null;

      debugPrint("route $location [user ${authenticatedUser.value?.email}]");

      // if the user is new and onboarding (meaning they currently don't have profile info)
      // only allow onboarding screens
      // temporarily redirecting to profile intro, but should go to last profile screen worked on/ the next screen
      // after that - store current onboarding route in local database
      final onboarding = authenticatedUser.value?.onboarding ?? false;
      final bool isOnboarding = authenticatedUser.value != null && onboarding && !contains(onboardingRoutes, location);

      if (authenticatedUser.value == null && !contains(routes, location)) {
        return Routes.welcome.path;
      } else if (isOnboarding) {
        return Routes.profileIntro.path;
      }

      return null;
    },
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => AppLayout(
          params: state.pathParameters,
          child: child,
        ),
        routes: [
          home,
          matches,
          conversations,
          settings,
          profile,
        ],
      ),
      assignNavigatorKey(chat, rootNavigatorKey),
      assignNavigatorKey(welcome, rootNavigatorKey),
      assignNavigatorKey(profileIntro, rootNavigatorKey),
    ],
  );
});

GoRoute assignNavigatorKey(
  GoRoutePartial partial,
  GlobalKey<NavigatorState>? rootNavigatorKey,
) {
  return GoRoute(
    parentNavigatorKey: rootNavigatorKey,
    name: partial.name,
    path: partial.path,
    pageBuilder: partial.pageBuilder,
  );
}
