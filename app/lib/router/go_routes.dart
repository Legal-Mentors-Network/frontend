import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/features/home/home.dart';
import 'package:lmn/router/routes.dart';

GoRoute home = GoRoute(
  name: Routes.home.name,
  path: Routes.home.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Home());
  },
);

GoRoute matches = GoRoute(
  name: Routes.matches.name,
  path: Routes.matches.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Home());
  },
);

GoRoute conversations = GoRoute(
  name: Routes.conversations.name,
  path: Routes.conversations.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Home());
  },
);

GoRoute placeholder = GoRoute(
  name: Routes.placeholder.name,
  path: Routes.placeholder.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Home());
  },
);
