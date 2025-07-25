import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/home/avatar.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/auth.dart';
import 'package:lmn/state/user.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);

    return asyncUser.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();
        return HomeView(user: data);
      },
      error: (error, stackTrace) => const Text("error"),
      loading: () => const Text("loading..."),
    );
  }
}

class HomeView extends ConsumerWidget {
  const HomeView({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: lg, left: xl, right: xl),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //
          Row(
            textDirection: TextDirection.rtl,
            children: [
              //
              Avatar(image: user.image),

              const Spacer(),

              IconButton(
                onPressed: () => {
                  debugPrint("clicked"),
                  ref.read(auth.notifier).logout(),
                },
                icon: const Icon(Icons.menu),
                iconSize: 34,
              ),
            ],
          ),

          const SizedBox(height: xl),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Welcome back,', style: context.text.titleLarge?.copyWith(color: context.colors.primary)),
              Text(
                user.name,
                style: context.text.displaySmall?.copyWith(fontWeight: FontWeight.w900, color: context.colors.primary),
              ),

              //
              const SizedBox(height: xl),
              const EnvIndicator(),
            ],
          ),
        ],
      ),
    );
  }
}

class EnvIndicator extends StatelessWidget {
  const EnvIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    String env = "Production";
    Color color = context.colors.primary;

    if (kDebugMode) {
      env = "Development";
      color = context.colors.secondary;
    }

    return Text(
      env,
      style: context.text.titleLarge?.copyWith(
        color: color,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
