import 'package:flutter/material.dart';

class SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  const SliverCustomHeaderDelegate({
    required this.height,
    required this.child,
  });
  final double height;
  final Widget child;

  @override
  Widget build(_, __, ___) => SizedBox.expand(child: child);

  @override
  double get maxExtent => height;

  @override
  double get minExtent => height;

  @override
  bool shouldRebuild(SliverCustomHeaderDelegate oldDelegate) =>
      this.height != oldDelegate.height || this.child != oldDelegate.child;
}
