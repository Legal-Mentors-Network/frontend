import 'package:go_router/go_router.dart';

class GoRoutePartial {
  String name;
  String path;
  GoRouterPageBuilder? pageBuilder;

  GoRoutePartial({required this.name, required this.path, required this.pageBuilder});
}
