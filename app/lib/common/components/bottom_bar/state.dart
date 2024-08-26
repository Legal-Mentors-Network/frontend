import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/models/route.dart';
import 'package:lmn/router/routes.dart';

class BottomBarNotifier extends Notifier<String> {
  @override
  String build() => Routes.home.path;

  void setRoute(Route route) {
    state = route.path;
  }
}

final bottomBarState = NotifierProvider<BottomBarNotifier, String>(BottomBarNotifier.new);
