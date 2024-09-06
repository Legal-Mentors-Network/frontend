import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/components/bottom_bar/nav_item.dart';
import 'package:lmn/common/components/bottom_bar/state.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/models/route.dart' as app_route;
import 'package:lmn/router/routes.dart';

class AppBottomBar extends ConsumerWidget {
  const AppBottomBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeRoute = ref.watch(bottomBarState);

    ref.listen(bottomBarState, (prev, curr) {
      context.go(curr);
    });

    void onTap(app_route.Route route) {
      ref.read(bottomBarState.notifier).setRoute(route);
    }

    return BottomAppBar(
      padding: const EdgeInsets.symmetric(horizontal: lg, vertical: sm),
      child: Material(
        elevation: xs,
        borderRadius: BorderRadius.circular(mx),
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: md),
          decoration: BoxDecoration(
            color: context.colors.primaryContainer,
            borderRadius: BorderRadius.circular(mx),
          ),
          child: Row(
            children: [
              NavItem(
                icon: Icons.home_outlined,
                onTap: () => onTap(Routes.home),
                selected: activeRoute == Routes.home.path,
              ),
              NavItem(
                icon: Icons.group_outlined,
                onTap: () => onTap(Routes.matches),
                selected: activeRoute == Routes.matches.path,
              ),
              NavItem(
                icon: Icons.comment_outlined,
                onTap: () => onTap(Routes.conversations),
                selected: activeRoute == Routes.conversations.path,
              ),
              NavItem(
                icon: Icons.settings_outlined,
                onTap: () => onTap(Routes.settings),
                selected: activeRoute == Routes.settings.path,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
