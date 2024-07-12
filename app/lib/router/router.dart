import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/layouts/main_layout.dart';
import 'package:lmn/router/go_routes.dart';

final routerProvider = Provider((ref) {
  final rootNavigatorKey = GlobalKey<NavigatorState>();
  final shellNavigatorKey = GlobalKey<NavigatorState>();

  return GoRouter(
    navigatorKey: rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: shellNavigatorKey,
        builder: (context, state, child) => AppLayout(child: child),
        routes: [
          home,
          matches,
          conversations,
          placeholder,
        ],
      ),
    ],
  );
});
