import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/state/auth.dart';

class Welcome extends ConsumerWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: xl),
      child: Column(
        children: [
          const Spacer(),

          //
          Flexible(
            flex: 7,
            child: Center(
              child: Image.asset(
                'assets/images/LMN.png',
              ),
            ),
          ),

          Flexible(
            flex: 7,
            child: Column(
              children: [
                Text(
                  'Welcome',
                  style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                ),

                //
                const SizedBox(height: md),

                //
                const Text(
                  'We facitilate on-demand extensive support \n on first contact lorem ipsum.',
                  textAlign: TextAlign.center,
                ),

                //
                const SizedBox(height: xl),

                //
                FilledButton(
                  child: const Text('Get Started (login)'),
                  onPressed: () {
                    ref.read(auth.notifier).login("mcorleone@mail.com", "Password123");
                  },
                ),

                //
                const SizedBox(height: md),

                //
                FilledButton(
                  child: const Text('I already have an account'),
                  onPressed: () {
                    ref.read(auth.notifier).login("yellow@mail.com", "Password123");
                  },
                ),
              ],
            ),
          ),
          //
        ],
      ),
    );
  }
}
