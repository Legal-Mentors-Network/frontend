import 'package:flutter/material.dart';
import 'package:lmn/common/theme/constants.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
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
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700),
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
                  child: const Text('Get Started'),
                  onPressed: () {},
                ),

                //
                const SizedBox(height: md),

                //
                FilledButton(
                  child: const Text('I already have an account'),
                  onPressed: () {},
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
