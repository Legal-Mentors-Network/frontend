import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:lmn/common/theme/theme.dart';
import 'package:lmn/data/config_table.dart';
import 'package:lmn/router/router.dart';
import 'package:lmn/state/state.dart';
import 'package:lmn/state/theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();
  Intl.defaultLocale = 'en_GB';

  final container = ProviderContainer();
  final db = await container.read(databaseProvider);

  final item = await ConfigTable(db).getItem(ThemeNotifier.field);

  if (item != null) {
    final themeMode = ThemeMode.values.firstWhere((e) => e.name == item.value);
    container.read(themeProvider.notifier).initialiseWith(themeMode);
  }

  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MainApp(),
    ),
  );
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'LMN',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(context),
      darkTheme: AppTheme.dark(context),
      themeMode: themeMode,
      routerConfig: router,
    );
  }
}
