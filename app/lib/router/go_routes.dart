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
