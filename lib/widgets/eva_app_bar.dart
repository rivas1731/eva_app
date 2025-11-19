import 'package:flutter/material.dart';

/// Reusable top navigation bar that mimics the Home screen style.
class EvaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const EvaAppBar({
    super.key,
    required this.title,
    this.subtitle,
    this.actions,
    this.showBackButton = true,
  });

  final String title;
  final String? subtitle;
  final List<Widget>? actions;
  final bool showBackButton;

  @override
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return AppBar(
      backgroundColor: Colors.yellow.shade700,
      foregroundColor: Colors.black87,
      elevation: 0,
      automaticallyImplyLeading: showBackButton,
      toolbarHeight: preferredSize.height,
      leadingWidth: showBackButton ? 56 : null,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
              onPressed: () => Navigator.of(context).maybePop(),
            )
          : null,
      actions: actions,
      titleSpacing: showBackButton ? 0 : null,
      title: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.yellow.shade200,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.bolt, color: Colors.black87),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: textTheme.bodySmall?.copyWith(color: Colors.black54),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
