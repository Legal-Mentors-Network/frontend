import 'package:flutter/material.dart';
import 'package:lmn/common/components/app_bar/app_bar.dart';
import 'package:lmn/common/components/bottom_bar/bottom_bar.dart';
import 'package:lmn/common/extensions.dart';

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
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: child,
      ),
      appBar: AppNavigationBar(params: params),
      bottomNavigationBar: const AppBottomBar(),
    );
  }
}
