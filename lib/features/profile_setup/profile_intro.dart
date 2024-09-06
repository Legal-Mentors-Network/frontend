import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/state/auth.dart';

class ProfileIntro extends ConsumerWidget {
  const ProfileIntro({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: context.colors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(rl),
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

              //
              Flexible(
                flex: 7,
                child: Column(
                  children: [
                    Text(
                      'Hello Barry',
                      style: context.text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),

                    const SizedBox(height: lg),

                    //
                    SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final item = data[index];
                          return ListTile(
                            leading: Icon(
                              item.icon,
                              color: context.colors.secondary,
                              size: xl,
                            ),
                            title: Text(item.title),
                          );
                        },
                      ),
                    ),

                    //
                    const SizedBox(height: xl),

                    //
                    FilledButton(
                      child: const Text('Setup your profile (logout)'),
                      onPressed: () {
                        ref.read(auth.notifier).logout();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Content {
  final String title;
  final IconData icon;

  Content({
    required this.title,
    required this.icon,
  });
}

final List<Content> data = [
  Content(
    title: 'Answer a few questions and build out your profile',
    icon: Icons.people,
  ),
  Content(
    title: 'Contrary to popular belief, Lorem Ipsum is not simply random text',
    icon: Icons.mood_rounded,
  ),
  Content(
    title: 'It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old',
    icon: Icons.rocket,
  ),
];
