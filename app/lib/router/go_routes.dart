import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/layouts/chat_layout.dart';
import 'package:lmn/common/layouts/simple_layout.dart';
import 'package:lmn/features/chat/chat.dart';
import 'package:lmn/features/conversations/conversations.dart';
import 'package:lmn/features/home/home.dart';
import 'package:lmn/features/matches/matches.dart';
import 'package:lmn/features/profile_setup/profile_intro.dart';
import 'package:lmn/features/settings/settings.dart';
import 'package:lmn/features/welcome/welcome.dart';
import 'package:lmn/models/go_route_partial.dart';
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
    return const NoTransitionPage(child: Matches());
  },
);

GoRoute conversations = GoRoute(
  name: Routes.conversations.name,
  path: Routes.conversations.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Conversations());
  },
);

GoRoute settings = GoRoute(
  name: Routes.settings.name,
  path: Routes.settings.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: Settings());
  },
);

GoRoutePartial chat = GoRoutePartial(
  name: Routes.chat.name,
  path: Routes.chat.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    final conversationId = state.pathParameters["conversationId"];

    if (conversationId == null) {
      log("Attempting to access route chat without conversationId");
      throw Exception("conversationId is required");
    }

    return NoTransitionPage(
      child: ChatLayout(
        conversationId: conversationId,
        child: Chat(
          conversationId: conversationId,
        ),
      ),
    );
  },
);

GoRoutePartial welcome = GoRoutePartial(
  name: Routes.welcome.name,
  path: Routes.welcome.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SimpleLayout(child: Welcome()));
  },
);

GoRoutePartial profileIntro = GoRoutePartial(
  name: Routes.profileIntro.name,
  path: Routes.profileIntro.path,
  pageBuilder: (BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: SimpleLayout(child: ProfileIntro()));
  },
);
