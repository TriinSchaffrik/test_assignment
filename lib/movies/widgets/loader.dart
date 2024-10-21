import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key, this.size = 5});

  final double size;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: SizedBox(
        height: 8 * size,
        width: 8 * size,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircularProgressIndicator(
              strokeWidth: 0.3 * size, color: theme.dividerColor),
        ),
      ),
    );
  }
}
