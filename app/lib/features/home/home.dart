import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/home/avatar.dart';
import 'package:lmn/models/user.dart';
import 'package:lmn/state/user.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);

    return asyncUser.when(
      data: (data) => data != null ? Success(user: data) : const SizedBox.shrink(),
      error: (error, stackTrace) => const Text("error"),
      loading: () => const Text("loading..."),
    );
  }
}

class Success extends StatelessWidget {
  const Success({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(md),
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
                },
                icon: const Icon(Icons.menu),
                iconSize: 34,
              ),
            ],
          ),

          const SizedBox(height: xl),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome back,', style: context.text.titleLarge?.copyWith(color: context.colors.secondary)),
                Text(
                  user.name,
                  style: context.text.displaySmall?.copyWith(fontWeight: FontWeight.w900, color: context.colors.primary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
