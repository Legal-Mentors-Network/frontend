import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lmn/common/extensions.dart';
import 'package:lmn/common/theme/constants.dart';

class ProfileField extends ConsumerStatefulWidget {
  const ProfileField({
    super.key,
    required this.field,
    required this.value,
  });

  final String field;
  final String value;

  @override
  ConsumerState<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends ConsumerState<ProfileField> {
  bool isEditing = false;
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    void done() {
      setState(() {
        isEditing = false;
      });
    }

    Widget child = ProfileFieldContainer(
      key: const ValueKey(1),
      child: ProfileDefaultTextField(
        field: widget.field,
        value: widget.value,
        editField: () => setState(() {
          isEditing = true;
        }),
      ),
    );

    if (isEditing) {
      child = ProfileFieldContainer(
        key: const ValueKey(2),
        color: Theme.of(context).colorScheme.primaryContainer,
        child: ProfileEditableTextField(
          value: widget.value,
          close: () => setState(() {
            isEditing = false;
          }),
          done: done,
        ),
      );
    }

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: child,
    );
  }
}

class ProfileDefaultTextField extends StatelessWidget {
  const ProfileDefaultTextField({
    super.key,
    required this.field,
    required this.value,
    required this.editField,
  });

  final String field;
  final String value;
  final void Function() editField;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                field.capitalize(),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w500),
              ),

              //
              TextField(
                decoration: InputDecoration(
                  isCollapsed: true,
                  border: InputBorder.none,
                  hintText: value,
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  enabled: false,
                ),
              ),
            ],
          ),
        ),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: editField,
              icon: const Icon(Icons.edit),
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileEditableTextField extends StatelessWidget {
  const ProfileEditableTextField({
    super.key,
    required this.value,
    required this.close,
    required this.done,
  });

  final String value;
  final void Function() close;
  final void Function() done;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: TextField(
            style: TextStyle(color: Theme.of(context).colorScheme.onSecondary),
            decoration: InputDecoration(
              isCollapsed: true,
              border: InputBorder.none,
              hintText: value,
              hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Theme.of(context).colorScheme.onSecondary),
            ),
          ),
        ),

        //
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: close,
              icon: const Icon(Icons.close),
              color: Theme.of(context).colorScheme.onSecondary,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),

            //
            IconButton(
              onPressed: done,
              icon: const Icon(Icons.done),
              color: Theme.of(context).colorScheme.onSecondary,
              style: const ButtonStyle(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileFieldContainer extends StatelessWidget {
  const ProfileFieldContainer({
    super.key,
    required this.child,
    this.color,
  });

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 14.0),
      margin: const EdgeInsets.only(bottom: md),
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.all(Radius.circular(sm)),
      ),
      child: child,
    );
  }
}
