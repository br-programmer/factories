import 'package:flutter/material.dart';
import 'package:factories/features/detail/presentation/widgets/widgets.dart'
    hide DetailLayout;

class DetailLayout extends StatelessWidget {
  const DetailLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: const [AppBarDetail(), Description()],
    );
  }
}
