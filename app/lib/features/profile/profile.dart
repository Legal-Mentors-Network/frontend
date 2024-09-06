import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';
import 'package:lmn/features/profile/profile_field.dart';
import 'package:lmn/state/user.dart';

class Profile extends ConsumerWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userProvider.notifier).user;
    final Size size = MediaQuery.sizeOf(context);

    if (user == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: rl),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      user.name,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w700),
                    ),

                    // hard coded for now
                    Text(
                      'Just a tagline',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),

                //
                UserImage(image: user.image),
              ],
            ),

            //
            const SizedBox(height: xl * 1.5),

            //
            Text(
              'My Details',
              style: context.text.titleMedium?.copyWith(fontWeight: FontWeight.w700),
            ),

            //
            const SizedBox(height: lg),

            //
            ProfileField(field: 'name', value: user.name),
            ProfileField(field: 'age', value: user.age.toString()),
            ProfileField(
              field: 'location',
              value: user.location,
            ),
          ],
        ),
      ),
    );
  }
}

class UserImage extends StatelessWidget {
  const UserImage({super.key, this.image = ""});

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image == null || image!.isEmpty) {
      return CircleAvatar(
        radius: 45,
        backgroundColor: context.colors.primaryContainer.withOpacity(0.85),
        child: Icon(
          Icons.person,
          size: mx * 1.75,
          color: context.colors.onSecondary,
        ),
      );
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: image!,
        height: 90,
        width: 90,
        fit: BoxFit.cover,
      ),
    );
  }
}
