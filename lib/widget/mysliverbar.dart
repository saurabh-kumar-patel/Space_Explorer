import 'package:apod/widget/custom_theme/theme.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  final String text;

  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title,
    required this.text,
  });
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 380,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      backgroundColor: Backcolor,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: Text(
        text,
        style: const TextStyle(
            color: Textcolor, fontSize: 25, fontWeight: FontWeight.bold),
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
