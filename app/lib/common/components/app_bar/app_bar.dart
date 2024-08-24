import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/router/routes.dart';

class AppNavigationBar extends StatelessWidget implements PreferredSizeWidget {
  const AppNavigationBar({
    super.key,
    required this.params,
  });

  final Map<String, String> params;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final title = getRouteTitle(location) ?? "";

    return AppBar(
      title: Text(title, style: context.text.titleMedium),
      centerTitle: true,
      scrolledUnderElevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

String? getRouteTitle(String location) {
  final route = protectedRoutes.where((route) => route.path == location);
  return route.isNotEmpty ? route.first.title : null;
}
