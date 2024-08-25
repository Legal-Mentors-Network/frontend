import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lmn/common/components/app_bar/app_bar.dart';
import 'package:lmn/common/components/bottom_bar/bottom_bar.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class AppLayout extends StatelessWidget {
  const AppLayout({
    super.key,
    required this.params,
    required this.child,
  });

  final Map<String, String> params;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return Scaffold(
      backgroundColor: context.colors.surface,
      appBar: location != '/' ? AppNavigationBar(params: params) : null,
      bottomNavigationBar: const AppBottomBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: md),
          child: child,
        ),
      ),
    );
  }
}
