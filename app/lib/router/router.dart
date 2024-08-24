import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/layouts/main_layout.dart';
import 'package:lmn/router/go_routes.dart';

final routerProvider = Provider((ref) {
  return GoRouter(
    navigatorKey: rootNavigatorKey,
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
        ],
      ),
      chat,
    ],
  );
});
